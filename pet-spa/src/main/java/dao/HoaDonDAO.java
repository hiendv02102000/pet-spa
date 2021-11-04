/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Vector;
import model.HoaDon;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class HoaDonDAO extends DAO{
    private final String ConditionsOfExist="ngayxoa IS NULL";
    public HoaDonDAO(){
        super();
    }
    public HoaDon[] getOnDay(int ngay){
        String sql="select * from tblhoadon where day(ngaytao)="+ngay+";";
        ResultSet rs;
        Vector<HoaDon> listHD=new Vector<HoaDon>();
        HoaDon[] result;
        try {
            Statement statement=this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count=0;
            while(rs.next()){
                HoaDon hd=new HoaDon(rs.getInt(1),
                        BigInteger.valueOf(rs.getInt(2)),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(3),rs.getTime(3)),
                        null,null,null);
                listHD.add(hd);
            }
            result=new HoaDon[count];
        } catch (Exception e) {
            return null;
        }
        return listHD.toArray(result);
    }
    public static void main(String[] args) {
        HoaDonDAO hdd=new HoaDonDAO();
        HoaDon[] hd=hdd.getOnDay(20);
        for (HoaDon hoaDon : hd) {
            System.out.println(hoaDon);
            System.out.println("");
        }
    }
}
