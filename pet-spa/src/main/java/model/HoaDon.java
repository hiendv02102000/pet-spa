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
public class HoaDon {
    protected int id;
    protected BigInteger thanhTien;
    protected LocalDateTime ngayTao;
    protected String moTa;
    protected KhachHang khachHang;
    private NhanVien nhanVien;
    private HoaDonDichVu[] listHDDV;

    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, KhachHang khachHang, NhanVien nhanVien, HoaDonDichVu[] listHDDV) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.khachHang = khachHang;
        this.nhanVien = nhanVien;
        this.listHDDV = listHDDV;
    }

    public HoaDon() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigInteger getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(BigInteger thanhTien) {
        this.thanhTien = thanhTien;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

    public HoaDonDichVu[] getListHDDV() {
        return listHDDV;
    }

    public void setListHDDV(HoaDonDichVu[] listHDDV) {
        this.listHDDV = listHDDV;
    }
    
}
