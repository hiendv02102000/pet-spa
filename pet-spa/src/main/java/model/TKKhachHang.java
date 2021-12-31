/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class TKKhachHang extends KhachHang{
    protected KhachHang khachHang;
    private int solan;
    private String loai;
    private float khuyenmai;
    private BigInteger tongThanhToan;
    public TKKhachHang() {
    }


    public TKKhachHang(KhachHang kh, HoTen tenKH, int solan, String loai, float khuyenmai, BigInteger tongThanhToan) {
        this.khachHang=kh;
        this.khachHang=new KhachHang();
        this.khachHang.setHoTen(tenKH);
        this.solan = solan;
        this.loai = loai;
        this.khuyenmai = khuyenmai;
        this.tongThanhToan = tongThanhToan;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }


    public String toString() {
        return this.khachHang.getId()+" "+this.khachHang.getHoTen()+" "+solan + " " + loai + " " + khuyenmai + " " + tongThanhToan ;
    }

    public int getSolan() {
        return solan;
    }

    public String getLoai() {
        return loai;
    }

    public float getKhuyenmai() {
        return khuyenmai;
    }

    public BigInteger getTongThanhToan() {
        return tongThanhToan;
    }

    public LoaiKhachHang getLoaiKhachHang() {
        return loaiKhachHang;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public LocalDate getNgaySinh() {
        return ngaySinh;
    }

    public String getEmail() {
        return email;
    }

    public String getSdt() {
        return sdt;
    }

    public String getSoCCCD() {
        return soCCCD;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public HoTen getHoTen() {
        return hoTen;
    }

    public DiaChi getDiaChi() {
        return diaChi;
    }
    
}
