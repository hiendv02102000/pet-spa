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
public class LichHen {
    private int id;
    private LocalDateTime thoiGianHen;
    private BigInteger giaDuKien;
    private LocalDateTime ngayXoa;
    private KhachHang khachHang;
    private LichHenDichVu[] listLHDV;

    public LichHen(int id, LocalDateTime thoiGianHen, BigInteger giaDuKien, KhachHang khachHang, LichHenDichVu[] listLHDV) {
        this.id = id;
        this.thoiGianHen = thoiGianHen;
        this.giaDuKien = giaDuKien;
        this.khachHang = khachHang;
        this.listLHDV = listLHDV;
    }

    public LichHen() {
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getThoiGianHen() {
        return thoiGianHen;
    }


    public void setThoiGianHen(LocalDateTime thoiGianHen) {
        this.thoiGianHen = thoiGianHen;
    }

    public BigInteger getGiaDuKien() {
        return giaDuKien;
    }

    public void setGiaDuKien(BigInteger giaDuKien) {
        this.giaDuKien = giaDuKien;
    }

    public LocalDateTime getNgayXoa() {
        return ngayXoa;
    }

    public void setNgayXoa(LocalDateTime ngayXoa) {
        this.ngayXoa = ngayXoa;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public LichHenDichVu[] getListLHDV() {
        return listLHDV;
    }

    public void setListLHDV(LichHenDichVu[] listLHDV) {
        this.listLHDV = listLHDV;
    }

    
    
    
}
