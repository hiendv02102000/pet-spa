<%-- 
    Document   : gdQuanLyNV
    Created on : Nov 17, 2021, 8:54:29 PM
    Author     : admin
--%>
<%@page import="java.time.LocalDate"%>
<%@ page import="model.*, dao.*"  %>  
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
        <%
            NhanVienDAO dao = new NhanVienDAO();
            NhanVien[] listNV = dao.getAll();
            if(request.getParameter("timkiemnv")!=null){
                listNV = dao.getByTenNV(request.getParameter("timkiemnv"));
            }
        %>
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
                    <form action="./gdQuanLyNV.jsp" method="GET">
                        <input name="timkiemnv" type="text" placeholder="Tìm kiếm nhân viên" style="height: 40px; width: 30%; text-align: center">

                        <button type="submit" style="background-color: black">
                            Tìm kiếm
                        </button>

                    </form>
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
            <%
                String s = " ";
                for (int i = 0; i < listNV.length; i++) {
            %>
            <tr class="table__row">
                <td class="table__content" ><%=i + 1%></td>
                <td class="table__content" ><%=listNV[i].getId()%></td>
                <td class="table__content" ><%=listNV[i].getTenDangNhap()%></td>            
                <td class="table__content" ><a href="gdTuyChinhThongTinNV.jsp?nv_id=<%=listNV[i].getId()%>"><%=listNV[i].getHoTen()%></a></td>              
                <td class="table__content" ><%=listNV[i].getNgaySinh()%></td>
                <td class="table__content" ><%=listNV[i].getSdt()%></td>
                <td class="table__content" ><%=listNV[i].getEmail()%></td>
                <td class="table__content" ><%=listNV[i].getDiaChi()%></td>
                <td class="table__content" ><%=listNV[i].getSoCCCD()%></td>
            </tr> 
            <% }%>

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
