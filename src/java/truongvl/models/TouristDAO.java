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
import truongvl.db.MyConnection;
import truongvl.dtos.TouristDTO;

/**
 *
 * @author Nero
 */
public class TouristDAO implements Serializable {
    
    public boolean insert(String passport, String nationality, String name, String address, String gender, String phone) throws Exception {
        boolean check = false;
        if (isTouristInfoExisted(passport)) {
            String sql = "UPDATE Tourist SET Nationality = ?, Name = ?, Address = ?, Gender = ?, Phone = ? "
                    + "WHERE Passport = ?";
            try (
                    Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);
                    ) {
                preStm.setString(1, nationality);
                preStm.setString(2, name);
                preStm.setString(3, address);
                preStm.setString(4, gender);
                preStm.setString(5, phone);
                preStm.setString(6, passport);
                check = preStm.executeUpdate() > 0;
            }
        } else {
            String sql = "INSERT INTO Tourist(Passport, Nationality, Name, Address, Gender, Phone) "
                + "VALUES(?, ?, ?, ?, ?, ?)";
            try (
                    Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);
                    ) {
                preStm.setString(1, passport);
                preStm.setString(2, nationality);
                preStm.setString(3, name);
                preStm.setString(4, address);
                preStm.setString(5, gender);
                preStm.setString(6, phone);
                check = preStm.executeUpdate() > 0;
            }
        }
        return check;
    }
    
    public boolean isTouristInfoExisted(String passport) throws Exception {
        boolean check = false;
        String sql = "SELECT Passport FROM Tourist WHERE Passport = ?";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, passport);
            try (ResultSet rs = preStm.executeQuery()) {
                if (rs.next()) check = true;
            }
        }
        return check;
    }
    
    public TouristDTO getTouristInfo(String touristId) throws Exception {
        TouristDTO dto = null;
        String sql = "SELECT Nationality, Name, Address, Gender, Phone FROM Tourist "
                + "WHERE Passport = ?";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, touristId);
            try (ResultSet rs = preStm.executeQuery()) {
                if (rs.next()) {                    
                    String nationality = rs.getString("Nationality");
                    String name = rs.getString("Name");
                    String address = rs.getString("Address");
                    String gender = rs.getBoolean("Gender") == true ? "Male" : "Female";
                    String phone = rs.getString("Phone");
                    dto = new TouristDTO(name, phone, address, gender, nationality, touristId);
                }
            }
        }
        return dto;
    }
}
