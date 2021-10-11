/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.time.LocalDateTime;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
/**
 *
 * @author admin
 */
public class FormateDateTime { 
    private static final Time m = Time.valueOf(LocalTime.MIN);
    public static LocalDateTime convertDBToLocalDateTime( Date date,Time time){
        if(date == null || time == null) return null;
       Timestamp ts = new Timestamp(date.getTime()+time.getTime()-m.getTime());
        return ts.toLocalDateTime();
    }
    public static String formatDateTimeVi(LocalDateTime ldt){
        if (ldt == null) return "";
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
        return ldt.format(myFormatObj);
    }
    public static LocalDateTime convertParamToLocalDateTime(String s){
        String[] s1 = s.split("T");
        String[] s2 = s1[1].split("%3A");
        return convertDBToLocalDateTime(Date.valueOf(s1[0]), Time.valueOf(s2[0]+":"+s2[1]+":00"));
    }
}
