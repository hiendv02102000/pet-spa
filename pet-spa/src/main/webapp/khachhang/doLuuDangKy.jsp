<%-- 
    Document   : doLuuDangKy
    Created on : Nov 17, 2021, 9:07:18 PM
    Author     : admin
--%>


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
    <title>Đăng ký</title>
    <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
    <body>
                <%
             String err = "";
             
            try {
                KhachHangDAO dao = new KhachHangDAO();
               // request.get
                String tenDangNhap =request.getParameter("tendangnhap");
               
                String matKhau =request.getParameter("matkhau");
                
                String nhaplaiMatkhau =request.getParameter("nhaplai_matkhau");
                
              
                if(!matKhau.equals(nhaplaiMatkhau)){
                   // response.setHeader("Location", "./gdDangKy.jsp");
                    err = "không trùng";
                 
                }
               LocalDate ngaySinh = LocalDate.parse(request.getParameter("ngaysinh"));
                
               String email =request.getParameter("email");
                
               String soCCCD =request.getParameter("CCCD");
              
               String sdt =request.getParameter("sdt");
               String ho =request.getParameter("ho");
               String ten =request.getParameter("ten");
               String tenDem =request.getParameter("tendem");
               HoTen hoTen = new HoTen(ho, tenDem, ten);
                String soNha =request.getParameter("sonha");
                 String cumDanCu =request.getParameter("cumdancu");
                  String xaPhuong =request.getParameter("xaphuong");
                   String quanHuyen =request.getParameter("quanhuyen");
                 String tinhThanh =request.getParameter("tinhthanh");
                 DiaChi diaChi = new DiaChi(soNha, cumDanCu, xaPhuong, quanHuyen, tinhThanh);
                 KhachHang kh = new KhachHang(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, hoTen, diaChi);
                //response.sendRedirect("./gdDangKy.jsp");
               
                if(err.isEmpty()){
                       if( !dao.insert(kh))err = "fail";
                       else err = "ok";
                }
                
            }catch(Exception e){
                err += e.getMessage();
                //response.sendRedirect("./gdDangKy.jsp"); 
            }

        %>
         <h1><%= err %> </h1>
    </body>
</html>
