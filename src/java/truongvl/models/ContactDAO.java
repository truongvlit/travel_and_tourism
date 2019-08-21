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
import truongvl.dtos.ContactDTO;

/**
 *
 * @author Nero
 */
public class ContactDAO implements Serializable {
    
    public boolean insert(String tourId, ContactDTO dto) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Contact(ContactID, TourID, Name, Address, Email, Phone) "
                + "VALUES(?, ?, ?, ?, ?, ?)";
        if (findContactId(tourId, dto) != null) {
            check = true;
        }
        else {
            try (
                    Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);
                    ) {
                String id = tourId + "-" + dto.getName() + "-" + dto.getAddress()
                        + "-" + dto.getEmail() + "-" + dto.getPhone();
                preStm.setString(1, id);
                preStm.setString(2, tourId);
                preStm.setString(3, dto.getName());
                preStm.setString(4, dto.getAddress());
                preStm.setString(5, dto.getEmail());
                preStm.setString(6, dto.getPhone());
                check = preStm.executeUpdate() > 0;
            }
        }
        return check;
    }
    
    public String findContactId(String tourId, ContactDTO dto) throws Exception {
        String contactId = null;
        String sql = "SELECT ContactID FROM Contact "
                + "WHERE TourID = ? AND Name = ? AND Address = ? AND Email = ? AND Phone = ?";
        try (
                Connection conn = MyConnection.getMyConnection();
                PreparedStatement preStm = conn.prepareStatement(sql);
                ) {
            preStm.setString(1, tourId);
            preStm.setString(2, dto.getName());
            preStm.setString(3, dto.getAddress());
            preStm.setString(4, dto.getEmail());
            preStm.setString(5, dto.getPhone());
            try (ResultSet rs = preStm.executeQuery()) {
                if (rs.next()) {
                    contactId = rs.getString("ContactID");
                }
            }
        }
        return contactId;
    }
}
