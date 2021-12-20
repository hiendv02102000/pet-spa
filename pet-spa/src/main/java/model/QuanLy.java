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
public class QuanLy extends NguoiDung{

    public QuanLy(String tenDangNhap, String matKhau, LocalDate ngaySinh, String email, String sdt, String soCCCD, String loaiTaiKhoan, HoTen hoTen, DiaChi diaChi) {
        super(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, loaiTaiKhoan, hoTen, diaChi);
    }

    public QuanLy(NguoiDung nd) {
      super(nd);
    }
    
}
