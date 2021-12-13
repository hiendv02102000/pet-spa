<%-- 
    Document   : gdQuanLyNV
    Created on : Oct 9, 2021, 7:32:48 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Doanh thu chi tiết</title>
            </head>
            
            <body>
              <header>
                <div class="container1">
                    <div class="nav1">
                        <div class="logo">
                            <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                        </div>
                </div>
            </header>
            <h1 style="font-family: emoji; font-size: 250%;">Thống kê chi tiết doanh thu</h1>
            <table class="table">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã hóa đơn</th>
                <th class="table__heading">Ca làm</th>
                <th class="table__heading">Ngày tạo</th>
                <th class="table__heading">Thành tiền</th>
              <tr class="table__row">
                <td class="table__content" >1</td>
                <td class="table__content" >INT1</td>
                <td class="table__content" >Cắt tỉa lông, tắm</td>
                <td class="table__content" >Sáng</td>
                <td class="table__content" >100.000đ</td>
              </tr>
              <tr class="table__row" style="font-weight: bold" >
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" >Tổng : </td>
                <td class="table__content" ></td>
              </tr>
            </table>
            </body>
            
            
</html> 