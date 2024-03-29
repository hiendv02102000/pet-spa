<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page import="model.QuanLy"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi"
      <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm nhân viên</title>
    <link href="../style/register.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%
    QuanLy ql = (QuanLy) session.getAttribute("quanly");

    if (ql == null) {
        response.sendRedirect("../nguoidung/gdDangNhap.jsp");
        return;
    }
%>
<body >
    <header>
        <div class="container1">
            <div class="nav1">
                <div class="logo">

                    <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
    </header>
    <main>
        <div class="page-wrapper bg-gra-03 p-t-45 p-b-50" >
            <div class="wrapper wrapper--w790">
                <div class="card card-5">
                    <div class="card-heading" style = "margin-top: 35px">
                        <h2 class="title">Thêm nhân viên</h2>
                    </div>
                    <div class="card-body">
                        <form action="doThemNV.jsp" method="POST">
                            <div class="form-row">
                                <div class="name">Tên đăng nhập</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input class="input--style-5" type="text" id = "tendangnhap" name="tendangnhap">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errTenDangNhap}<p>
                                </div>

                            </div>

                            <div class="form-row">
                                <div class="name">Mật khẩu</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input class="input--style-5" type="password" id = "matkhau" name="matkhau">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errMatKhau}<p>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="name">Nhập lại mật khẩu</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input class="input--style-5" type="password" id = "nhaplai_matkhau" name="nhaplai_matkhau">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errNhapLai}<p>
                                </div>
                            </div>
                            <div class="form-row m-b-55">
                                <div class="name">Họ và tên</div>
                                <div class="value">
                                    <div class="row row-space">
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "ho" name="ho">
                                                <label class="label--desc">Họ</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "tendem" name="tendem">
                                                <label class="label--desc">Tên đệm</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "ten" name="ten">
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
                                        <input class="input--style-5" type="date" id = "ngaysinh" name="ngaysinh">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errNgaySinh}<p>
                                </div>
                            </div>
                            <div class="form-row m-b-55">
                                <div class="name">Địa chỉ</div>
                                <div class="value">
                                    <div class="row row-space">
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "sonha" name="sonha">
                                                <label class="label--desc">Số nhà</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "cumdancu" name="cumdancu">
                                                <label class="label--desc">Cụm dân cư</label>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "xaphuong" name="xaphuong">
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
                                                <input class="input--style-5" type="text" id = "quanhuyen" name="quanhuyen">
                                                <label class="label--desc">Quận huyện</label>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="input-group-desc">
                                                <input class="input--style-5" type="text" id = "tinhthanh" name="tinhthanh">
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
                                        <input class="input--style-5" type="text" id = "CCCD" name="CCCD">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="name">Email</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input class="input--style-5" type="text" id = "email" name="email">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errEmail}<p>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="name">Số điện thoại</div>
                                <div class="value">
                                    <div class="input-group">
                                        <input class="input--style-5" type="text" id = "sdt" name="sdt">
                                    </div>
                                    <p style="color: red; margin-top: 20px" class = "text">${errSDT}<p>
                                </div>
                            </div>

                            <div>
                                <button class="btn btn--radius-2 btn--red" type="submit">Xác nhận</button>
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
