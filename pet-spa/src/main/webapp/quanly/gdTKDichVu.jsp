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
            <title>Thống kê dịch vụ</title>
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
            <h1 style="font-family: emoji; font-size: 250%;">Doanh thu theo tháng</h1>
            <form class="date" style = "margin-left: 20px">
                <label for="Daytime">Tháng:</label>
                <input type="month" id="NgayThang" name="NgayThang">
              </form> 
            <table class="table">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã dịch vụ</th>
                <th class="table__heading">Tên dịch vụ</th>
                <th class="table__heading">Số dịch vụ sử dụng</th>
                <th class="table__heading">Tỷ lệ sử dụng</th>
              <tr class="table__row">
                <td class="table__content" >1</td>
                <td class="table__content" >001</td>
                <td class="table__content" >Cắt tỉa lông</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >2</td>
                <td class="table__content" >002</td>
                <td class="table__content" >Tắm</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >3</td>
                <td class="table__content" >003</td>
                <td class="table__content" >Mát-xa</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row" style="font-weight: bold">
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content"  >Tổng : </td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
            </table>
            </body>
            
            
</html>