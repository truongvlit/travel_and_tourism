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
public class TourErrorObject implements Serializable {
    
    private String categoryError, nameError, destinationError, descriptionError;
    private String startTimeError, endTimeError;
    private String infantPriceError, childPriceError, adultPriceError;
    private String seatError, imageError;

    public TourErrorObject() {
    }

    public String getCategoryError() {
        return categoryError;
    }

    public void setCategoryError(String categoryError) {
        this.categoryError = categoryError;
    }

    public String getStartTimeError() {
        return startTimeError;
    }

    public void setStartTimeError(String startTimeError) {
        this.startTimeError = startTimeError;
    }

    public String getEndTimeError() {
        return endTimeError;
    }

    public void setEndTimeError(String endTimeError) {
        this.endTimeError = endTimeError;
    }

    public String getInfantPriceError() {
        return infantPriceError;
    }

    public void setInfantPriceError(String infantPriceError) {
        this.infantPriceError = infantPriceError;
    }

    public String getChildPriceError() {
        return childPriceError;
    }

    public void setChildPriceError(String childPriceError) {
        this.childPriceError = childPriceError;
    }

    public String getAdultPriceError() {
        return adultPriceError;
    }

    public void setAdultPriceError(String adultPriceError) {
        this.adultPriceError = adultPriceError;
    }

    public String getSeatError() {
        return seatError;
    }

    public void setSeatError(String seatError) {
        this.seatError = seatError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getDestinationError() {
        return destinationError;
    }

    public void setDestinationError(String destinationError) {
        this.destinationError = destinationError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }
}
