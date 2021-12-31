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

    public void setId(int id) {
        this.id = id;
    }

    public void setThanhTien(BigInteger thanhTien) {
        this.thanhTien = thanhTien;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

    public void setListHDDV(HoaDonDichVu[] listHDDV) {
        this.listHDDV = listHDDV;
    }
    
    //hoa don chi tiet cho thong ke khach hang
    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, HoTen tenNV) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.nhanVien=new NhanVien();
        this.nhanVien.setHoTen(tenNV);
    }
    //hoa don chi tiet thong ke hoa don
    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa, HoTen tenKH, HoTen tenNV) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
        this.khachHang=new KhachHang();
        this.khachHang.setHoTen(tenKH);
        this.nhanVien=new NhanVien();
        this.nhanVien.setHoTen(tenNV);
    }
    //cho thong ke chi tiet khach hang
    
    public String toStringCTKhachHang() {
        return  id + " " + thanhTien + " " + ngayTao + " " + moTa + " " + this.nhanVien.getHoTen() ;
    }
    //cho chi tiet thong ke doanh thu
    public String toStringCTHoaDon() {
        return  id + " " + thanhTien + " " + ngayTao + " " + moTa +" " + this.khachHang.getHoTen() + " " + this.nhanVien.getHoTen() ;
    }

    public int getId() {
        return id;
    }
    public HoaDon(int id, BigInteger thanhTien, LocalDateTime ngayTao, String moTa) {
        this.id = id;
        this.thanhTien = thanhTien;
        this.ngayTao = ngayTao;
        this.moTa = moTa;
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
    public void setListHD(HoaDonDichVu[] listHDDV) {
        this.listHDDV = listHDDV;
    }


    @Override
    public String toString() {
        return "HoaDon{" + "id=" + id + ", thanhTien=" + thanhTien + ", ngayTao=" + ngayTao + ", moTa=" + moTa + ", khachHang=" + khachHang + ", nhanVien=" + nhanVien + ", listHDDV=" + listHDDV + '}';
    }
    
}
