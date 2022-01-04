<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.LichHen"%>
<%@page import="dao.LichHenDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Xem lịch hẹn</title>
    </head>
    <%
        LichHenDAO dao = new LichHenDAO();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
        KhachHang kh = (KhachHang) session.getAttribute("khachhang");
        if (kh == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
            return;
        }
        LichHen[] listLichHen = dao.getByKhachHangID(kh.getId());
    %>  
    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <h1 style="font-family: emoji; font-size: 250%;">Lịch hẹn của khách hàng</h1>
        <table class="table">
            <tr>
                <th class="table__heading">Mã hẹn</th>
                <th class="table__heading">Thời gian hẹn</th>
                <!--                <th class="table__heading">Ngày hẹn</th>-->
                <th class="table__heading">Giá dự kiến</th>
                    <%
                        for (int i = 0; i < listLichHen.length; i++) {
                    %>
            <tr class="table__row">
                <td class="table__content" ><a href=<%="gdLichHenChiTiet.jsp?lh_id=" + listLichHen[i].getId()%>><%=listLichHen[i].getId()%></a></td>
                <td class="table__content" ><%=listLichHen[i].getThoiGianHen().format(myFormatObj)%></td>

                <td class="table__content" ><%=FormateDateTime.convertBigNumToCurrency(listLichHen[i].getGiaDuKien()) + "" + "₫"%></td>
            </tr>
            <%
                }
            %>  
            <!--              
                          <tr class="table__row">
                            <td class="table__content" ><a href="gdLichHenChiTiet.jsp">H30</a></td>
                            <td class="table__content" >9:00</td>
                            <td class="table__content" >18/11/2021</td>
                            <td class="table__content" >300.000đ</td>
            
                          </tr>-->


        </table>
    </body>


</html>