<%-- 
    Document   : gdKTLichHen
    Created on : Nov 17, 2021, 9:03:33 PM
    Author     : admin
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.NhanVien"%>
<%@page import="model.LichHen"%>
<%@page import="dao.LichHenDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../style/table.css" rel="stylesheet" type="text/css"/>
        <title>Kiểm Tra Lịch</title>
    </head>
    <%
        LichHenDAO dao = new LichHenDAO();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
        NhanVien nv = (NhanVien) session.getAttribute("nhanvien");
        if (nv == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
            return;
        }
        LichHen[] listLichHen = dao.getAll();
    %>  
    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">
                        <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
                </div>
        </header>
        <h1 style="font-size: 300%;">Lịch hẹn của khách hàng</h1>
        <div class="btn-box">
            <button type="submit">
                Tìm kiếm
            </button>
        </div> 
        <table class="table">
            <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã KH</th>
                <th class="table__heading">Tên Khách Hàng</th>
                <th class="table__heading">Số điện thoại</th>
                <th class="table__heading">Thời gian hẹn</th>

                <th class="table__heading">Giá dự kiến</th>
            </tr>
            <%
                for (int i = 0; i < listLichHen.length; i++) {
            %>
            <tr class="table__row">
                <td class="table__content" ><%=i + 1%></td>
                <td class="table__content" ><%=listLichHen[i].getKhachHang().getId()%></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp"><%=listLichHen[i].getKhachHang().getHoTen().toString()%></a></td>
                <td class="table__content" ><%=listLichHen[i].getKhachHang().getSdt()%></td>
                <td class="table__content" ><%=listLichHen[i].getThoiGianHen().format(myFormatObj)%></td>
                <td class="table__content" ><%=listLichHen[i].getGiaDuKien()%></td>
            </tr>
            <%
                }
            %> 


        </table>
    </body>


</html>