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
            <title>Thống kê hóa đơn</title>
            </head>
            
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
                <th class="table__heading">Các dịch vụ</th>
                <th class="table__heading">Ca làm</th>
                <th class="table__heading">Ngày tạo</th>
                <th class="table__heading">Thành tiền</th>
              <a>
                  <tr class="table__row">
                <td class="table__content" ><a href="gdTKChiTietHoaDon.jsp">INT1</a></td>
                <td class="table__content" >Cắt tỉa lông, tắm</td>
                <td class="table__content" >Sáng</td>
                <td class="table__content" >21/10/2021</td>
                <td class="table__content" >500.000đ</td>
              </tr>
              </a>
              <tr class="table__row">
                <td class="table__content" ><a href="gdTKChiTietHoaDon.jsp">INT2</a></td>
                <td class="table__content" >Tắm</td>
                <td class="table__content" >Sáng</td>
                <td class="table__content" >21/10/2021</td>
                <td class="table__content" >200.000đ</td>
              </tr>
              <tr class="table__row"  style="font-weight: bold">
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" >Tổng : </td>
                <td class="table__content" ></td>
                <td class="table__content" >700.000đ</td>
              </tr>
            </table>
            </body>
            
            
</html>