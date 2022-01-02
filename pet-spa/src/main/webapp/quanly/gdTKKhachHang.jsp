<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.TKKhachHang"%>
<%@page import="dao.TKKhachHangDAO"%>
<%@page import="model.HoaDon"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Thống kê khách hàng</title>
        </head>
         <%
             TKKhachHangDAO dao = new TKKhachHangDAO();
             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
             TKKhachHang[] listTKKH =  dao.getKHOnMonth(10, 2021);
             
             for(int i=0;i<listTKKH.length;i++){
                 %>
                 <p>
                     <%=listTKKH[i].getKhachHang().getId() %>
                 </p>
                 <%
             }
             
         %>  
        <body>
                <header>
                <div class="nav1">
                    <div class="logo">
                        <!--<a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>-->
                    </div>
            </div>
        </header>
            <h1 style="font-family: emoji; font-size: 250%;">Doanh thu tháng này</h1>
            <table class="table">
              <tr>
                <th class="table__heading">Mã khách hàng</th>
                <th class="table__heading">Tên khách hàng</th>
                <th class="table__heading">Loại khách hàng</th>
                <th class="table__heading">Số lần mua</th>
                <th class="table__heading">Tổng tiền đã thanh toán</th>
                <%
                    for(int i=0;i<listTKKH.length;i++){
                                   %>
                        <tr class="table__row">
                        <td class="table__content" ><a href=<%="gdTKChiTietKhachHang.jsp?kh_id="+listTKKH[i].getId() %>><%=listTKKH[i].getId()%></a></td>
                        <td class="table__content" ><%=listTKKH[i].getHoTen() %></td>
                        <td class="table__content" ><%=listTKKH[i].getLoai() %></td>
                        <td class="table__content" ><%=listTKKH[i].getSolan() %></td>
                        <td class="table__content" ><%=listTKKH[i].getTongThanhToan()+""+"₫"%></td>
                        </tr>
                   <%
                    }     
             %>  


                
            </table>
            </body>
            
            
</html>