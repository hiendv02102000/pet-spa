/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import model.HoTen;
import model.KhachHang;
import model.TKKhachHang;

/**
 *
 * @author admin
 */
public class TKKhachHangDAO extends DAO {

    private final String ConditionsOfExist = "ngayxoa IS NULL";

    public TKKhachHangDAO() {
        super();
    }

    public TKKhachHang[] getKHOnMonth(int thang, int nam) {
        String sql = "select tb.idkh,tb.hokh, tb.temdemkh, tb.tenkh,count(tb.idkh) as solan, sum(tb.thanhtien1)\n"
                + "from\n"
                + "(select  nd.ho as hokh, nd.tendem as temdemkh, nd.ten as tenkh,\n"
                + "kh.id as idkh, loaikh.loai as loai1, loaikh.khuyenmai as khuyenmai1 ,\n"
                + "hd.thanhtien as thanhtien1, hd.ngaytao as ngaytao1\n"
                + "from (((pet_spa.tblkhachhang kh\n"
                + "inner join pet_spa.tblhoadon hd on kh.id=hd.tblKhachHangid )\n"
                + "inner join pet_spa.tblloaikhachhang loaikh on loaikh.id=kh.tblLoaiKhachHangid)\n"
                + "inner join pet_spa.tblnguoidung nd on kh.tblNguoiDungid=nd.id )\n"
                + ") as tb\n"
                + "where month(ngaytao1)=" + thang + " and year(ngaytao1)=" + nam + "\n"
                + "group by tb.idkh;";
        Vector<TKKhachHang> listTK = new Vector<TKKhachHang>();
        TKKhachHang[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql);
            int count = 0;
            while (rs.next()) {
//                TKKhachHang kh=new TKKhachHang(new HoTen(rs.getString(2), rs.getString(3), rs.getString(4)),
//                    rs.getInt(5),BigInteger.valueOf(rs.getInt(6)));
                TKKhachHang kh = new TKKhachHang();
                kh.setId(rs.getInt(1));
                kh.setHoTen(new HoTen(rs.getString(2),rs.getString(3), rs.getString(4)));
                kh.setSolan(rs.getInt(5));
                kh.setTongThanhToan(new BigInteger(rs.getString(6)));
                listTK.add(kh);
            }
            result = new TKKhachHang[count];
        } catch (Exception e) {
            System.out.println("Ko lay dc");
            return null;

        }
        return listTK.toArray(result);

    }


}
