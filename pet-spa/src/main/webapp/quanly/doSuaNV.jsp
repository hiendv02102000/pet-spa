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
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            String err = "";

            String tenDangNhap = request.getParameter("nv_tendangnhap");
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
            String loaiTaiKhoan = "NV";
            int nvid = Integer.parseInt(request.getParameter("nv_id"));

            if (err.isEmpty()) {
                LocalDate ngaySinh = LocalDate.parse(ngaysinh);
                DiaChi diaChi = new DiaChi(soNha, cumDanCu, xaPhuong, quanHuyen, tinhThanh);
                NhanVien nv = new NhanVien(tenDangNhap, null, ngaySinh, email, sdt, soCCCD, loaiTaiKhoan, hoTen, diaChi);
                NhanVienDAO dao = new NhanVienDAO();
                if (!dao.update(nv)) {

                    response.sendRedirect("./gdTuyChinhThongTinNV.jsp?nv_id=" + nvid);
                } else {

                    response.sendRedirect("./gdQuanLyNV.jsp");
                }
            } else {
                request.getRequestDispatcher("./gdTuyChinhThongTinNV.jsp?nv_id=" + nvid).forward(request, response);
            }

        %>

    </body>
</html>
