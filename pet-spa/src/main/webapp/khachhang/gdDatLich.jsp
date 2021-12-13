<%-- 
    Document   : gdDatLich
    Created on : Oct 9, 2021, 7:40:02 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lịch</title>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="../style/datlichhoadon.css" rel="stylesheet" type="text/css"/>
</head>
    <body>
        <header>
                <div class="nav1">
                    <div class="logo">
                        <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
        <main>
            <div class="container1">
                <div class = "item1">
                    <h1 style=" margin-left: 80px;">Chọn ngày giờ</h1>
                    <div class="input-box">
                        <i ></i>
                        <input type="date" placeholder="Nhập ngày">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="time" placeholder="Nhập giờ">
                    </div>
                    <div class="btn-box">
                        <button type="submit">
                            Tìm kiếm
                        </button>
                    </div>
                </div>  
                <table class="table" style="margin-left: 20px; margin-top: 80px;">
                    <tr>
                      <th class="table__heading">STT</th>
                      <th class="table__heading">Tên dịch vụ</th>
                      <th class="table__heading">Số lương</th>
                      <th class="table__heading">Giá</th>
                      <th class="table__heading">Tùy chọn</th>
                    </tr>
                    <tr class="table__row">
                      <td class="table__content" >1</td>
                      <td class="table__content" >Tắm</td>
                      <td class="table__content" >1</td>
                      <td class="table__content" >100.000đ</td>
                        <td class="table__content" ><div class="btn-box" style="text-align: center;">
                            <button type="submit" style="background-color: red; margin-left: 15px;">
                                Hủy
                        </button>
                    </div></td>
                      </td>
                  </table>
                  <div style="text-align: right; margin-right: 170px; margin-top: 10px; font-weight: bold;">
                      Giá dự kiến = 
                  </div>
                  <div class="btn-box" style="margin-right: 55px; margin-top: 50px;">
                    <button type="submit" style="background-color: rgb(5, 199, 5);">
                        Đặt lịch
                    </button>
                </div>
            </div>

            <div class="container2">
                <div class="item2">
                    <h1 style="text-align: center;">Tìm kiếm dịch vụ</h1>
                    <div class="input-box" style=" text-align: center;margin-top:70px;">
                        <i ></i>
                        <input type="text" placeholder="Tên dịch vụ" style="height: 55px; width: 70%;">
                    </div>
                    <div class="btn-box" style="margin-right: 142px;">
                        <button type="submit">
                            Tìm kiếm
                        </button>
                    </div>
                    
                </div>
            <table class="table" style="margin-left: 20px; margin-top: 105px;">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Tên dịch vụ</th>
                <th class="table__heading">Tùy chọn</th>
              </tr>
              <tr class="table__row" style="text-align: center;">
                <td class="table__content" >1</td>
                <td class="table__content" >Tắm</td>
                <td class="table__content" ><div class="btn-box" style="text-align: center;">
                    <button type="submit" style="background-color: rgb(5, 199, 5);margin-left: 15px;">
                        Thêm
                    </button>
                </div></td>
            </table>
            </div>
        </main>
    </body>
</html>
