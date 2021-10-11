/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;
import java.sql.Date;
/**
 *
 * @author admin
 */
public class DichVu {
    private int id;
    private String ten;
    private BigInteger giaCa;
    private int gioiHan;
    private String moTa;
    private Date ngayTao;
    private Date ngayXoa;

    public DichVu() {
    }

    public DichVu(int id, String ten, BigInteger giaCa, int gioiHan, String moTa, Date ngayTao, Date ngayXoa) {
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
        
        return id+" "+ten+" "+ngayTao+" "+ngayXoa;//To change body of generated methods, choose Tools | Templates.
    }

   
    
}
