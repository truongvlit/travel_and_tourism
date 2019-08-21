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
public class TouristErrorObject implements Serializable {
    
    private String nameError[], phoneError[], addressError[], 
            genderError[], nationalityError[], passportError[];

    public TouristErrorObject(String[] nameError, String[] phoneError, String[] addressError, String[] genderError, String[] nationalityError, String[] passportError) {
        this.nameError = nameError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.genderError = genderError;
        this.nationalityError = nationalityError;
        this.passportError = passportError;
    }

    public TouristErrorObject() {
    }

    public String[] getNameError() {
        return nameError;
    }

    public void setNameError(String[] nameError) {
        this.nameError = nameError;
    }

    public String[] getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String[] phoneError) {
        this.phoneError = phoneError;
    }

    public String[] getAddressError() {
        return addressError;
    }

    public void setAddressError(String[] addressError) {
        this.addressError = addressError;
    }

    public String[] getGenderError() {
        return genderError;
    }

    public void setGenderError(String[] genderError) {
        this.genderError = genderError;
    }

    public String[] getNationalityError() {
        return nationalityError;
    }

    public void setNationalityError(String[] nationalityError) {
        this.nationalityError = nationalityError;
    }

    public String[] getPassportError() {
        return passportError;
    }

    public void setPassportError(String[] passportError) {
        this.passportError = passportError;
    }

}
