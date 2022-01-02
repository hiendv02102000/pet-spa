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
public class TKKhachHang extends KhachHang {
    private int solan;
    private BigInteger tongThanhToan;

    public TKKhachHang() {
    }



    public TKKhachHang(int solan, BigInteger tongThanhToan, String tenDangNhap, String matKhau, LocalDate ngaySinh, 
            String email, String sdt, String soCCCD, HoTen hoTen, DiaChi diaChi) {
        super(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, hoTen, diaChi);
        this.solan = solan;
        this.tongThanhToan = tongThanhToan;
    }

    public void setSolan(int solan) {
        this.solan = solan;
    }

    public void setTongThanhToan(BigInteger tongThanhToan) {
        this.tongThanhToan = tongThanhToan;
    }

    public TKKhachHang(int id, BigInteger tongThanhToan) {
        this.solan = solan;
        this.tongThanhToan = tongThanhToan;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String toString() {
        return solan + " " + tongThanhToan;
    }

    public int getSolan() {
        return solan;
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
