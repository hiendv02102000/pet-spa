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
    }
}
