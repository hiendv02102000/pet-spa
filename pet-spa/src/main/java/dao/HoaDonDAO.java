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
import java.time.LocalTime;
import java.util.Vector;
import model.HoTen;
import model.HoaDon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.Vector;
import model.HoaDon;
import model.KhachHang;
import model.NhanVien;
import model.TKDoanhThu;
import utils.FormateDateTime;

/**
 *
 * @author admin
 */
public class HoaDonDAO extends DAO{
    private final String ConditionsOfExist="ngayxoa IS NULL";
    public HoaDonDAO(){
        super();
    }
    //chi tiet hoa don cho thong ke doanh thu
    public HoaDon[] getOnDay(int ngay, int thang, int nam){
        String sql="select tb.idhd, tb.ttien,tb.ngaytao1,tb.mota1,tb.hokh, tb.tendemkh, tb.tenkh, tb.honv, tb.tendemnv, tb.tennv\n" +
            "from\n" +
            "(select hd.id as idhd, hd.thanhtien as ttien, hd.ngaytao as ngaytao1, hd.mota as mota1, nd1.ho as honv, nd1.tendem as tendemnv, nd1.ten as tennv\n" +
            ",nd2.ho as hokh, nd2.tendem as tendemkh, nd2.ten as tenkh\n" +
            "from (((pet_spa.tblhoadon hd\n" +
            "inner join pet_spa.tblnhanvien nv on hd.tblNhanVienid=nv.id)\n" +
            "inner join pet_spa.tblnguoidung nd1 on nv.tblNguoiDungid=nd1.id)\n" +
            "inner join pet_spa.tblkhachhang kh on hd.tblKhachHangid=kh.id)\n" +
            "inner join pet_spa.tblnguoidung nd2 on kh.tblNguoiDungid=nd2.id ) as tb\n" +
            "where  month(ngaytao1)="+thang+" and day(ngaytao1)="+ngay+" and year(ngaytao1)="+nam+" ;";
        
        Vector<HoaDon> listHD=new Vector<HoaDon>();
        ResultSet rs;
        HoaDon[] result;
        try {
            Statement statement=this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count=0;
            while(rs.next()){
                
                HoaDon hd=new HoaDon(rs.getInt(1),
                        BigInteger.valueOf(rs.getInt(2)),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(3),rs.getTime(3)),
                        rs.getString(4),new HoTen(rs.getString(5), rs.getString(6), rs.getString(7)),
                        new HoTen(rs.getString(8), rs.getString(9), rs.getString(10)));
                listHD.add(hd);
            }
            result=new HoaDon[count];
        } catch (Exception e) {
            return null;
        }
        return listHD.toArray(result);
    }
    public HoaDon getByID(int id){
         String sql = "SELECT * FROM tblhoadon Where id = "+id;
       ResultSet rs;
     
        try{ 
            Statement statement = this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count =0;
           if(rs.next()){
               HoaDon hd =new HoaDon(rs.getInt(1),
                       new BigInteger(rs.getString(2)),
                       FormateDateTime.convertDBToLocalDateTime(rs.getDate(3), rs.getTime(3)),
                       rs.getString(4),null, null, null);
             //return FormatVI.decodeVI(rs.getString(2));
                return hd;
           }

         
            return null;
        }catch(Exception e){
            return null;
        }
        
    }
    //chi tiet hoa don cho thong ke khach hang
    public HoaDon[] getByIDKH(int id, int thang, int nam){
        String sql="select tb.idhd, tb.ttien,tb.ngaytao1,tb.mota1, tb.honv, tb.tendemnv, tb.tennv\n" +
            "from\n" +
            "(select kh.id as idkh,hd.id as idhd, hd.thanhtien as ttien, hd.ngaytao as ngaytao1, hd.mota as mota1,nd.ho as honv, nd.tendem as tendemnv, nd.ten as tennv\n" +
            "from ((pet_spa.tblhoadon hd\n" +
            "inner join pet_spa.tblnhanvien nv on hd.tblNhanVienid=nv.id)\n" +
            "inner join pet_spa.tblnguoidung nd on nv.tblNguoiDungid=nd.id)\n" +
            "inner join pet_spa.tblkhachhang kh on hd.tblKhachHangid=kh.id) as tb\n" +
            "where tb.idkh="+id+" and month(ngaytao1)="+thang+" and year(ngaytao1)="+nam+";";
        ResultSet rs;
        Vector<HoaDon> listHD=new Vector<HoaDon>();
        HoaDon[] result;
        try {
            Statement statement=this.conn.createStatement();
            rs=statement.executeQuery(sql);
            int count=0;
            while(rs.next()){
                HoaDon hd=new HoaDon(rs.getInt(1),
                        BigInteger.valueOf(rs.getInt(2)),
                        FormateDateTime.convertDBToLocalDateTime(rs.getDate(3),rs.getTime(3)),
                        rs.getString(4),new HoTen(rs.getString(5), rs.getString(6), rs.getString(7)));
                listHD.add(hd);
            }
            result=new HoaDon[count];
        } catch (Exception e) {
            System.out.println("Khong lay dc");
            return null;
        }
        return listHD.toArray(result);
    }
    public static void main(String[] args) {
        HoaDonDAO hdd=new HoaDonDAO();
        HoaDon[] hd=hdd.getOnDay(10,10,2021);
        System.out.println("Chi tiet hoa don thong ke doanh thu");
        for (HoaDon hoaDon : hd) {
            System.out.println(hoaDon.toStringCTHoaDon());
        }
        
        HoaDon[] hd1=hdd.getByIDKH(1,10,2021);
        System.out.println("Chi tiet hoa don cua khach hang");
        for (HoaDon hoaDon : hd1) {
            
            System.out.println(hoaDon.toStringCTKhachHang());
        }
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
