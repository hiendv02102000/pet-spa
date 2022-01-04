<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">

        <!-- Title Page-->

        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký</title>
        <link href="../style/register.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String err = "";
        if (request.getParameter("err") != null) {
            err = "Thêm thất bại có thẻ đã trùng tên đăng nhập";
        }
        if (request.getParameter("check") != null) {

            String tenDangNhap = request.getParameter("tendangnhap");
            if (tenDangNhap != null && tenDangNhap.isEmpty()) {
                err = "Tên đăng nhập không để trống";

            }
            String matKhau = request.getParameter("matkhau");
            if (matKhau != null && matKhau.isEmpty()) {
                err = "Mật khẩu không để trống";

            }
            String nhaplaiMatkhau = request.getParameter("nhaplai_matkhau");

            if (nhaplaiMatkhau == null || !matKhau.equals(nhaplaiMatkhau)) {
                err = "Nhập lại mật khẩu không khớp";

            }
            String ngaysinh = request.getParameter("ngaysinh");
            //  ngaySinh=null;
            if (ngaysinh != null && ngaysinh.isEmpty()) {
                err = "Ngày sinh không để trống";

            }

            String email = request.getParameter("email");
            if (email != null && email.isEmpty()) {
                err = "Tên đăng nhập không để trống";

            }
            String soCCCD = request.getParameter("CCCD");

            String sdt = request.getParameter("sdt");
            String ho = request.getParameter("ho");
            String ten = request.getParameter("ten");
            String tenDem = request.getParameter("tendem");
            HoTen hoTen = new HoTen(ho, tenDem, ten);
            String soNha = request.getParameter("sonha");
            String cumDanCu = request.getParameter("cumdancu");
            String xaPhuong = request.getParameter("xaphuong");
            String quanHuyen = request.getParameter("quanhuyen");
            String tinhThanh = request.getParameter("tinhthanh");

            if (err.isEmpty()) {
                LocalDate ngaySinh = LocalDate.parse(ngaysinh);
                DiaChi diaChi = new DiaChi(soNha, cumDanCu, xaPhuong, quanHuyen, tinhThanh);
                KhachHang kh = new KhachHang(tenDangNhap, matKhau, ngaySinh, email, sdt, soCCCD, hoTen, diaChi);
                session.setAttribute("khachhang", kh);
                response.sendRedirect("./doLuuDangKy.jsp");
            }
        }
    %>

    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">

                        <a href="../"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
                </div>
        </header>
        <main>
            <div class="page-wrapper bg-gra-03 p-t-45 p-b-50" >
                <div class="wrapper wrapper--w790">
                    <div class="card card-5">
                        <div class="card-heading" style = "margin-top: 35px">
                            <h2 class="title">Đăng ký</h2>
                            <p class="title" style="font-size: 14px;color: red"><%=err%></p>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="./gdDangKy.jsp?check=true" >
                                <div class="form-row">
                                    <div class="name">Tên đăng nhập</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "tendangnhap" name="tendangnhap" value=<%=(request.getParameter("tendangnhap") != null) ? request.getParameter("tendangnhap") : ""%>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Mật khẩu</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="password" id = "matkhau" name="matkhau" value=<%=(request.getParameter("matkhau") != null) ? request.getParameter("matkhau") : ""%>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Nhập lại mật khẩu</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="password" id = "nhaplai_matkhau" name="nhaplai_matkhau">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row m-b-55">
                                    <div class="name">Họ và tên</div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "ho" name="ho" value=<%=(request.getParameter("ho") != null) ? request.getParameter("ho") : ""%>>
                                                    <label class="label--desc">Họ</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "tendem" name="tendem" value=<%=(request.getParameter("tendem") != null) ? request.getParameter("tendem") : ""%>>
                                                    <label class="label--desc">Tên đệm</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "ten" name="ten" value=<%=(request.getParameter("ten") != null) ? request.getParameter("ten") : ""%>>
                                                    <label class="label--desc">Tên</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Ngày sinh</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="date" id = "ngaysinh" name="ngaysinh" value=<%=(request.getParameter("ngaysinh") != null) ? request.getParameter("ngaysinh") : ""%>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row m-b-55">
                                    <div class="name">Địa chỉ</div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "sonha" name="sonha" value=<%=(request.getParameter("sonha") != null) ? request.getParameter("sonha") : ""%>>
                                                    <label class="label--desc">Số nhà</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "cumdancu" name="cumdancu" value=<%=(request.getParameter("cumdancu") != null) ? request.getParameter("cumdancu") : ""%>>
                                                    <label class="label--desc">Cụm dân cư</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "xaphuong" name="xaphuong" value=<%=(request.getParameter("xaphuong") != null) ? request.getParameter("xaohuong") : ""%>>
                                                    <label class="label--desc">Xã phường</label>
                                                </div>
                                            </div>                                 
                                        </div>

                                    </div>
                                </div>
                                <div class="form-row m-b-55">
                                    <div class="name"></div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-2">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "quanhuyen" name="quanhuyen" value=<%=(request.getParameter("quanhuyen") != null) ? request.getParameter("quanhuyen") : ""%>>
                                                    <label class="label--desc">Quận huyện</label>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "tinhthanh" name="tinhthanh" value=<%=(request.getParameter("tinhthanh") != null) ? request.getParameter("tinhthanh") : ""%>>
                                                    <label class="label--desc">Tỉnh thành</label>
                                                </div>
                                            </div>                               
                                        </div>

                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Căn cước công dân</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "CCCD" name="CCCD" value=<%=(request.getParameter("CCCD") != null) ? request.getParameter("CCCD") : ""%>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Email</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "email" name="email" value=<%=(request.getParameter("email") != null) ? request.getParameter("email") : ""%>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Số điện thoại</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "sdt" name="sdt" value=<%=(request.getParameter("sdt") != null) ? request.getParameter("sdt") : ""%>>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <button class="btn btn--radius-2 btn--red" type="submit">Đăng ký</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Jquery JS-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <!-- Vendor JS-->
            <script src="vendor/select2/select2.min.js"></script>
            <script src="vendor/datepicker/moment.min.js"></script>
            <script src="vendor/datepicker/daterangepicker.js"></script>

            <!-- Main JS-->
            <script src="js/global.js"></script>

        </main>
    </body>
</html>
