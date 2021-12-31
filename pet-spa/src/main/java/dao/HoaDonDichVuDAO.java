/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.Vector;
import model.DichVu;
import model.HoaDonDichVu;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class HoaDonDichVuDAO extends DAO{

    public HoaDonDichVuDAO() {
    }
    public HoaDonDichVu[] getByHoaDonID(int hdid){
         String sql = "SELECT * FROM tblhoadondichvu where tblHoaDonid="+hdid;
       ResultSet rs;
       Vector<HoaDonDichVu> listLH = new Vector<HoaDonDichVu>();
        HoaDonDichVu[] result;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
           int count =0;
           while(rs.next()){
              HoaDonDichVu hddv = new HoaDonDichVu(rs.getInt(1), null, rs.getInt(2), new BigInteger(rs.getString(5)));
              DichVuDAO dvdao = new DichVuDAO();
              DichVu dv = dvdao.getByID(rs.getInt(4));
              hddv.setDichVu(dv);
             listLH.add(hddv);
             //return FormatVI.decodeVI(rs.getString(2));
             count++;
           }

           result = new HoaDonDichVu[count];


        }catch(Exception e){
            return null;
        }
        return listLH.toArray(result);
    }
    public boolean insert(int idhd ,HoaDonDichVu hddv){
        try {
            String sql = "INSERT INTO `pet_spa`.`tblhoadondichvu` (`soluong`, `tblHoaDonid`, `tblDichVuid`, `giaDV`) " +
                    "VALUES (?, ?, ?, ?);";
               PreparedStatement prepareStatement=this.conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
              prepareStatement.setInt(1,hddv.getSoLuong());
              prepareStatement.setInt(2,idhd);
              prepareStatement.setInt(3,hddv.getDichVu().getId());
              prepareStatement.setString(4,hddv.getGiaDV().toString());
              int rowCount= prepareStatement.executeUpdate();
            return rowCount>0;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}
