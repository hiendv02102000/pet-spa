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
            <title>Lịch hẹn chi tiết</title>
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
                <th class="table__heading">Dịch vụ</th>
                <th class="table__heading">Số lượng</th>
                <th class="table__heading">Giá</th>
                <th class="table__heading">Mô tả</th>
              <tr class="table__row">
                <td class="table__content" >Mát-xa</td>
                <td class="table__content" >2</td>
                <td class="table__content" >250.000đ</td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >Cắt tỉa</td>
                <td class="table__content" >3</td>
                <td class="table__content" >300.000đ</td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row" style ="font-weight: bold">
                <td class="table__content"  >Tổng : </td>
                <td class="table__content" ></td>
                <td class="table__content" >550.000đ</td>
                <td class="table__content" ></td>
              </tr>

                
            </table>
            </body>
            
            
</html>