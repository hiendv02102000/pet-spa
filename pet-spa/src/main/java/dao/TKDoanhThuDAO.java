/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Vector;
import model.TKDoanhThu;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class TKDoanhThuDAO extends DAO{
    private final String ConditionsOfExist="ngayxoa IS NULL";
    public TKDoanhThuDAO(){
        super();
    }
    public TKDoanhThu[] getOnMonth(int thang, int nam){
        String sql="select sum(tkdt.thanhtien), tkdt.ngaytao1 "
                + "from (select thanhtien, date(ngaytao) as ngaytao1 "
                + "from pet_spa.tblhoadon "
                + "where month(ngaytao)="+thang+" AND year(ngaytao)="+nam+" ) as tkdt "
                + "group by tkdt.ngaytao1;";
        
        Vector<TKDoanhThu> listTK=new Vector<TKDoanhThu>();
        TKDoanhThu[] result ;
        ResultSet rs;
         LocalDate ngay=null;
        try {
            Statement statement=this.conn.createStatement();//dung de thuc thi cau lenh
            rs=statement.executeQuery(sql);//thuc thi ko lam thao doi dl
            int count=0;
            while(rs.next()){//doc dong tiep theo cua ket qua
                TKDoanhThu dt=new TKDoanhThu(BigInteger.valueOf(rs.getInt(1)),FormateDateTime.convertDBToLocalDateTime(rs.getDate(2), rs.getTime(2)));
                listTK.add(dt);
            }
            result =new TKDoanhThu[count];
            
        } catch (Exception e) {
            return null;
            
        }
        return listTK.toArray(result);
    }

}
