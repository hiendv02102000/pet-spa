<%-- 
    Document   : doLuuDangKy
    Created on : Nov 17, 2021, 9:07:18 PM
    Author     : admin
--%>


<%@page import="sun.security.util.Length"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="model.*, dao.*"  %>  

<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
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
        <title>Them nhan vien</title>
        <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <%
            NhanVienDAO dao = new NhanVienDAO();
            int nvid = Integer.parseInt(request.getParameter("id_xoa"));
            dao.delete(nvid);
            response.sendRedirect("./gdQuanLyNV.jsp"); 
             //LichHenDichVu[] listLichHen =  ;
         %>   

    </body>
</html>
