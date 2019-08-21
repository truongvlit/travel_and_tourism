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
public class TourDTO implements Serializable {
    String id, category, name, startTime, endTime, destination, description, image;
    Float infantPrice, childPrice, adultPrice;
    Integer seatAvailable;
    
    public TourDTO() {
        
    }

    public TourDTO(String id, String category, String name, String startTime, String endTime, String destination, String description, Float infantPrice, Float childPrice, Float adultPrice, Integer seatAvailable, String image) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.startTime = startTime;
        this.endTime = endTime;
        this.destination = destination;
        this.description = description;
        this.infantPrice = infantPrice;
        this.childPrice = childPrice;
        this.adultPrice = adultPrice;
        this.seatAvailable = seatAvailable;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getInfantPrice() {
        return infantPrice;
    }

    public void setInfantPrice(Float infantPrice) {
        this.infantPrice = infantPrice;
    }

    public Float getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(Float childPrice) {
        this.childPrice = childPrice;
    }

    public Float getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(Float adultPrice) {
        this.adultPrice = adultPrice;
    }

    public Integer getSeatAvailable() {
        return seatAvailable;
    }

    public void setSeatAvailable(Integer seatAvailable) {
        this.seatAvailable = seatAvailable;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}