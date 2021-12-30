<%-- 
    Document   : gdQuanLyNV
    Created on : Oct 9, 2021, 7:32:48 PM
    Author     : admin
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalTime"%>
<%@page import="model.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.TKHoaDonDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Thống kê hóa đơn</title>
    </head>
    <%
        TKHoaDonDAO dao = new TKHoaDonDAO();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
        //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
        // if(kh==null){
        //   return;
        // }
        TKHoaDon[] listtkhd = dao.getAllonday();
    %>  
    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">
                        <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
                </div>
        </header>
        <h1 style="font-family: emoji; font-size: 250%;">Doanh sách hóa đơn theo ca</h1>
        <table class="table">
            <tr>
                <th class="table__heading">Mã hóa đơn</th>
                
                <th class="table__heading">Ca làm</th>
                <th class="table__heading">Ngày tạo</th>
                <th class="table__heading">Thành tiền</th>
            </tr>
              <%
                  int tong = 0;
                    String ca="Sáng";
                    if(LocalTime.now().isAfter(LocalTime.of(12,0,0))){
                        ca="Tối";
                    }
                    for(int i=0;i<listtkhd.length;i++){
                     TKHoaDon t= listtkhd[i];
                     tong += t.getThanhTien().intValue();
                        %>
                        <tr class="table__row">
                            <td class="table__content" ><a href=<%="gdTKChiTietHoaDon.jsp?hd_id="+t.getId()%> ><%=t.getId()%></a></td>
                           
                            <td class="table__content" ><%=ca%></td>
                            <td class="table__content" ><%=t.getNgayTao().format(myFormatObj)%></td>
                            <td class="table__content" ><%=t.getThanhTien()%></td>
                         </tr>
                   <%
                    }     
             %>  
                
           
            <tr class="table__row"  style="font-weight: bold">
                <td class="table__content" ></td>
                <td class="table__content" >Tổng : </td>
                <td class="table__content" ></td>
                <td class="table__content" ><%=tong%></td>
            </tr>
        </table>
    </body>


</html>