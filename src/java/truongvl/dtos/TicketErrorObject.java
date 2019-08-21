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
public class TicketErrorObject implements Serializable {
    
    private String ticketIdError, tourIdError, touristIdError, 
            bookDateError, contactIdError, bookedByError, priceError;

    public TicketErrorObject() {
    }

    public String getTicketIdError() {
        return ticketIdError;
    }

    public void setTicketIdError(String ticketIdError) {
        this.ticketIdError = ticketIdError;
    }

    public String getTourIdError() {
        return tourIdError;
    }

    public void setTourIdError(String tourIdError) {
        this.tourIdError = tourIdError;
    }

    public String getTouristIdError() {
        return touristIdError;
    }

    public void setTouristIdError(String touristIdError) {
        this.touristIdError = touristIdError;
    }

    public String getBookDateError() {
        return bookDateError;
    }

    public void setBookDateError(String bookDateError) {
        this.bookDateError = bookDateError;
    }

    public String getContactIdError() {
        return contactIdError;
    }

    public void setContactIdError(String contactIdError) {
        this.contactIdError = contactIdError;
    }

    public String getBookedByError() {
        return bookedByError;
    }

    public void setBookedByError(String bookedByError) {
        this.bookedByError = bookedByError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }
    
    
}
