/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author admin
 */
public class NguoiDung {
    private int id;
    protected String tenDangNhap;
    protected String matKhau;
    protected LocalDate ngaySinh;
    protected String email;
    protected String sdt;
    protected String soCCCD;
    protected LocalDateTime ngayTao;
    private String loaiTaiKhoan;
    protected HoTen hoTen;
    protected DiaChi diaChi;

    public NguoiDung() {
    }

    public NguoiDung(String tenDangNhap, String matKhau, LocalDate ngaySinh, String email, String sdt, String soCCCD, String loaiTaiKhoan, HoTen hoTen, DiaChi diaChi) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.ngaySinh = ngaySinh;
        this.email = email;
        this.sdt = sdt;
        this.soCCCD = soCCCD;
        this.loaiTaiKhoan = loaiTaiKhoan;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
    }
    public NguoiDung(NguoiDung nd){
        this.tenDangNhap = nd.tenDangNhap;
        this.matKhau = nd.matKhau;
        this.ngaySinh = nd.ngaySinh;
        this.email = nd.email;
        this.sdt = nd.sdt;
        this.soCCCD = nd.soCCCD;
        this.loaiTaiKhoan = nd.loaiTaiKhoan;
        this.hoTen = nd.hoTen;
        this.diaChi = nd.diaChi;
    }
    public int getId() {
        return id;
    }

    public String getSdt() {
        return sdt;
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

    public String getSoCCCD() {
        return soCCCD;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public String getLoaiTaiKhoan() {
        return loaiTaiKhoan;
    }

    public HoTen getHoTen() {
        return hoTen;
    }

    public DiaChi getDiaChi() {
        return diaChi;
    }
    
    public NguoiDung(NguoiDung nd){
        this.tenDangNhap = nd.tenDangNhap;
        this.matKhau = nd.matKhau;
        this.ngaySinh = nd.ngaySinh;
        this.email = nd.email;
        this.sdt = nd.sdt;
        this.soCCCD = nd.soCCCD;
        this.loaiTaiKhoan = nd.loaiTaiKhoan;
        this.hoTen = nd.hoTen;
        this.diaChi = nd.diaChi;
    }
    
}
