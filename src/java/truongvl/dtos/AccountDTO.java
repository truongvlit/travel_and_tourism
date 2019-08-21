/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.dtos;

import java.io.Serializable;

/**
 *
 * @author Nero
 */
public class AccountDTO implements Serializable {
    
    private String username, password, fullname, address, birthday, email, phone;
    boolean gender;

    public AccountDTO() {
    }

    public AccountDTO(String username, String password, String fullname) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }
    
    public AccountDTO(String username, String fullname, String address, String birthday, String email, String phone) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
    }
    
    public AccountDTO(String username, String fullname, String address, String email, String phone) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public AccountDTO(String username, String fullname, String address, String birthday, String email, String phone, boolean gender) {
        this.username = username;
        this.fullname = fullname;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
}
