/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.mysql.cj.result.LocalDateTimeValueFactory;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.*;
import java.time.*;
import utils.FormateDateTime;
import static utils.FormateDateTime.formatDateTimeVi;
/**
 *
 * @author admin
 */
public class TKDoanhThu {
    private BigInteger tongDoanhThu;
    private Date ngay;

    public TKDoanhThu() {
    }

    public TKDoanhThu(BigInteger tongDoanhThu, Date ngay) {
        this.tongDoanhThu = tongDoanhThu;
        this.ngay = ngay;
    }

    @Override
    public String toString() {
        return tongDoanhThu + " " + ngay;
    }
    

    public BigInteger getTongDoanhThu() {
        return tongDoanhThu;
    }

    public Date getNgay() {
        return ngay;
    }

 
    
}
