<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.TKKhachHang"%>
<%@page import="dao.TKKhachHangDAO"%>
<%@page import="model.HoaDon"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Thống kê khách hàng</title>
    </head>
    <%
        TKKhachHangDAO dao = new TKKhachHangDAO();
        LocalDate date = LocalDate.now();
        int thang=date.getMonthValue();
        int nam=date.getYear();
        TKKhachHang[] listTKKH = dao.getKHOnMonth(thang, nam);
        if (request.getParameter("thang") != null && request.getParameter("nam") != null) {
            try {
                    String t = request.getParameter("thang");
            String n = request.getParameter("nam");
            thang = Integer.parseInt(t);
            nam = Integer.parseInt(n);
            listTKKH = dao.getKHOnMonth(thang, nam);
                } catch (Exception e) {
                }
            
        }

    %>  
    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <h1 style="font-family: emoji; font-size: 250%;">Thống kê khách hàng</h1>
        <form action="./gdTKKhachHang.jsp" method="GET">
            <div style="float:right;"> 
                Tháng
                <input name="thang" type="text" placeholder="Tháng" style="width:100px;text-align: center;
                       margin-bottom: 16px;" value=<%=(request.getParameter("thang") != null) ? request.getParameter("thang") : ""%>>
                /
                <input name="nam" type="text" placeholder="Năm" style="width:100px; text-align: center;
                       margin-bottom: 16px" value=<%=(request.getParameter("nam") != null) ? request.getParameter("nam") : ""%>>

                <button type="submit" style="margin-left: 16px;margin-right: 30px; text-align: center;">
                    Thống kê
                </button>
            </div>

        </form>
        <table class="table">
            <tr>
                <th class="table__heading">Mã khách hàng</th>
                <th class="table__heading">Tên khách hàng</th>
                <th class="table__heading">Số lần mua</th>
                <th class="table__heading">Tổng tiền đã thanh toán</th>
                    <%
                        for (int i = 0; i < listTKKH.length; i++) {
                            String tien = FormateDateTime.convertBigNumToCurrency(listTKKH[i].getTongThanhToan());

                    %>
            <tr class="table__row">
                <td class="table__content" ><a href=<%="gdTKChiTietKhachHang.jsp?kh_id=" + listTKKH[i].getId()+ "&thang=" + thang + "&nam=" + nam%>><%=listTKKH[i].getId()%></a></td>
                <td class="table__content" ><%=listTKKH[i].getHoTen()%></td>
                <td class="table__content" ><%=listTKKH[i].getSolan()%></td>
                <td class="table__content" ><%=tien + "" + "₫"%></td>
            </tr>
            <%
                }
            %>  



        </table>
    </body>


</html>