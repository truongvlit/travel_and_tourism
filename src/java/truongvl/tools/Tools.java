/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.tools;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

/**
 *
 * @author Nero
 */
public class Tools implements Serializable {
    
    public java.time.LocalDate strToDate(String date) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        java.util.Date utilDate = new java.util.Date(dateFormat.parse(date).getTime());
        return utilDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }
    
    public java.sql.Date utilToSql(String date) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        java.sql.Date sqlDate = new java.sql.Date(dateFormat.parse(date).getTime());
        return sqlDate;
    }
    
    public String sqlToUtil(java.sql.Date sqlDate) throws Exception {
        String result = null;
        java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        result = dateFormat.format(utilDate);
        return result;
    }
    
    public boolean checkDate(String date) throws Exception {
        boolean check  = false;
        java.util.Date currentDate = new java.util.Date();
        java.time.LocalDate localCurrentDate = currentDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        java.time.LocalDate localDate = strToDate(date);
        if (ChronoUnit.DAYS.between(localCurrentDate, localDate) >= 7) check = true;
        return check;
    }
    
    public boolean checkTwoDates(String startTime, String endTime) throws Exception {
        boolean check = false;
        java.time.LocalDate localStartTime = strToDate(startTime);
        java.time.LocalDate localEndTime = strToDate(endTime);
        if (ChronoUnit.DAYS.between(localStartTime, localEndTime) >= 0) check = true;
        return check;
    }
    
    public java.sql.Timestamp getCurrentDate() throws Exception {
        return new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
    }
}
