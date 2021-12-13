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
            <title>Quản lý nhân viên</title>
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
            <h1 style="font-family: emoji; font-size: 250%;">Danh sách nhân viên</h1>
            <div class="item2">
            <div class="btn-box">
                    <div class="input-box" style=" text-align: center;margin-top:70px;">
                        <i ><i>
                        <input type="text" placeholder="Tìm kiếm nhân viên" style="height: 40px; width: 30%; text-align: center">
                <a href="gdThemNV.jsp">
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
                <th class="table__heading">Mã nhân viên</th>
                <th class="table__heading">Tên đăng nhập</th>
                <th class="table__heading">Họ và tên</th>
                <th class="table__heading">Ngày sinh</th>
                <th class="table__heading">Số điện thoại</th>
                <th class="table__heading">Email</th>
                <th class="table__heading">Địa chỉ</th>
                <th class="table__heading">Số căn cước công dân</th>
              </tr>
              <tr class="table__row">
                <td class="table__content" >1</td>
                <td class="table__content" >NV1</td>
                <td class="table__content" >heroleloi</td>            
                <td class="table__content" ><a href="gdTuyChinhThongTinNV.jsp">Đỗ Văn Hiển</a></td>              
                <td class="table__content" >01/01/2000</td>
                <td class="table__content" >0123456789</td>
                <td class="table__content" >hiendv@gmail.com</td>
                <td class="table__content" >Hà Tây - Hà Nội</td>
                <td class="table__content" >012213214567</td>
              </tr>             
            </table>
            <div class="btn-box" style="text-align: right; margin-right: 30px ">
                <a href="gdThemNV.jsp">
                    <button type="submit" style="background-color: black;">
                         Thêm nhân viên
                             </button>
                </a>
            </div>
            </body>
            
            
</html>
