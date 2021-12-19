/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import model.DichVu;
import model.LichHen;
import model.LichHenDichVu;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class LichHenDichVuDAO extends  DAO{

    public LichHenDichVuDAO() {
        super();
    }
    public LichHenDichVu[] getByLichHenID( int lichHenID){
      String sql = "SELECT dv.*,lhdv.soluong,lhdv.id FROM tbllichhendichvu lhdv " +
                    "inner join tbldichvu dv on lhdv.tblDichVuid = dv.id "+
                    "Where lhdv.tblLichHenid = "+lichHenID;
      Vector<LichHenDichVu> listLHDV = new Vector<LichHenDichVu>();
      LichHenDichVu[] result;
        ResultSet rs;
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count =0;
           while(rs.next()){
                count++;
                DichVu dv = new DichVu(rs.getInt(1),
                rs.getString(2),
                BigInteger.valueOf(rs.getInt(3)),
                rs.getInt(4),
                rs.getString(5),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(6), rs.getTime(6)),
                FormateDateTime.convertDBToLocalDateTime(rs.getDate(7), rs.getTime(7)));
                dv= new DichVuDAO().getByID(rs.getInt(1));
                LichHenDichVu lhdv=new LichHenDichVu(rs.getInt(8),dv,rs.getInt(9));
                
                listLHDV.add(lhdv);
           }
           result = new LichHenDichVu[count];
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        return listLHDV.toArray(result);
    }
    public boolean delete(int idlh){
           String sql = "Delete  FROM pet_spa.tbllichhendichvu where tblLichHenid="+idlh;
       
        try{ 
            Statement statement = this.conn.createStatement();
            int rowCount= statement.executeUpdate(sql);
           
        }catch(Exception e){
            return false;
        }
        return true;
    }
     public boolean insert(LichHenDichVu lh){
        return true;
    }
}
