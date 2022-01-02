/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class HoTen {
    private String ho;
    private String tenDem;
    private String ten;

    public HoTen(String ho, String tenDem, String ten) {
        this.ho = ho;
        this.tenDem = tenDem;
        this.ten = ten;
    }

    
    @Override
    public String toString() {
        String rs = "";
        if(ho!=null && !ho.isEmpty()){
            rs += ho +" ";
        }
        if(tenDem!=null && !tenDem.isEmpty()){
            rs += tenDem +" ";
        }
        if(ten!=null && !ten.isEmpty()){
            rs += ten;
        }
        return rs;
    }
    

    public String getHo() {
        return ho;
    }
    public String getTenDem() {
        return tenDem;
    }

    public String getTen() {
        return ten;
    }
}
