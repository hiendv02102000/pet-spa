/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class DiaChi {
    private String soNha,cumDanCu,xaPhuong,quanHuyen,tinhThanh;

    public DiaChi(String soNha, String cumDanCu, String xaPhuong, String quanHuyen, String tinhThanh) {
        this.soNha = soNha;
        this.cumDanCu = cumDanCu;
        this.xaPhuong = xaPhuong;
        this.quanHuyen = quanHuyen;
        this.tinhThanh = tinhThanh;
    }

    public String getSoNha() {
        return soNha;
    }

    public String getCumDanCu() {
        return cumDanCu;
    }

    public String getXaPhuong() {
        return xaPhuong;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public String getTinhThanh() {
        return tinhThanh;
    }
    @Override
    public String toString() {
        String rs = "";
        if(soNha!=null && !soNha.isEmpty()){
            rs += soNha +", ";
        }
        if(cumDanCu!=null && !cumDanCu.isEmpty()){
            rs += cumDanCu +", ";
        }
        if(xaPhuong!=null && !xaPhuong.isEmpty()){
            rs += xaPhuong+", ";
        }
        if(quanHuyen!=null && !quanHuyen.isEmpty()){
            rs += quanHuyen+", ";
        }
        if(tinhThanh!=null && !tinhThanh.isEmpty()){
            rs += tinhThanh;
        }
        return rs;
    }
}
