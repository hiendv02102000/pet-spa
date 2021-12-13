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
            <title>Quản lý dịch vụ</title>
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
            <h1 style="font-family: emoji; font-size: 250%;">Danh sách dịch vụ</h1>
            
            <div class="item2">
            <div class="btn-box">
                    <div class="input-box" style=" text-align: center;margin-top:70px;">
                        <i ></  i>
                        <input type="text" placeholder="Tìm kiếm nhân viên" style="height: 40px; width: 30%; text-align: center">
                <a href="gdTimKiemDV.jsp">
                    <button type="submit" style="background-color: black">
                        Tìm kiếm
                            </button>
                </a>  
          </div> 
                </div>
          </div>  
            <table class="table" style="font-style: normal">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã dịch vụ</th>
                <th class="table__heading">Tên dịch vụ</th>
                <th class="table__heading">Mô tả</th>
                <th class="table__heading">Giá</th>
              </tr>
              <tr class="table__row">
                <td class="table__content" >1</td>
                <td class="table__content" >DV1</td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Cắt tỉa lông</a></td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Cắt tỉa lông</a></td>
                <td class="table__content" >100.000đ</td>
              </tr>        
              <tr class="table__row">
                <td class="table__content" >2</td>
                <td class="table__content" >DV2</td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Tắm</a></td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Tắm</a></td>
                <td class="table__content" >200.000đ</td>
              </tr>     
              <tr class="table__row">
                <td class="table__content" >3</td>
                <td class="table__content" >DV3</td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Mát-xa</a></td>
                <td class="table__content" ><a href="gdTuyChinhThongTinDV.jsp">Mát-xa</a></td>
                <td class="table__content" >300.000đ</td>
              </tr>     
            </table>
            <div class="btn-box" style="text-align: right; margin-right: 30px ">
                <a href="gdThemDichVu.jsp">
                    <button type="submit" style="background-color: black;">
                         Thêm dịch vụ
                             </button>
                </a>
            </div>
            </body>
            
            
</html>
