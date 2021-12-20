/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;

/**
 *
 * @author admin
 */
public class HoaDonDichVu {
    private int id;
    private DichVu dichVu;
    private int soLuong;
    private BigInteger giaDV;
    public HoaDonDichVu(int id, DichVu dichVu, int soLuong) {
        this.id = id;
        this.dichVu = dichVu;
        this.soLuong = soLuong;
        this.giaDV=dichVu.getGiaCa();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DichVu getDichVu() {
        return dichVu;
    }

    public void setDichVu(DichVu dichVu) {
        this.dichVu = dichVu;
        this.giaDV=dichVu.getGiaCa();
    }

    public BigInteger getGiaDV() {
        return giaDV;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
}
