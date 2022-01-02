/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.mysql.cj.result.LocalDateTimeValueFactory;
import java.math.BigInteger;
import java.sql.*;
import java.time.*;
import java.time.LocalDateTime;
import static utils.FormateDateTime.formatDateTimeVi;
/**
 *
 * @author admin
 */
public class DichVu {
    protected int id;
    protected String ten;
    private BigInteger giaCa;
    private int gioiHan;
    private String moTa;
    private LocalDateTime ngayTao;
    private LocalDateTime ngayXoa;

    public DichVu() {

    }

    public DichVu(int id, String ten, BigInteger giaCa, int gioiHan, String moTa, LocalDateTime ngayTao, LocalDateTime ngayXoa) {
        this.id = id;
        this.ten = ten;
        this.giaCa = giaCa;
        this.gioiHan = gioiHan;
        this.moTa = moTa;
        this.ngayTao = ngayTao;
        this.ngayXoa = ngayXoa;
    }

    @Override
    public String toString() {
        return "" + "" + id + " "+ giaCa + " " + ten + " " + ngayTao +" " + moTa + ' ';
    }

    public DichVu(String ten, BigInteger giaCa, int gioiHan, String moTa, LocalDateTime ngayTao, LocalDateTime ngayXoa) {
        this.ten = ten;
        this.giaCa = giaCa;
        this.gioiHan = gioiHan;
        this.moTa = moTa;
        this.ngayTao = ngayTao;
        this.ngayXoa = ngayXoa;
    }

    

    public int getId() {
        return id;
    }

    public String getTen() {
        return ten;
    }

    public BigInteger getGiaCa() {
        return giaCa;
    }

    public int getGioiHan() {
        return gioiHan;
    }

    public String getMoTa() {
        return moTa;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public LocalDateTime getNgayXoa() {
        return ngayXoa;
    }

   
    
}
