<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.TKDoanhThu"%>
<%@page import="dao.TKDoanhThuDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="vi">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Thống kê doanh thu</title>
        </head>
         <%
             TKDoanhThuDAO dao = new TKDoanhThuDAO();
             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
             TKDoanhThu[] listDoanhThu =  dao.getOnMonth(10,2021);
         %>  
        <body>
                <header>
                <div class="nav1">
                    <div class="logo">
                        <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
            <h1 style="font-family: emoji; font-size: 250%;">Thống kê doanh thu</h1>
            <table class="table">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Ngày</th>
<!--                <th class="table__heading">Ngày hẹn</th>-->
                <th class="table__heading">Tổng tiền</th>
                <%
                    int STT=0;
                    for(int i=0;i<listDoanhThu.length;i++){
                        STT+=1;
//                         listDoanhThu[i].getNgay().getDayOfMonth();
                        LocalDate dateTime =listDoanhThu[i].getNgay();
                        %>
                        <tr class="table__row">
                        <td class="table__content" ><a href=<%="gdDoanhThuChiTiet.jsp?tk_day="+dateTime.getDayOfMonth()%>><%=STT%></a></td>
                        <td class="table__content" ><%=dateTime.getDayOfMonth()+"-"+dateTime.getMonthValue()+"-"+dateTime.getYear()%></td>
                       
                        <td class="table__content" ><%=listDoanhThu[i].getTongDoanhThu()+""+"₫"%></td>
                        </tr>
                   <%
                    }     
             %>  
<!--              
              <tr class="table__row">
                <td class="table__content" ><a href="gdLichHenChiTiet.jsp">H30</a></td>
                <td class="table__content" >9:00</td>
                <td class="table__content" >18/11/2021</td>
                <td class="table__content" >300.000đ</td>

              </tr>-->

                
            </table>
            </body>
            
            
</html>