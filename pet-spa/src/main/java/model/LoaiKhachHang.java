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
public class LoaiKhachHang {
    private int id;
    private String loai;
    private float khuyenMai;
    private BigInteger dinhMuc;

    public LoaiKhachHang(int id, String loai, float khuyenMai, BigInteger dinhMuc) {
        this.id = id;
        this.loai = loai;
        this.khuyenMai = khuyenMai;
        this.dinhMuc = dinhMuc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public float getKhuyenMai() {
        return khuyenMai;
    }

    public void setKhuyenMai(float khuyenMai) {
        this.khuyenMai = khuyenMai;
    }

    public BigInteger getDinhMuc() {
        return dinhMuc;
    }

    public void setDinhMuc(BigInteger dinhMuc) {
        this.dinhMuc = dinhMuc;
    }
}
