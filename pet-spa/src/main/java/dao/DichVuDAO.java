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
import java.time.LocalDateTime;
/**
 *
 * @author admin
 */
public class DichVuDAO extends DAO{

    public DichVuDAO() {
        super();
    }
    public DichVu getByID(int ID){
       String sql = "Select * from tblDichVu Where id = "+ID;
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
            rs.getDate(6),rs.getDate(7));
               return dv;
           }
            return null;
        }catch(Exception e){
            return null;
        }
        
    }
}
