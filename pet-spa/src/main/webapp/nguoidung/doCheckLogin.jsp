


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
        <title>Đăng nhập</title>
        <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <%
            NguoiDungDAO dao = new NguoiDungDAO();
            String tendangnhap = request.getParameter("tendangnhap");

            String matkhau = request.getParameter("matkhau");

            NguoiDung nd = dao.check(tendangnhap, matkhau);

            if (nd == null) {
                request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu");
                request.getRequestDispatcher("./gdDangNhap.jsp").forward(request, response);
            } else {
                session.setAttribute("acc", nd);
                String loaitk = nd.getLoaiTaiKhoan();
                if(loaitk.equals("KH")){
                    KhachHang kh = new KhachHang(nd);
                    session.setAttribute("khachhang", kh);
                    response.sendRedirect("../khachhang/gdKhachHang.jsp");
                }else if(loaitk.equals("QL")){
                    
                    QuanLy ql = new QuanLy(nd);
                    session.setAttribute("quanly", ql);
                    response.sendRedirect("../quanly/gdQuanLy.jsp");
                }else if(loaitk.equals("NV")){
                    NhanVien nv = new NhanVien(nd);
                    session.setAttribute("nhanvien", nv);
                    response.sendRedirect("../nhanvien/gdNhanVien.jsp");
                }
            }
        %>

    </body>
</html>
