/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

<<<<<<< HEAD
import model.LichHen;
=======
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.Vector;
import model.DichVu;
import model.LichHen;
import utils.FormateDateTime;
>>>>>>> 09d1135ef0002a2594ce14916e0ec93ca742378e

/**
 *
 * @author admin
 */
<<<<<<< HEAD
public class LichHenDAO {

=======
public class LichHenDAO extends DAO{
    private final String ConditionsOfExist =  " ngayxoa IS  NULL";
>>>>>>> 09d1135ef0002a2594ce14916e0ec93ca742378e
    public LichHenDAO() {
        super();
    }
    public LichHen[] getByKhachHangID(int khID){
<<<<<<< HEAD
        return null;
    }
    public void delete(int ID){
        
    }
     public boolean insert(LichHen lh){
        return true;
    }
     public LichHen getByIDWithPreLoadKhachHang(int id ){
         return null;
     }
     public LichHen[] getAll(){
        return null;
    }
      public LichHen[] getByKhachHangCondition(String condition){
        return null;
=======
         String sql = "Select * from tblLichHen Where tblKhachHangid = "+khID+" AND"+ConditionsOfExist;
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
    public static void main(String[] args) {
       LichHenDAO lhd = new LichHenDAO();
       LichHen[] l = lhd.getByKhachHangID(1);
       for(LichHen lh:l){
           System.out.println(lh);
       }
>>>>>>> 09d1135ef0002a2594ce14916e0ec93ca742378e
    }
}
