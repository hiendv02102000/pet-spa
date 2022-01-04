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
public class TKHoaDon extends HoaDon{

    public TKHoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, KhachHang khachHang, NhanVien nhanVien, HoaDonDichVu[] listHDDV) {
        super(id, thanhTien, ngayTao, moTa, khachHang, nhanVien, listHDDV);
    }

    public TKHoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa) {
        super(id, thanhTien, ngayTao, moTa);
    }

    public TKHoaDon() {
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public BigInteger getThanhTien() {
        return thanhTien;
    }

    @Override
    public void setThanhTien(BigInteger thanhTien) {
        this.thanhTien = thanhTien;
    }

    @Override
    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    @Override
    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    @Override
    public String getMoTa() {
        return moTa;
    }

    @Override
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }
    
}
