<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page import="sun.security.util.Length"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="model.*, dao.*"  %>  
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm nhân viên</title>
        <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <%
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            String err = "";

            String ngaysinh = request.getParameter("ngaysinh");
            //  ngaySinh=null;
            if (ngaysinh != null && ngaysinh.isEmpty()) {
                request.setAttribute("errNgaySinh", "Ngày sinh không để trống");
                err = "Ngày sinh không để trống";
            }

            String email = request.getParameter("email");
            if (email != null && email.isEmpty()) {
                request.setAttribute("errEmail", "Email không được để trống");
                err = "Email không được để trống";

            }
            String sdt = request.getParameter("sdt");
            if (sdt.isEmpty() || sdt.length() != 10) {
                request.setAttribute("errSDT", "Số điện thoại để trống hoặc không đủ 10 chữ số");
                err = "Số điện thoại để trống hoặc không đủ 10 chữ số";
            }
            String soCCCD = request.getParameter("CCCD");

            String ho = request.getParameter("ho");
            String ten = request.getParameter("ten");
            String tenDem = request.getParameter("tendem");
            HoTen hoTen = new HoTen(ho, tenDem, ten);
            String soNha = request.getParameter("sonha");
            String cumDanCu = request.getParameter("cumdancu");
            String xaPhuong = request.getParameter("xaphuong");
            String quanHuyen = request.getParameter("quanhuyen");
            String tinhThanh = request.getParameter("tinhthanh");
            NguoiDungDAO dao = new NguoiDungDAO();
            NguoiDung nd1 = (NguoiDung) session.getAttribute("acc");
            String loaiTaiKhoan = nd1.getLoaiTaiKhoan();
            int idsua = nd1.getId();

            if (err.isEmpty()) {
                LocalDate ngaySinh = LocalDate.parse(ngaysinh);
                DiaChi diaChi = new DiaChi(soNha, cumDanCu, xaPhuong, quanHuyen, tinhThanh);
                //NguoiDung nd = new NguoiDung(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, loaiTaiKhoan, hoTen, diaChi);
                nd1.setNgaySinh(ngaySinh);
                nd1.setEmail(email);
                nd1.setSdt(sdt);
                nd1.setSoCCCD(soCCCD);
                nd1.setLoaiTaiKhoan(loaiTaiKhoan);
                nd1.setHoTen(hoTen);
                nd1.setDiaChi(diaChi);
                if (!dao.update(nd1)) {

                } else {
                    session.setAttribute("acc", nd1);

                    response.sendRedirect("./gdNguoiDung.jsp?redirect=true");

                }
            } else {
                request.getRequestDispatcher("./gdSuaThongTin.jsp").forward(request, response);
            }

        %>
    </body>
</html>