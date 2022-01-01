/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DiaChi;
import model.HoTen;
import model.KhachHang;
import model.NhanVien;

/**
 *
 * @author admin
 */
public class KhachHangDAO extends DAO{

    public KhachHangDAO() {
        super();
    }
    public KhachHang getByID(int id){
        return null;
    }
    public void setIDKH(KhachHang kh){
        String sql1 = "SELECT kh.* FROM pet_spa.tblkhachhang kh\n"
                    + "inner join tblnguoidung nd  on kh.tblNguoiDungid=nd.id\n"
                    + "where nd.tendangnhap = '"+kh.getTenDangNhap()+"';";
            Statement stm;
        try {
            stm = this.conn.createStatement();
             ResultSet rs1 = stm.executeQuery(sql1);;
            int idkh=0;
            if(rs1.next()){
                kh.setId(rs1.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            
           
    }
    public boolean insert (KhachHang kh){
        String sql1 = "INSERT INTO tblNguoiDung (tendangnhap, matkhau, soCCCD, ngaysinh, ngaytao,email,sdt,"
                + "loaitaikhoan,ho,tendem,ten,sonha,cumdancu,xaphuong,quanhuyen,tinhthanh)" +
                    "VALUES (?, ?, ?, ?, ?,?,?,?,"
                + "?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement prepareStatement=this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, kh.getTenDangNhap());
            prepareStatement.setString(2, kh.getMatKhau());
            prepareStatement.setString(3, kh.getSoCCCD());
            prepareStatement.setString(4, kh.getNgaySinh().toString());
            prepareStatement.setString(5, LocalDateTime.now().toString());
            prepareStatement.setString(6, kh.getEmail());
            prepareStatement.setString(7, kh.getSdt());
            prepareStatement.setString(8, "KH");
            prepareStatement.setString(9, kh.getHoTen().getHo());
            prepareStatement.setString(10, kh.getHoTen().getTenDem());
            prepareStatement.setString(11, kh.getHoTen().getTen());
            prepareStatement.setString(12, kh.getDiaChi().getSoNha());
            prepareStatement.setString(13, kh.getDiaChi().getCumDanCu());
            prepareStatement.setString(14, kh.getDiaChi().getXaPhuong());
            prepareStatement.setString(15, kh.getDiaChi().getQuanHuyen());
            prepareStatement.setString(16, kh.getDiaChi().getTinhThanh());
            
            int rowCount= prepareStatement.executeUpdate();
            int ndID=0;
            if(rowCount <=0) return false;
           String sql2 = "Select id from tblNguoiDung "
                   + "ORDER BY id Desc"; 
           Statement statement = this.conn.createStatement();
           ResultSet rs=statement.executeQuery(sql2);
           
            if(rs.next()){
                ndID = rs.getInt(1);
            }
            String sql3 = "INSERT INTO tblKhachHang (tichluy,tblNguoiDungid,tblLoaiKhachHangid) "
                    + "value(0,"+ndID+",4)";
            statement.executeUpdate(sql3);
            String sql4 = "Select id from tblkhachhang "
                   + "where tblNguoiDungid= "+ndID; 
            statement = this.conn.createStatement();
            rs=statement.executeQuery(sql4);
            if(rs.next()){
                kh.setId(rs.getInt(1));
            }
        } catch (Exception ex) {
           
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
         ///   System.out.println("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
            return false;
        }
        return true;
    }
}
