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

    
    
    
}
