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
import model.HoaDon;
import model.KhachHang;
import model.NhanVien;
import model.TKDoanhThu;

/**
 *
 * @author admin
 */
public class HoaDonDAO extends DAO{

    public HoaDonDAO() {
        super();
    }
    public HoaDon getByID(int id){
        return null;
    }
    public HoaDon[] getOnMonthByIDKH(int ID,int thang,int nam){
        return null;
    }
    public boolean insert(HoaDon hd){
         try {
            String sql = "INSERT INTO `tblhoadon` (`thanhtien`, `ngaytao`, `mota`, `tblKhachHangid`, `tblNhanVienid`)  " +
                    "VALUES (?, ?, ?, ?, ?);";
               PreparedStatement prepareStatement=this.conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
               prepareStatement.setString(1, hd.getThanhTien().toString());
          
              prepareStatement.setString(2,LocalDateTime.now().toString());
                prepareStatement.setString(3, hd.getMoTa());
              if(hd.getKhachHang()==null||hd.getKhachHang().getId()==0){
                  prepareStatement.setString(4, null);
              }else {
                prepareStatement.setInt(4, hd.getKhachHang().getId());  
              }
               prepareStatement.setInt(5, hd.getNhanVien().getId());
//            prepareStatement.setString(4, dv.getMoTa());
//            prepareStatement.setString(5, LocalDateTime.now().toString());
             int rowCount= prepareStatement.executeUpdate();//thực thi làm thay đổi dữ liệu
             ResultSet rs=prepareStatement.getGeneratedKeys();
             int id=0;
            if(rs.next()){
                 id=rs.getInt(1);
            }
            hd.setId(id);
            // prepareStatement.executeUpdate();
            return rowCount>0;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
}
