/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Vector;
import model.DichVu;
import model.HoaDon;
import model.TKHoaDon;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class TKHoaDonDAO extends DAO {

    public TKHoaDon[] getAllonday() {
        //String sql = "SELECT * FROM tblhoadon Where DATE(ngaytao) = DATE(now()) ";
        String timeCondtion = "";
        if (LocalTime.now().isAfter(LocalTime.of(12, 0, 0))) {
            timeCondtion = " AND TIME(ngaytao) >= '12:00:00'";
        } else {
            timeCondtion = " AND TIME(ngaytao) < '12:00:00'";
        }
        String sql = "SELECT * FROM tblhoadon Where DATE(ngaytao) = DATE(now()) " + timeCondtion;
        ResultSet rs;
        Vector<TKHoaDon> listTKHD = new Vector<TKHoaDon>();
        TKHoaDon[] result;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql);
            int count = 0;
            while (rs.next()) {
                TKHoaDon hd = new TKHoaDon(rs.getInt(1),
                         new BigInteger(rs.getString(2)),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(3), rs.getTime(3)),
                         rs.getString(4)
                      );
                //return FormatVI.decodeVI(rs.getString(2));
                listTKHD.add(hd);
                count++;
            }

            result = new TKHoaDon[count];

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return listTKHD.toArray(result);
    }
    public static void main(String[] args) {
        TKHoaDonDAO dao = new TKHoaDonDAO();
             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
             TKHoaDon[] listtkhd =  dao.getAllonday();
    }
}
