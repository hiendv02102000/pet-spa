/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class LichHenDichVu {
    private int id;
    private DichVu dichVu;
    private int soLuong;

    public LichHenDichVu(int id, DichVu dichVu, int soLuong) {
        this.id = id;
        this.dichVu = dichVu;
        this.soLuong = soLuong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DichVu getDichVu() {
        return dichVu;
    }

    public void setDichVu(DichVu dichVu) {
        this.dichVu = dichVu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    

    @Override
    public String toString() {
        return "LichHenDichVu{" + "id=" + id + ", dichVu=" + dichVu + ", soLuong=" + soLuong + '}';
    }
    
}
