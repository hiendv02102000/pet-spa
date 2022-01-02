/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DiaChi;
import model.DichVu;
import model.HoTen;
import model.NguoiDung;
import model.NhanVien;
import utils.FormateDateTime;
import model.NguoiDung;

/**
 *
 * @author admin
 */
public class NguoiDungDAO extends DAO{
    private final String ConditionsOfExist =  "ngayxoa IS  NULL";
    
    public NguoiDungDAO() {
        super();
    }
    public boolean update (NguoiDung nd){
        String sql1 = "UPDATE tblNguoiDung "
                + "SET soCCCD = ? , ngaysinh = ?, email = ?, sdt = ?, "
                + "ho = ?, tendem = ?, ten = ?, sonha = ?, cumdancu = ?, "
                + "xaphuong = ?, quanhuyen = ?, tinhthanh = ? "
                + "WHERE tendangnhap = ?";
        try {
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, nd.getSoCCCD());
            prepareStatement.setString(2, nd.getNgaySinh().toString());
            prepareStatement.setString(3, nd.getEmail());
            prepareStatement.setString(4, nd.getSdt());
            prepareStatement.setString(5, nd.getHoTen().getHo());
            prepareStatement.setString(6, nd.getHoTen().getTenDem());
            prepareStatement.setString(7, nd.getHoTen().getTen());
            prepareStatement.setString(8, nd.getDiaChi().getSoNha());
            prepareStatement.setString(9, nd.getDiaChi().getCumDanCu());
            prepareStatement.setString(10, nd.getDiaChi().getXaPhuong());
            prepareStatement.setString(11, nd.getDiaChi().getQuanHuyen());
            prepareStatement.setString(12, nd.getDiaChi().getTinhThanh());
            prepareStatement.setString(13, nd.getTenDangNhap());
            prepareStatement.executeUpdate();
            
            return true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public NguoiDung getByID(int id){
         String sql = "SELECT * from tblNguoiDung "
             + "WHERE id = " + id ;// câu lệnh sql
         Vector<NguoiDung> listND = new Vector<NguoiDung>();
         NguoiDung[] result;
         ResultSet rs;
        try{ 
            Statement statement = this.conn.createStatement();// dùng để thực thi câu lệnh
            rs=statement.executeQuery(sql);// thực thi không làm thay đổi dữ liệu
            int count =0;
           if(rs.next()){// đọc dòng tiếp theo của kết quả
                NguoiDung nd = new NguoiDung(rs.getString("tendangnhap"), 
                    rs.getString("matkhau"), 
                    FormateDateTime.convertDBToLocalDateTime(rs.getDate("ngaysinh"),rs.getTime("ngaysinh")).toLocalDate(),
                    rs.getString("email") ,
                    rs.getString("sdt"),
                    rs.getString("soCCCD"),
                    rs.getString("loaitaikhoan"),
                    new HoTen(rs.getString("ho"),
                    rs.getString("tendem"),
                    rs.getString("ten")),
                    new DiaChi(rs.getString("sonha"),
                    rs.getString("cumdancu"),
                    rs.getString("xaphuong"),
                    rs.getString("quanhuyen"),
                    rs.getString("tinhthanh")));
                return nd;
           }
           result = new NguoiDung[count];
        }catch(Exception e){
            return null;
        }
        return null;
        
    }
    public NguoiDung check(String tendangnhap, String matkhau){
      String sql = "Select * from tblNguoiDung "
              + "WHERE tendangnhap = ? AND matkhau = ?";
      Vector<NguoiDung> listND = new Vector<NguoiDung>();
      NguoiDung[] result;
        ResultSet rs;
        try{ 
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql);
            prepareStatement.setString(1, tendangnhap);
            prepareStatement.setString(2, matkhau);
            rs=prepareStatement.executeQuery();
            int count =0;
           if(rs.next()){
               NguoiDung nd = new NguoiDung(rs.getString("tendangnhap"), 
                    rs.getString("matkhau"), 
                    FormateDateTime.convertDBToLocalDateTime(rs.getDate("ngaysinh"),rs.getTime("ngaysinh")).toLocalDate(),
                    rs.getString("email") ,
                    rs.getString("sdt"),
                    rs.getString("soCCCD"),
                    rs.getString("loaitaikhoan"),
                    new HoTen(rs.getString("ho"),
                    rs.getString("tendem"),
                    rs.getString("ten")),
                    new DiaChi(rs.getString("sonha"),
                    rs.getString("cumdancu"),
                    rs.getString("xaphuong"),
                    rs.getString("quanhuyen"),
                    rs.getString("tinhthanh")));
               nd.setId( rs.getInt("id"));
               return nd;
           }
           result = new NguoiDung[count];
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
   
}
