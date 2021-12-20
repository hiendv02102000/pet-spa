/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import model.HoaDonDichVu;

/**
 *
 * @author admin
 */
public class HoaDonDichVuDAO extends DAO{

    public HoaDonDichVuDAO() {
    }
    public HoaDonDichVu[] getByHoaDonID(int hdid){
        return null;
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
