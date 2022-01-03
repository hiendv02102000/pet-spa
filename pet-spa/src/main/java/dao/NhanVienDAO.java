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
import model.NhanVien;
import model.NguoiDung;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class NhanVienDAO extends DAO {

    private final String ConditionsOfExist = "ngayxoa IS  NULL";

    public NhanVienDAO() {
        super();
    }

    public boolean insert(NhanVien nv) {
        String sql1 = "INSERT INTO tblNguoiDung (tendangnhap, matkhau, soCCCD, ngaysinh, ngaytao,email,sdt,"
                + "loaitaikhoan,ho,tendem,ten,sonha,cumdancu,xaphuong,quanhuyen,tinhthanh)"
                + "VALUES (?, ?, ?, ?, ?,?,?,?,"
                + "?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, nv.getTenDangNhap());
            prepareStatement.setString(2, nv.getMatKhau());
            prepareStatement.setString(3, nv.getSoCCCD());
            prepareStatement.setString(4, nv.getNgaySinh().toString());
            prepareStatement.setString(5, LocalDateTime.now().toString());
            prepareStatement.setString(6, nv.getEmail());
            prepareStatement.setString(7, nv.getSdt());
            prepareStatement.setString(8, "NV");
            prepareStatement.setString(9, nv.getHoTen().getHo());
            prepareStatement.setString(10, nv.getHoTen().getTenDem());
            prepareStatement.setString(11, nv.getHoTen().getTen());
            prepareStatement.setString(12, nv.getDiaChi().getSoNha());
            prepareStatement.setString(13, nv.getDiaChi().getCumDanCu());
            prepareStatement.setString(14, nv.getDiaChi().getXaPhuong());
            prepareStatement.setString(15, nv.getDiaChi().getQuanHuyen());
            prepareStatement.setString(16, nv.getDiaChi().getTinhThanh());

            int rowCount = prepareStatement.executeUpdate();
            int ndID = 0;
            String sql2 = "Select id from tblNguoiDung "
                    + "ORDER BY id Desc";
            Statement statement = this.conn.createStatement();
            ResultSet rs = statement.executeQuery(sql2);

            if (rs.next()) {
                ndID = rs.getInt(1);
            }
            String sql3 = "INSERT INTO tblNhanVien (tblNguoiDungid) "
                    + "value(" + ndID + ")";
            statement.executeUpdate(sql3);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(NhanVienDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public NhanVien[] getAll() {
        String sql = "SELECT nd.*,nv.id as id1 FROM pet_spa.tblnhanvien nv "
                + "inner join pet_spa.tblnguoidung nd on nd.id = nv.tblNguoiDungid "
                +"where ngayxoa IS  NULL ";
        Vector<NhanVien> listNV = new Vector<NhanVien>();
        NhanVien[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();// dùng để thực thi câu lệnh
            rs = statement.executeQuery(sql);// thực thi không làm thay đổi dữ liệu
            int count = 0;
            while (rs.next()) {// đọc dòng tiếp theo của kết quả
                NhanVien nv = new NhanVien(rs.getString(2),
                        rs.getString(3),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate("ngaysinh"), rs.getTime("ngaysinh")).toLocalDate(),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(4),
                        rs.getString(8),
                        new HoTen(rs.getString(9),
                                rs.getString(10),
                                rs.getString(11)),
                        new DiaChi(rs.getString(12),
                                rs.getString(13),
                                rs.getString(14),
                                rs.getString(15),
                                rs.getString(16)));
                nv.setId(rs.getInt("id1"));
                listNV.add(nv);
            }
            result = new NhanVien[count];
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        return listNV.toArray(result);
    }

    public boolean update(NhanVien nv) {
        String sql1 = "UPDATE tblNguoiDung "
                + "SET soCCCD = ? , ngaysinh = ?, email = ?, sdt = ?, "
                + "ho = ?, tendem = ?, ten = ?, sonha = ?, cumdancu = ?, "
                + "xaphuong = ?, quanhuyen = ?, tinhthanh = ? "
                + "WHERE tendangnhap = ?";
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, nv.getSoCCCD());
            prepareStatement.setString(2, nv.getNgaySinh().toString());
            prepareStatement.setString(3, nv.getEmail());
            prepareStatement.setString(4, nv.getSdt());
            prepareStatement.setString(5, nv.getHoTen().getHo());
            prepareStatement.setString(6, nv.getHoTen().getTenDem());
            prepareStatement.setString(7, nv.getHoTen().getTen());
            prepareStatement.setString(8, nv.getDiaChi().getSoNha());
            prepareStatement.setString(9, nv.getDiaChi().getCumDanCu());
            prepareStatement.setString(10, nv.getDiaChi().getXaPhuong());
            prepareStatement.setString(11, nv.getDiaChi().getQuanHuyen());
            prepareStatement.setString(12, nv.getDiaChi().getTinhThanh());
            prepareStatement.setString(13,nv.getTenDangNhap() );
            prepareStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void delete(int id) {
        String sql1 = "UPDATE tblNhanVien SET ngayxoa = ? WHERE id = ? ";
        try {
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql1);
            prepareStatement.setString(1, LocalDateTime.now().toString());
            prepareStatement.setInt(2, id);
            prepareStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public NhanVien getByID(int id) {
        String sql = "SELECT nd.* ,tblNguoiDungid,ngayxoa FROM tblnhanvien nv\n"
                + "inner join tblnguoidung nd on nd.id = nv.tblNguoiDungid \n"
                + "WHERE nv.id =" + id ;// câu lệnh sql
        Vector<NhanVien> listNV = new Vector<NhanVien>();
        NhanVien[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();// dùng để thực thi câu lệnh
            rs = statement.executeQuery(sql);// thực thi không làm thay đổi dữ liệu
            int count = 0;
            while (rs.next()) {// đọc dòng tiếp theo của kết quả
                NhanVien nv = new NhanVien(rs.getString("tendangnhap"),
                        rs.getString("matkhau"),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate("ngaysinh"), rs.getTime("ngaysinh")).toLocalDate(),
                        rs.getString("email"),
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
                return nv;
            }
            result = new NhanVien[count];
        } catch (Exception e) {
            return null;
        }
        return null;
    }

    public NhanVien[] getByTenNV(String tenNV) {
        String sql = "SELECT nd.*,nv.id as id1 FROM tblnhanvien nv\n"
                + "inner join tblnguoidung nd on nd.id = nv.tblNguoiDungid \n"
                + "WHERE ten LIKE '%" + tenNV + "%'" + " AND " + ConditionsOfExist;// câu lệnh sql
        Vector<NhanVien> listNV = new Vector<NhanVien>();
        NhanVien[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();// dùng để thực thi câu lệnh
            rs = statement.executeQuery(sql);// thực thi không làm thay đổi dữ liệu
            int count = 0;
            while (rs.next()) {// đọc dòng tiếp theo của kết quả
                NhanVien nv = new NhanVien(
                        rs.getString("tendangnhap"),
                        rs.getString("matkhau"),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate("ngaysinh"), rs.getTime("ngaysinh")).toLocalDate(),
                        rs.getString("email"),
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
                nv.setId(rs.getInt("id1"));
                listNV.add(nv);
            }
            result = new NhanVien[count];
        } catch (Exception e) {
            return null;
        }
        return listNV.toArray(result);
    }
    public void setIDKH(NhanVien nv){
        String sql1 = "SELECT kh.* FROM tblnhanvien kh\n"
                    + "inner join tblnguoidung nd  on kh.tblNguoiDungid=nd.id\n"
                    + "where nd.tendangnhap = '"+nv.getTenDangNhap()+"';";
            Statement stm;
        try {
            stm = this.conn.createStatement();
             ResultSet rs1 = stm.executeQuery(sql1);;
           
            if(rs1.next()){
                nv.setId(rs1.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            
           
    }
}

