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
import java.util.Vector;
import model.DichVu;
import model.HoTen;
import model.KhachHang;
import model.LichHen;
import model.LoaiKhachHang;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class LichHenDAO extends DAO {

    private final String ConditionsOfExist = " ngayxoa IS  NULL";

    public LichHenDAO() {
        super();
    }

    public LichHen[] getByKhachHangID(int khID) {
        String sql = "Select * from tblLichHen Where tblKhachHangid = " + khID + " AND " + ConditionsOfExist;
        ResultSet rs;
        Vector<LichHen> listLH = new Vector<LichHen>();
        LichHen[] result;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql);
            int count = 0;
            while (rs.next()) {
                LichHen lh = new LichHen(rs.getInt(1),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(2), rs.getTime(2)),
                        new BigInteger(rs.getString(3)),
                        null,
                        null);
                listLH.add(lh);
                //return FormatVI.decodeVI(rs.getString(2));
            }

            result = new LichHen[count];

        } catch (Exception e) {
            return null;
        }
        return listLH.toArray(result);
    }

    public boolean delete(int ID) {
        String sql = "UPDATE `tbllichhen` SET `ngayxoa` = DATE(NOW()) WHERE `id` = " + ID;

        try {
            Statement statement = this.conn.createStatement();
            int rowCount = statement.executeUpdate(sql);

        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean insert(LichHen lh) {
        try {
            String sql = "INSERT INTO `tbllichhen` (`thoigianhen`, `giadukien`, `tblKhachHangid`)  "
                    + "VALUES (?, ?, ?);";
            PreparedStatement prepareStatement = this.conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setString(1, LocalDateTime.now().toString());
            prepareStatement.setString(2, lh.getGiaDuKien().toString());

            prepareStatement.setInt(3, lh.getKhachHang().getId());
            int rowCount = prepareStatement.executeUpdate();//thực thi làm thay đổi dữ liệu
            ResultSet rs = prepareStatement.getGeneratedKeys();
            int id = 0;
            if (rs.next()) {
                id = rs.getInt(1);
            }
            lh.setId(id);
            // prepareStatement.executeUpdate();
            return rowCount > 0;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public LichHen getByIDWithPreLoadKhachHang(int id) {
        String sql1 = "Select * from tblLichHen "
                + " Where id = " + id + " AND " + ConditionsOfExist;
        String sql2 = "Select lh.id,lh.thoigianhen,lh.giadukien,kh.id,l.*,nd.ho,nd.ten,nd.tendem from ( " + sql1 + " ) as lh "
                + " inner join tblKhachHang kh on kh.id = lh.tblKhachHangid "
                + " inner join tblloaiKhachHang l on l.id = kh.tblLoaiKhachHangid "
                + "inner join tblnguoidung nd  on kh.tblNguoiDungid=nd.id ";
        ResultSet rs;
        System.out.println(sql2);
        Vector<LichHen> listLH = new Vector<LichHen>();
        LichHen[] result;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql2);
            int count = 0;
            if (rs.next()) {
                KhachHang kh = new KhachHang();
                kh.setId(rs.getInt(4));
                LoaiKhachHang loai = new LoaiKhachHang(rs.getInt(5), rs.getString(6), rs.getFloat(7), new BigInteger(rs.getString(8)));
                kh.setLoaiKhachHang(loai);
                HoTen ht =new HoTen(rs.getString("ho"),rs.getString("tendem"),rs.getString("ten"));
                kh.setHoTen(ht);
                LichHen lh = new LichHen(rs.getInt(1),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(2), rs.getTime(2)),
                        new BigInteger(rs.getString(3)),
                        kh,
                        null);
                return lh;
            }
            return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
<<<<<<< HEAD
       
     }


=======

    }

    public LichHen[] getAll() {
        return null;
    }

    public LichHen[] getByKhachHangCondition(String condition) {
        return null;
    }
>>>>>>> 9fa708d2a6c3bc99e6bba4a93a9b2bee1b388f8b
//    public LichHen[] getByID(int ID){
//        return null;
//    }

}
