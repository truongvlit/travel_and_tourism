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
import truongvl.dtos.TicketDTO;
import truongvl.tools.Tools;

/**
 *
 * @author Nero
 */
public class TicketDAO implements Serializable {
    
    public boolean insert(String tourId, String touristId, Float ticketPrice, String contactId, String username) throws Exception {
        boolean check = false;
        Tools tools = new Tools();
        String sql = "INSERT INTO Ticket(TourID, TouristID, BookDate, TicketPrice, ContactID, BookedBy) "
                + "VALUES(?, ?, ?, ?, ?, ?)";
        try(
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, tourId);
            preStm.setString(2, touristId);
            preStm.setTimestamp(3, tools.getCurrentDate());
            preStm.setFloat(4, ticketPrice);
            preStm.setString(5, contactId);
            preStm.setString(6, username);
            check = preStm.executeUpdate() > 0;
        }
        return check;
    }
    
    public int getListSize(String username) throws Exception {
        int size = 0;
        String sql = "SELECT COUNT(*) AS Size FROM Ticket WHERE BookedBy = ?";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ){
            preStm.setString(1, username);
            try (ResultSet rs = preStm.executeQuery()) {
                if (rs.next())
                    size = Integer.parseInt(rs.getString("Size"));
            }
        }
        return size;
    }
    
    public List<TicketDTO> searchPurchasedTicket(String username) throws Exception {
        List<TicketDTO> list = null;        
        String sql = "SELECT TicketID, TourID, TouristID, BookDate, TicketPrice FROM Ticket "
                + "WHERE BookedBy = ?";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, username);
            list = new ArrayList<>();
            try (ResultSet rs = preStm.executeQuery()) {
                while (rs.next()) {
                    String ticketId = rs.getString("TicketID");
                    String tourId = rs.getString("TourID");
                    String touristId = rs.getString("TouristID");
                    String bookDate = rs.getTimestamp("BookDate").toString();
                    float ticketPrice = rs.getFloat("TicketPrice");
                    TicketDTO dto = new TicketDTO(ticketId, tourId, touristId, bookDate, bookDate, ticketPrice);
                    list.add(dto);
                }
            }
        }
        return list;
    }
    
    public List<TicketDTO> getTicketByPage(int start, int end, String username) throws Exception {
        List<TicketDTO> list = null;
        String sql = "WITH OrderedTickets AS "
                + "(SELECT TicketID, ROW_NUMBER() "
                + "OVER (ORDER BY TicketID ASC) AS Row FROM Ticket) "
                + "SELECT Row, OrderedTickets.TicketID, TourID, TouristID, BookDate, TicketPrice, ContactID "
                + "FROM OrderedTickets, Ticket "
                + "WHERE OrderedTickets.TicketID = Ticket.TicketID "
                + "AND Ticket.BookedBy = ? "
                + "AND Row BETWEEN " + start + " AND " + end;
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ){
            preStm.setString(1, username);
            try (ResultSet rs = preStm.executeQuery()) {
                list = new ArrayList<>();
                while (rs.next()) {
                    String ticketId = rs.getString("TicketID");
                    String tourId = rs.getString("TourID");
                    String touristId = rs.getString("TouristID");
                    String bookDate = rs.getTimestamp("BookDate").toString();
                    float ticketPrice = rs.getFloat("TicketPrice");
                    String contactId = rs.getString("ContactID");
                    TicketDTO tour = new TicketDTO(ticketId, tourId, touristId, bookDate, contactId, username, ticketPrice);
                    list.add(tour);
                }
            }
        }
        return list;
    }
    
    public int loadFullListSize() throws Exception {
        int size = 0;
        String sql = "SELECT COUNT(*) AS Size FROM Ticket";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ResultSet rs = preStm.executeQuery();
                ) {
            if (rs.next()) size = Integer.parseInt(rs.getString("Size"));
        }
        return size;
    }
    
    public List<TicketDTO> loadTicket(int start, int end) throws Exception {
        List<TicketDTO> list = null;
        String sql = "WITH OrderedTickets AS "
                + "(SELECT TicketID, ROW_NUMBER() "
                + "OVER (ORDER BY TicketID ASC) AS Row FROM Ticket) "
                + "SELECT Row, OrderedTickets.TicketID, TourID, TouristID, BookDate, TicketPrice, BookedBy, ContactID "
                + "FROM OrderedTickets, Ticket "
                + "WHERE OrderedTickets.TicketID = Ticket.TicketID "
                + "AND Ticket.Status = 'False' "
                + "AND Row BETWEEN " + start + " AND " + end;
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ResultSet rs = preStm.executeQuery();
                ){
            list = new ArrayList<>();
            while (rs.next()){
                String ticketId = rs.getString("TicketID");
                String tourId = rs.getString("TourID");
                String touristId = rs.getString("TouristID");
                String bookDate = rs.getTimestamp("BookDate").toString();
                float price = rs.getFloat("TicketPrice");
                String contactId = rs.getString("ContactID");
                String bookedBy = rs.getString("BookedBy");
                TicketDTO dto = new TicketDTO(ticketId, tourId, touristId, bookDate, contactId, bookedBy, price);
                list.add(dto);
            }
        }
        return list;
    }
    
    public boolean checkTicket(String ticketId) throws Exception {
        boolean check = false;
        String sql = "UPDATE Ticket SET Status = '1' WHERE TicketID = ?";
        try(
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, ticketId);
            check = preStm.executeUpdate() > 0;
        }
        return check;
    }
}
