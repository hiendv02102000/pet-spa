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

    public HoaDon() {
    }

    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, KhachHang khachHang, NhanVien nhanVien, HoaDonDichVu[] listHDDV) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.khachHang = khachHang;
        this.nhanVien = nhanVien;
        this.listHDDV = listHDDV;
    }

    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, KhachHang khachHang, NhanVien nhanVien) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.khachHang = khachHang;
        this.nhanVien = nhanVien;
    }

    @Override
    public String toString() {
        return  id + " " + thanhTien + " /" + ngayTao + " /" + moTa + " " + khachHang + " " + nhanVien ;
    }
    

    public int getId() {
        return id;
    }

    public BigInteger getThanhTien() {
        return thanhTien;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public String getMoTa() {
        return moTa;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public HoaDonDichVu[] getListHDDV() {
        return listHDDV;
    }
    
}
