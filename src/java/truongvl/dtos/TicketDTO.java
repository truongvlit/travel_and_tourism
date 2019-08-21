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
public class TicketDTO implements Serializable {
    
    private String ticketId, tourId, touristId, bookDate, contactId, bookedBy;
    Float price;
    
    public TicketDTO() {
    }

    public TicketDTO(String ticketId, String tourId, String touristId, String bookDate, String bookedBy, Float price) {
        this.ticketId = ticketId;
        this.tourId = tourId;
        this.touristId = touristId;
        this.bookDate = bookDate;
        this.bookedBy = bookedBy;
        this.price = price;
    }

    
    public TicketDTO(String ticketId, String tourId, String touristId, String bookDate, String contactId, String bookedBy, Float price) {
        this.ticketId = ticketId;
        this.tourId = tourId;
        this.touristId = touristId;
        this.bookDate = bookDate;
        this.contactId = contactId;
        this.bookedBy = bookedBy;
        this.price = price;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public String getTourId() {
        return tourId;
    }

    public void setTourId(String tourId) {
        this.tourId = tourId;
    }

    public String getTouristId() {
        return touristId;
    }

    public void setTouristId(String touristId) {
        this.touristId = touristId;
    }

    public String getBookDate() {
        return bookDate;
    }

    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }

    public String getContactId() {
        return contactId;
    }

    public void setContactId(String contactId) {
        this.contactId = contactId;
    }

    public String getBookedBy() {
        return bookedBy;
    }

    public void setBookedBy(String bookedBy) {
        this.bookedBy = bookedBy;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
    
}
