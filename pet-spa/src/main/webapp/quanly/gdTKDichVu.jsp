<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="model.QuanLy"%>
<%@page import="java.time.LocalDate"%>
<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.DichVu"%>
<%@page import="model.TKDichVu"%>
<%@page import="dao.TKDichVuDAO"%>
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
        <title>Thống kê dịch vụ</title>
    </head>
    <%
        QuanLy ql = (QuanLy) session.getAttribute("quanly");

        if (ql == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        TKDichVuDAO dao = new TKDichVuDAO();
        LocalDate date = LocalDate.now();
        int thang = date.getMonthValue();
        int nam = date.getYear();
        TKDichVu[] listTKDV = dao.getAllOnMonth(thang, nam);
        if (request.getParameter("thang") != null && request.getParameter("nam") != null) {
            try {
                String t = request.getParameter("thang");
                String n = request.getParameter("nam");
                thang = Integer.parseInt(t);
                nam = Integer.parseInt(n);
                listTKDV = dao.getAllOnMonth(thang, nam);
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
        <h1 style="font-family: emoji; font-size: 250%;">Thống kê dịch vụ</h1>
        <form action="./gdTKDichVu.jsp" method="GET">
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
                <th class="table__heading">Mã dịch vụ</th>
                <th class="table__heading">Tên dịch vụ</th>
                <th class="table__heading">Số lần</th>
                <th class="table__heading">tyle</th>
                    <%
                        for (int i = 0; i < listTKDV.length; i++) {

                    %>
            <tr class="table__row">
                <td class="table__content" ><a href=<%="gdTKChiTietDichVu.jsp?dv_id=" + listTKDV[i].getId() + "&thang=" + thang + "&nam=" + nam%>><%=listTKDV[i].getId()%></a></td>
                <td class="table__content" ><%=listTKDV[i].getTen()%></td>
                <td class="table__content" ><%=listTKDV[i].getSoLan()%></td>
                <td class="table__content" ><%=Math.round(listTKDV[i].getTyle() * 100) + "%"%></td>

            </tr>
            <%
                }
            %>  



        </table>
    </body>


</html>