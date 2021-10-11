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
}
