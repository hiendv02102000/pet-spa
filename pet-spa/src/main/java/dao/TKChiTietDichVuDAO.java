/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import model.TKChiTietDichVu;
import model.TKDichVu;

/**
 *
 * @author admin
 */
public class TKChiTietDichVuDAO extends DAO {

    public TKChiTietDichVuDAO() {
        super();
    }
//    public TKChiTietDichVu[] getAll(){
//        return null;
//    }

    public TKChiTietDichVu[] getByDichVuIDOnMonth(int dvid, int thang, int nam) {
        String sql = "SELECT dv.*,Date(hd.ngaytao) as ngay, sum(hddv.soluong) as solan\n"
                + "FROM pet_spa.tblhoadon hd\n"
                + "inner join tblhoadondichvu hddv on hddv.tblHoaDonid = hd.id\n"
                + "inner join tbldichvu dv on hddv.tblDichVuid = dv.id\n"
                       + "where month(hd.ngaytao)=" + thang + " and year(hd.ngaytao) =" + nam +" and dv.id =" +dvid+ "\n"
                + " group by ngay;";
        Vector<TKChiTietDichVu> listTK = new Vector<TKChiTietDichVu>();
        TKChiTietDichVu[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql);
            int count = 0;
            while (rs.next()) {
                TKChiTietDichVu tk = new TKChiTietDichVu(rs.getInt("solan"),rs.getDate("ngay").toLocalDate());
                tk.setTen(rs.getString("ten"));
                listTK.add(tk);
            }
            result = new TKChiTietDichVu[count];
        } catch (Exception e) {
            System.out.println("Ko lay dc");
            return null;

        }
        return listTK.toArray(result);
    }
}
