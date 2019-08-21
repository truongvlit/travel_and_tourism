/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.models;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import truongvl.db.MyConnection;
import truongvl.dtos.TourDTO;
import truongvl.tools.Tools;

/**
 *
 * @author Nero
 */
public class TourDAO implements Serializable {

    Connection conn = null;
    PreparedStatement preStm = null;
    ResultSet rs = null;
    List<TourDTO> list = null;

    public TourDAO() {

    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean insertTour(String category, String name, String startTime,
            String endTime, String destination, Float infantPrice, Float childPrice, Float adultPrice,
            int seatAvailable, String description, String image) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Tour(ID, Category, "
                + "Name, StartTime, EndTime, Destination, TicketPriceForInfant, TicketPriceForChild, "
                + "TicketPriceForAdult, SeatAvailable, Description, Image) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String id = category + "-" + name + "-" + startTime + "-" + endTime;
        Tools tools = new Tools();
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            preStm.setString(2, category);
            preStm.setString(3, name);
            preStm.setDate(4, tools.utilToSql(startTime));
            preStm.setDate(5, tools.utilToSql(endTime));
            preStm.setString(6, destination);
            preStm.setFloat(7, infantPrice);
            preStm.setFloat(8, childPrice);
            preStm.setFloat(9, adultPrice);
            preStm.setInt(10, seatAvailable);
            preStm.setString(11, description.equals("") ? null : description);
            preStm.setString(12, image);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
   
    public int getListSize() throws Exception {
        int size = 0;
        String sql = "SELECT COUNT(*) AS Size FROM Tour";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next())
                size = Integer.parseInt(rs.getString("Size"));
        } finally {
            closeConnection();
        }
        return size;
    }

    public int getSearchListSize(String search) throws Exception {
        int size = 0;
        String sql = "SELECT COUNT(*) AS Size FROM Tour WHERE "
                + "Category LIKE ? OR Name LIKE ? OR Destination LIKE ? ";                
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            preStm.setString(2, "%" + search + "%");
            preStm.setString(3, "%" + search + "%");
            rs = preStm.executeQuery();
            if (rs.next()) size = Integer.parseInt(rs.getString("Size"));
        } finally {
            closeConnection();
        }
        return size;
    }
    
    public List<TourDTO> getTourByPage(int start, int end, String search) throws Exception {
        String sql;
        String sqlView = "WITH OrderedTours AS "
                + "(SELECT ID, ROW_NUMBER() "
                + "OVER (ORDER BY Category, Name, StartTime, EndTime ASC) AS Row FROM Tour) "
                + "SELECT Row, OrderedTours.ID, Category, Name, StartTime, EndTime, Destination, "
                + "TicketPriceForInfant, TicketPriceForChild, TicketPriceForAdult, "
                + "SeatAvailable, Description, Image "
                + "FROM OrderedTours, Tour "
                + "WHERE OrderedTours.ID = Tour.ID "
                + "AND Row BETWEEN " + start + " AND " + end;
        String sqlSearch = "WITH Temp AS "
                + "(SELECT ID, ROW_NUMBER() "
                + "OVER (ORDER BY Category, Name, StartTime, EndTime ASC) AS Row FROM Tour "
                + "WHERE Category LIKE ? OR Name LIKE ? OR Destination LIKE ? ) "
                + "SELECT Row, Temp.ID, Category, Name, StartTime, EndTime, Destination, "
                + "TicketPriceForInfant, TicketPriceForChild, TicketPriceForAdult, "
                + "SeatAvailable, Description, Image "
                + "FROM Tour, Temp "
                + "WHERE Tour.ID = Temp.ID "
                + "AND Row BETWEEN " + start + " AND " + end;
        if (search == null) sql = sqlView;
        else sql = sqlSearch;
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            if (sql.equals(sqlSearch)) {
                for (int i = 1; i <= 3; i++) {
                    preStm.setString(i, "%" + search + "%");
                }
            }
            rs = preStm.executeQuery();
            Tools tools = new Tools();
            list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("ID");
                String category = rs.getString("Category");
                String name = rs.getString("Name");
                String startTime = tools.sqlToUtil(rs.getDate("StartTime"));
                String endTime = tools.sqlToUtil(rs.getDate("EndTime"));
                String destination = rs.getString("Destination");
                Float infantPrice = rs.getFloat("TicketPriceForInfant");
                Float childPrice = rs.getFloat("TicketPriceForChild");
                Float adultPrice = rs.getFloat("TicketPriceForAdult");
                int seatAvailable = rs.getInt("SeatAvailable");
                String description = rs.getString("Description");
                String image = rs.getString("Image");
                TourDTO tour = new TourDTO(id, category, name, startTime, endTime, destination, description, infantPrice, childPrice, adultPrice, seatAvailable, image);
                list.add(tour);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public boolean deleteTour(String id) throws Exception {
        boolean check = false;
        String sql = "DELETE FROM Tour WHERE ID = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public TourDTO getTourById(String id) throws Exception {
        TourDTO dto = null;
        Tools tools = new Tools();
        String sql = "SELECT ID, Category, Name, StartTime, EndTime, Destination, "
                + "TicketPriceForInfant, TicketPriceForChild, TicketPriceForAdult, "
                + "SeatAvailable, Description, Image FROM Tour "
                + "WHERE ID = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String category = rs.getString("Category");
                String name = rs.getString("Name");
                String startTime = tools.sqlToUtil(rs.getDate("StartTime"));
                String endTime = tools.sqlToUtil(rs.getDate("EndTime"));
                String destination = rs.getString("Destination");
                Float infantPrice = rs.getFloat("TicketPriceForInfant");
                Float childPrice = rs.getFloat("TicketPriceForChild");
                Float adultPrice = rs.getFloat("TicketPriceForAdult");
                int seatAvailable = rs.getInt("SeatAvailable");
                String description = rs.getString("Description");
                String image = rs.getString("Image");
                dto = new TourDTO(id, category, name, startTime, endTime, destination, description, infantPrice, childPrice, adultPrice, seatAvailable, image);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean updateSeat(String id, int seatAvailable) throws Exception {
        boolean check = false;
        String sql = "UPDATE Tour SET SeatAvailable = ? WHERE ID = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, seatAvailable);
            preStm.setString(2, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updateTour(String category, String name, String startTime,
            String endTime, String destination, Float infantPrice, Float childPrice, Float adultPrice,
            int seatAvailable, String description, String image, String id) throws Exception {
        boolean check = false;
        String sql = "UPDATE Tour SET Category = ?, "
                + "Name = ?, StartTime = ?, EndTime = ?, Destination = ?, TicketPriceForInfant = ?, TicketPriceForChild = ?, "
                + "TicketPriceForAdult = ?, SeatAvailable = ?, Description = ?, Image = ? "
                + "WHERE ID = ?";
        Tools tools = new Tools();
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, category);
            preStm.setString(2, name);
            preStm.setDate(3, tools.utilToSql(startTime));
            preStm.setDate(4, tools.utilToSql(endTime));
            preStm.setString(5, destination);
            preStm.setFloat(6, infantPrice);
            preStm.setFloat(7, childPrice);
            preStm.setFloat(8, adultPrice);
            preStm.setInt(9, seatAvailable);
            preStm.setString(10, description.equals("") ? null : description);
            preStm.setString(11, image);
            preStm.setString(12, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
