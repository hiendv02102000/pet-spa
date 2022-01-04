<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.TKDoanhThu"%>
<%@page import="dao.TKDoanhThuDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Thống kê doanh thu</title>
    </head>
    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        TKDoanhThuDAO dao = new TKDoanhThuDAO();
        LocalDate date = LocalDate.now();
        TKDoanhThu[] listDoanhThu = dao.getOnMonth(date.getMonthValue(), date.getYear());
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        if (request.getParameter("thang") != null && request.getParameter("nam") != null) {
            try {
                String t = request.getParameter("thang");
                String n = request.getParameter("nam");
                int thang = Integer.parseInt(t);
                int nam = Integer.parseInt(n);
                listDoanhThu = dao.getOnMonth(thang, nam);
            } catch (Exception e) {
            }

        }
    %>  
    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <h1 style="font-family: emoji; font-size: 250%;">Thống kê doanh thu</h1>
        <form action="./gdTKDoanhThu.jsp" method="GET">
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
                <th class="table__heading">STT</th>
                <th class="table__heading">Ngày</th>
                <!--                <th class="table__heading">Ngày hẹn</th>-->
                <th class="table__heading">Tổng tiền</th>
                    <%
                        int STT = 0;
                        int tong = 0;
                        for (int i = 0; i < listDoanhThu.length; i++) {
                            STT += 1;
                            String t = listDoanhThu[i].getTongDoanhThu().toString();
                            tong += Integer.parseInt(t);
                            LocalDate dateTime = listDoanhThu[i].getNgay();
                            String tien = FormateDateTime.convertBigNumToCurrency(listDoanhThu[i].getTongDoanhThu());
                    %>
            <tr class="table__row">
                <td class="table__content" ><a href=<%="gdDoanhThuChiTiet.jsp?tk_day=" + dateTime.getDayOfMonth() + "&month=" + dateTime.getMonthValue() + "&year=" + dateTime.getYear()%>><%=STT%></a></td>
                <td class="table__content" ><%=dateTime.getDayOfMonth() + "-" + dateTime.getMonthValue() + "-" + dateTime.getYear()%></td>

                <td class="table__content" ><%=tien + "" + "₫"%></td>
            </tr>

            <%
                }

            %> 




        </table>
        <p style="float:right; margin-right: 30px"><strong>Tổng doanh thu: <%=FormateDateTime.convertBigNumToCurrency(BigInteger.valueOf(tong)) + "" + "₫"%></strong></p>
    </body>


</html>