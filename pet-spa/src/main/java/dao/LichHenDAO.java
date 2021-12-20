/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.Vector;
import model.DichVu;
import model.LichHen;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class LichHenDAO extends DAO{
    private final String ConditionsOfExist =  " ngayxoa IS  NULL";
    public LichHenDAO() {
        super();
    }
    public LichHen[] getByKhachHangID(int khID){
                String sql = "Select * from tblLichHen Where tblKhachHangid = "+khID+" AND "+ConditionsOfExist;
       ResultSet rs;
       Vector<LichHen> listLH = new Vector<LichHen>();
        LichHen[] result;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count =0;
           while(rs.next()){
                LichHen lh = new LichHen(rs.getInt(1), 
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(2), rs.getTime(2)), 
                        new BigInteger(rs.getString(3)), 
                        null, 
                        null);
             listLH.add(lh);
             //return FormatVI.decodeVI(rs.getString(2));
           }

           result = new LichHen[count];


        }catch(Exception e){
            return null;
        }
        return listLH.toArray(result);
    }
    
    public boolean delete(int ID){
          String sql = "UPDATE `tbllichhen` SET `ngayxoa` = DATE(NOW()) WHERE `id` = "+ID;
       
        try{ 
            Statement statement = this.conn.createStatement();
            int rowCount= statement.executeUpdate(sql);
           
        }catch(Exception e){
            return false;
        }
        return true;
    }
     public boolean insert(LichHen lh){
        return true;
    }
     public LichHen getByIDWithPreLoadKhachHang(int id ){
          String sql1 = "Select * from tblLichHen" 
                  + "Where id = "+id+" AND "+ConditionsOfExist;
          String sql2 = "Select lh.* ("+sql1+") as lh"
                  + "inner join tblKhachHang kh on kh.id = lh.tblKhachHangid ";
       ResultSet rs;
       Vector<LichHen> listLH = new Vector<LichHen>();
        LichHen[] result;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql2);
            int count =0;
           if(rs.next()){
                LichHen lh = new LichHen(rs.getInt(1), 
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(2), rs.getTime(2)), 
                        new BigInteger(rs.getString(3)), 
                        null, 
                        null);
            return lh;
           }
           return null;
        }catch(Exception e){
            return null;
        }
       
     }
     public LichHen[] getAll(){
        return null;
    }
    public LichHen[] getByKhachHangCondition(String condition){
        return null;
    }
//    public LichHen[] getByID(int ID){
//        return null;
//    }
}
