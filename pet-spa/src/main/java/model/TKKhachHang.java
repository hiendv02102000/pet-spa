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

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return solan + " " + tongThanhToan;
    }

    public int getSolan() {
        return solan;
    }

    public BigInteger getTongThanhToan() {
        return tongThanhToan;
    }

    @Override
    public LoaiKhachHang getLoaiKhachHang() {
        return loaiKhachHang;
    }

    @Override
    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    @Override
    public LocalDate getNgaySinh() {
        return ngaySinh;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public String getSdt() {
        return sdt;
    }

    @Override
    public String getSoCCCD() {
        return soCCCD;
    }

    @Override
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public HoTen getHoTen() {
        return hoTen;
    }

    @Override
    public DiaChi getDiaChi() {
        return diaChi;
    }

}
