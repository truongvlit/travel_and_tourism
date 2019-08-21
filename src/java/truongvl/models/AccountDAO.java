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
import truongvl.dtos.AccountDTO;
import truongvl.tools.Tools;

/**
 *
 * @author Nero
 */
public class AccountDAO implements Serializable {
    
    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;
    
    private void closeConnection() throws Exception {
        if (rs != null) rs.close();
        if (preStm != null) preStm.close();
        if (conn != null) conn.close();
    }
    
    public String getRole(String username) throws Exception {
        String role = null;
        String sql = "SELECT IsAdmin FROM Account WHERE Username = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                if (rs.getBoolean("IsAdmin")) {
                    role = "admin";
                } else {
                    role = "user";
                }
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public String checkLogin(String username, String password) throws Exception {
        String role = "failed";
        String sql = "SELECT IsAdmin FROM Account WHERE Username = ? AND Password = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                if (rs.getBoolean("IsAdmin")) {
                    role = "admin";
                } else {
                    role = "user";
                }
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public AccountDTO getAccountInfo(String username) throws Exception {
        AccountDTO dto = null;
        Tools tools = new Tools();
        String fullname, address, birthday, phone, email;
        boolean gender;
        String sql = "SELECT Fullname, Birthday, Address, Phone, Email, Gender FROM Account WHERE Username = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                fullname = rs.getString("Fullname") == null ? "" : rs.getString("Fullname");
                birthday = rs.getDate("Birthday") == null ? "" : tools.sqlToUtil(rs.getDate("Birthday"));
                address = rs.getString("Address") == null ? "" : rs.getString("Address");
                phone = rs.getString("Phone") == null ? "" : rs.getString("Phone");
                email = rs.getString("Email") == null ? "" : rs.getString("Email");
                gender = rs.getBoolean("Gender");
                dto = new AccountDTO(username, fullname, address, birthday, email, phone, gender);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean updateAccount(String fullname, String address, String birthday, String email, String phone, String username, boolean gender) throws Exception {
        boolean check = false;
        Tools tools = new Tools();
        String sql = "UPDATE Account SET Fullname = ?, Address = ?, Birthday = ?, Email = ?, Phone = ?, Gender = ? "
                + "WHERE Username = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, fullname);
            preStm.setString(2, address);
            preStm.setDate(3, birthday == null ? null : tools.utilToSql(birthday));
            preStm.setString(4, email);
            preStm.setString(5, phone);
            preStm.setBoolean(6, gender);
            preStm.setString(7, username);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updatePassword(String username, String password) throws Exception {
        boolean check = false;
        String sql = "UPDATE Account SET Password = ? WHERE Username = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, password);
            preStm.setString(2, username);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean checkSignup(String username, String password, String fullname, String address, String email, String phone) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Account(Username, Password, Fullname, Address, Email, Phone) VALUES(?,?,?,?,?,?)";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            preStm.setString(3, fullname);
            preStm.setString(4, address);
            preStm.setString(5, email);
            preStm.setString(6, phone);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
