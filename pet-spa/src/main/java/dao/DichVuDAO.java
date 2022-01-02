/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import model.DichVu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.FormateDateTime;
/**
 *
 * @author admin
 */
public class DichVuDAO extends DAO{
    private final String ConditionsOfExist =  "ngayxoa IS  NULL";
    public DichVuDAO() {
        super();
    }
    public DichVu getByID(int ID){
       String sql = "Select * from tblDichVu Where id = "+ID+" AND "+ConditionsOfExist;
       ResultSet rs;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
           if(rs.next()){
                DichVu dv = new DichVu(rs.getInt(1),
                rs.getString(2),
                BigInteger.valueOf(rs.getInt(3)),
                rs.getInt(4),
                rs.getString(5),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(6), rs.getTime(6)),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(7), rs.getTime(7)));
            //  DateTime l= new LocalDateTime();//(rs.getDate(6),rs.getTime(6));
             return dv;
           }
            return null;
        }catch(Exception e){
            return null;
        }
    }
    
    public boolean insert(DichVu dv){
        try {
            String sql = "INSERT INTO tblDichVu (ten, giaca, gioihan, mota, ngaytao)" +
                    "VALUES (?, ?, ?, ?, ?);";
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql);
            prepareStatement.setString(1, dv.getTen());
            prepareStatement.setString(2,dv.getGiaCa().toString());
            prepareStatement.setInt(3, dv.getGioiHan());
            prepareStatement.setString(4, dv.getMoTa());
            prepareStatement.setString(5, LocalDateTime.now().toString());
            int rowCount= prepareStatement.executeUpdate();//thực thi làm thay đổi dữ liệu
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    public boolean update(DichVu dv, int id){
        String sql1 = "UPDATE tblDichVu"
                + " SET ten = ? , giaca = ?, gioihan = ?, mota = ?,"
                + "ngaytao = ? "
                + "WHERE id = ?;";

        try {
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, dv.getTen());
            prepareStatement.setInt(2,Integer.parseInt(dv.getGiaCa().toString()));
            prepareStatement.setInt(3, dv.getGioiHan());
            prepareStatement.setString(4, dv.getMoTa());
            prepareStatement.setString(5, LocalDateTime.now().toString());
            prepareStatement.setInt(6, id);
            int rowCount= prepareStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            
        }return false;
        
    }
    public void delete(DichVu dv, int id){
        String sql1 = "UPDATE tblDichVu SET ngayxoa = ? WHERE id = ? ";
        try {
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql1);            
            prepareStatement.setString(1, LocalDateTime.now().toString());
            prepareStatement.setInt(2, id);
            int rowCount= prepareStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /*
    public DichVu[] getByTenDV(String tenDV){
     // tenDV = FormatVI.encodeVI(tenDV);
      String sql = "Select * from tblDichVu WHERE ten LIKE '%"+tenDV+"%'"+" AND "+ConditionsOfExist;
    }*/
    public DichVu[] getByCondition(String condition){
     // tenDV = FormatVI.encodeVI(tenDV);
      String sql = "Select * from tblDichVu WHERE "+ConditionsOfExist;
      Vector<DichVu> listDV = new Vector<DichVu>();
      DichVu[] result;
        ResultSet rs;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count =0;
           while(rs.next()){
                DichVu dv = new DichVu(rs.getInt(1),
                rs.getString(2),
                BigInteger.valueOf(rs.getInt(3)),
                rs.getInt(4),
                rs.getString(5),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(6), rs.getTime(6)),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(7), rs.getTime(7)));
            if(dv.toString().contains(condition))
                listDV.add(dv);
             //return FormatVI.decodeVI(rs.getString(2));
           }
           result = new DichVu[count];
        }catch(Exception e){
            return null;
        }
        return listDV.toArray(result);
    }
    
    public DichVu[] getAll(){
         String sql = "Select * from tblDichVu"+" Where "+ConditionsOfExist;// câu lệnh sql
         Vector<DichVu> listDV = new Vector<DichVu>();
         DichVu[] result;
         ResultSet rs;
        try{ 
            Statement statement = this.conn.createStatement();// dùng để thực thi câu lệnh
            rs=statement.executeQuery(sql);// thực thi không làm thay đổi dữ liệu
            int count =0;
           while(rs.next()){// đọc dòng tiếp theo của kết quả
                DichVu dv = new DichVu(rs.getInt(1),//
                rs.getString(2),
                BigInteger.valueOf(rs.getInt(3)),
                rs.getInt(4),
                rs.getString(5),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(6), rs.getTime(6)),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(7), rs.getTime(7)));
                listDV.add(dv);
           }
           result = new DichVu[count];
        }catch(Exception e){
            return null;
        }
        return listDV.toArray(result);
    }


    public DichVu[] getOnMonthbyIDKH(int idkh ,int nam,int thang){
        return null;

    }   
    
   
}
