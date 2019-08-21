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
public class TouristDTO implements Serializable {
    private String name[], phone[], address[], gender[], nationality[], passport[];
    private String touristName, touristPhone, touristAddress, touristGender, touristNationality, touristPassport;

    public String getTouristName() {
        return touristName;
    }

    public void setTouristName(String touristName) {
        this.touristName = touristName;
    }

    public String getTouristPhone() {
        return touristPhone;
    }

    public void setTouristPhone(String touristPhone) {
        this.touristPhone = touristPhone;
    }

    public String getTouristAddress() {
        return touristAddress;
    }

    public void setTouristAddress(String touristAddress) {
        this.touristAddress = touristAddress;
    }

    public String getTouristGender() {
        return touristGender;
    }

    public void setTouristGender(String touristGender) {
        this.touristGender = touristGender;
    }

    public String getTouristNationality() {
        return touristNationality;
    }

    public void setTouristNationality(String touristNationality) {
        this.touristNationality = touristNationality;
    }

    public String getTouristPassport() {
        return touristPassport;
    }

    public void setTouristPassport(String touristPassport) {
        this.touristPassport = touristPassport;
    }

    public TouristDTO(String touristName, String touristPhone, String touristAddress, String touristGender, String touristNationality, String touristPassport) {
        this.touristName = touristName;
        this.touristPhone = touristPhone;
        this.touristAddress = touristAddress;
        this.touristGender = touristGender;
        this.touristNationality = touristNationality;
        this.touristPassport = touristPassport;
    }
    
    public TouristDTO() {
    }

    public TouristDTO(String[] name, String[] phone, String[] address, String[] gender, String[] nationality, String[] passport) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.nationality = nationality;
        this.passport = passport;
    }

    public String[] getName() {
        return name;
    }

    public void setName(String[] name) {
        this.name = name;
    }

    public String[] getPhone() {
        return phone;
    }

    public void setPhone(String[] phone) {
        this.phone = phone;
    }

    public String[] getAddress() {
        return address;
    }

    public void setAddress(String[] address) {
        this.address = address;
    }

    public String[] getGender() {
        return gender;
    }

    public void setGender(String[] gender) {
        this.gender = gender;
    }

    public String[] getNationality() {
        return nationality;
    }

    public void setNationality(String[] nationality) {
        this.nationality = nationality;
    }

    public String[] getPassport() {
        return passport;
    }

    public void setPassport(String[] passport) {
        this.passport = passport;
    }

}
