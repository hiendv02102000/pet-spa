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

/**
 *
 * @author admin
 */
public class KhachHangDAO extends DAO{

    public KhachHangDAO() {
        super();
    }
    public void insert (KhachHang kh){
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
            
            int rowCount= prepareStatement.executeUpdate();int ndID=0;System.out.print("abcs");
           String sql2 = "Select id from tblNguoiDung "
                   + "ORDER BY id Desc"; 
           Statement statement = this.conn.createStatement();
           ResultSet rs=statement.executeQuery(sql2);
           
            if(rs.next()){
                ndID = rs.getInt(1);
            }
            String sql3 = "INSERT INTO tblKhachHang (tichluy,tblNguoiDungid,tblLoaiKhachHangid)"
                    + "value(0,"+ndID+",4)";
            statement.executeUpdate(sql3);
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        HoTen h = new HoTen("do", "va", "ren");
        DiaChi dc = new DiaChi("1", "sa", "sa", "sa", "sa");
        KhachHang kh1 =new KhachHang("hien123", "123456", LocalDate.now(), "123ds", "092143525", "00212310401", h, dc);
        KhachHangDAO khd = new KhachHangDAO();
        khd.insert(kh1);
    }
}
