/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;
import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class TKDichVu extends  DichVu{
    private float tyle;
    private int soLan;

    public TKDichVu(float tyle, int soLan) {
        this.tyle = tyle;
        this.soLan = soLan;
    }

    public TKDichVu(float tyle, int soLan, int id, String ten, BigInteger giaCa, int gioiHan, String moTa, LocalDateTime ngayTao, LocalDateTime ngayXoa) {
        super(id, ten, giaCa, gioiHan, moTa, ngayTao, ngayXoa);
        this.tyle = tyle;
        this.soLan = soLan;
    }

    public TKDichVu(float tyle, int soLan, String ten, BigInteger giaCa) {
        super(ten, giaCa, 0, "", null, null);
        this.tyle = tyle;
        this.soLan = soLan;
    }

    public float getTyle() {
        return tyle;
    }

    public void setTyle(float tyle) {
        this.tyle = tyle;
    }

    public int getSoLan() {
        return soLan;
    }

    public void setSoLan(int soLan) {
        this.soLan = soLan;
    }
    
}
