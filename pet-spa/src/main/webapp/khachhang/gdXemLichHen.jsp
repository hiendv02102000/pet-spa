<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Xem lịch hẹn</title>
            </head>
            
            <body>
                <header>
                <div class="nav1">
                    <div class="logo">
                        <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
            <h1 style="font-family: emoji; font-size: 250%;">Lịch hẹn của khách hàng</h1>
            <table class="table">
              <tr>
                <th class="table__heading">Mã hẹn</th>
                <th class="table__heading">Giờ hẹn</th>
                <th class="table__heading">Ngày hẹn</th>
                <th class="table__heading">Giá dự kiến</th>
              <tr class="table__row">
                <td class="table__content" ><a href="gdLichHenChiTiet.jsp">H18</a></td>
                <td class="table__content" >8:00</td>
                <td class="table__content" >28/10/2021</td>
                <td class="table__content" >890.000đ</td>
              </tr>
              <tr class="table__row">
                <td class="table__content" ><a href="gdLichHenChiTiet.jsp">H30</a></td>
                <td class="table__content" >9:00</td>
                <td class="table__content" >18/11/2021</td>
                <td class="table__content" >300.000đ</td>

              </tr>

                
            </table>
            </body>
            
            
</html>