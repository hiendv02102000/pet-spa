/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import model.TKDichVu;

/**
 *
 * @author admin
 */
public class TKDichVuDAO extends DAO {
    
    public TKDichVuDAO() {
        super();;
    }
    
    public TKDichVu[] getAllOnMonth(int thang, int nam) {
        
        String sql = "SELECT dv.*,sum(hddv.soluong) as solan\n"
                + "FROM pet_spa.tblhoadon hd\n"
                + "inner join tblhoadondichvu hddv on hddv.tblHoaDonid = hd.id\n"
                + "inner join tbldichvu dv on hddv.tblDichVuid = dv.id\n"
                + "where month(hd.ngaytao)=" + thang + " and year(hd.ngaytao) =" + nam + "\n"
                + " group by hddv.tblDichVuid;";
        Vector<TKDichVu> listTK = new Vector<TKDichVu>();
        TKDichVu[] result;
        ResultSet rs;
        try {
            Statement statement = this.conn.createStatement();
            rs = statement.executeQuery(sql);
            int count = 0;
            int sum = 0;
            while (rs.next()) { 
                TKDichVu tk = new TKDichVu(0, rs.getInt("solan"), rs.getString("ten"), new BigInteger(rs.getString("giaca")));
                tk.setId(rs.getInt("id"));
                sum += rs.getInt("solan");
                listTK.add(tk);
            }
            for(TKDichVu tk : listTK){
                tk.setTyle((float) (1.0*tk.getSoLan()/(float)sum));
            }
            result = new TKDichVu[count];
        } catch (Exception e) {
            System.out.println("Ko lay dc");
            System.out.println(e);
            return null;
            
        }
        return listTK.toArray(result);
        
    }

}
