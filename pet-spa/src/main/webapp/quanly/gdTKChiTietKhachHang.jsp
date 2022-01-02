<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.math.BigInteger"%>
<%@page import="model.*"%>
<%@page import="model.KhachHang"%>
<%@page import="model.NhanVien"%>
<%@page import="model.HoTen"%>
<%@page import="model.NguoiDung"%>
<%@page import="model.HoaDon"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="model.TKKhachHang"%>
<%@page import="dao.TKKhachHangDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.*"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Thống kê chi tiết</title>
    </head>
    <%
        HoaDonDAO dao = new HoaDonDAO();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
        //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
        // if(kh==null){
        //   return;
        // }
        String tk = request.getParameter("kh_id");
        String t = request.getParameter("thang");
        String n = request.getParameter("nam");
        int id = Integer.parseInt(tk);
        int thang = Integer.parseInt(t);
        int nam = Integer.parseInt(n);
        HoaDon[] listHD = dao.getByIDKH(id, thang, nam);

    %>   
    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <h1 style="font-family: emoji; font-size: 250%;">Thống kê chi tiết đơn hàng khách hàng </h1>
        <table class="table">
            <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã hóa đơn</th>
                <th class="table__heading">Tổng tiền</th>
                <th class="table__heading">Tên Nhân viên</th>
                <th class="table__heading">Ghi chú</th>


                <%                    int STT = 0;
                    int tong = 0;
                    for (int i = 0; i < listHD.length; i++) {
                        STT += 1;
                        String tt = listHD[i].getThanhTien().toString();
                        tong += Integer.parseInt(tt);
                        String tien = FormateDateTime.convertBigNumToCurrency(listHD[i].getThanhTien());
                        
                        if(listHD[i].getMoTa()==null){
                            listHD[i].setMoTa("");
                        }
                %>
            <tr class="table__row">
                <td class="table__content" ><%=STT%></td>
                <td class="table__content" ><%=listHD[i].getId()%></td>
                <td class="table__content" ><%=tien + "" + "₫"%></td>
                <td class="table__content" ><%=listHD[i].getNhanVien().getHoTen() %></td>
                <td class="table__content" ><%=listHD[i].getMoTa()%></td>
            </tr>
            <%
                }
            %>  



        </table>
        <p style="float:right; margin-right: 30px"><strong>Tổng tiền: <%=FormateDateTime.convertBigNumToCurrency(BigInteger.valueOf(tong)) + "" + "₫"%></strong></p>
        <style>

            .button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }
            .center {
                margin: auto;
                width: 50%;
                border: 3px solid green;
                padding: 10px;
            }
            .center:hover {
                color: white;
                text-decoration: none;
            }
        </style>

    </body>


</html>