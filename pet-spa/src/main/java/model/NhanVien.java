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
public class NhanVien extends NguoiDung {

    private int id;
    private LocalDateTime ngayXoa;

    public NhanVien(String tenDangNhap, String matKhau, LocalDate ngaySinh, String email, String sdt, String soCCCD, String loaiTaiKhoan, HoTen hoTen, DiaChi diaChi) {
        super(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, loaiTaiKhoan, hoTen, diaChi);
    }

    public NhanVien(NguoiDung nd) {
        super(nd);
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public void setNgayXoa(LocalDateTime ngayXoa) {
        this.ngayXoa = ngayXoa;
    }
    @Override
   public String toString() {
        return this.hoTen.getHo()+" "+this.hoTen.getTenDem()+" "+this.getHoTen().getTen();
    }

    @Override
    public int getId() {
        return this.id;
    }

    public NhanVien() {
    }

    public LocalDateTime getNgayXoa() {
        return ngayXoa;
    }

}
