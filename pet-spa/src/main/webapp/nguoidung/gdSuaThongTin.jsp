<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>
<%@page import="java.time.LocalDate"%>
<%@ page import="model.*, dao.*"  %>  
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
    <title>Sửa thông tin</title>
    <link href="../style/register.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
    <% 
        NguoiDungDAO dao= new NguoiDungDAO();
        NguoiDung nd = (NguoiDung)session.getAttribute("acc");
  
    %>

    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">
                        
                        <img src="../assets/img/logo.png" alt="logo" class="place-img"> 
                    </div>
            </div>
        </header>
        <main>
            <div class="page-wrapper bg-gra-03 p-t-45 p-b-50" >
                <div class="wrapper wrapper--w790">
                    <div class="card card-5">
                        <div class="card-heading" style = "margin-top: 35px">
                            <h2 class="title">Sửa thông tin</h2>
                        </div>
                        <div class="card-body">
                            <form action="doSuaND.jsp" method="POST">
                                <div class="form-row m-b-55">
                                    <div class="name">Họ và tên</div>
                                    <div class="value">
                                        <div class="row row-space">
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "ho" name="ho" value=<%=nd.getHoTen().getHo()%>>
                                                    <label class="label--desc">Họ</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "tendem" name="tendem" value=<%=nd.getHoTen().getTenDem()%>>
                                                    <label class="label--desc">Tên đệm</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "ten" name="ten" value=<%=nd.getHoTen().getTen()%>>
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
                                            <input class="input--style-5" type="date" id = "ngaysinh" name="ngaysinh" value=<%=nd.getNgaySinh() %>>
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
                                                    <input class="input--style-5" type="text" id = "sonha" name="sonha" value=<%=nd.getDiaChi().getSoNha()%>>
                                                    <label class="label--desc">Số nhà</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "cumdancu" name="cumdancu" value=<%=nd.getDiaChi().getCumDanCu()%>>
                                                    <label class="label--desc">Cụm dân cư</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "xaphuong" name="xaphuong" value=<%=nd.getDiaChi().getXaPhuong()%>>
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
                                                    <input class="input--style-5" type="text" id = "quanhuyen" name="quanhuyen" value=<%=nd.getDiaChi().getQuanHuyen()%>>
                                                    <label class="label--desc">Quận huyện</label>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="input-group-desc">
                                                    <input class="input--style-5" type="text" id = "tinhthanh" name="tinhthanh" value=<%=nd.getDiaChi().getTinhThanh()%>>
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
                                            <input class="input--style-5" type="text" id = "CCCD" name="CCCD" value=<%=nd.getSoCCCD() %>> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Email</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "email" name="email" value=<%=nd.getEmail()%>>
                                        </div>
                                        <p style="color: red; margin-top: 20px" class = "text">${errEmail}<p>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Số điện thoại</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "sdt" name="sdt" value=<%=nd.getSdt()%>>
                                        </div>
                                        <p style="color: red; margin-top: 20px" class = "text">${errSDT}<p>
                                    </div>
                                </div>

                                <div>
                                    <button class="btn btn--radius-2 btn--red" type="submit" style = "background-color: rgb(51, 236, 51); margin-right: 10px">Xác nhận</button>
                                    <button class="btn btn--radius-2 btn--red" type="submit">Hủy</button>
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
