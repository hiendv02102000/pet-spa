<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.*"%>
<%@page import="dao.DichVuDAO"%>

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
        <title>Thêm Dịch Vụ</title>
        <link href="../style/register.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <%
        // request.get
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        DichVu dv1 = new DichVu();
        String du="toi khong biet";
        if (request.getParameter("dv_id") != null) {
            String tk = request.getParameter("dv_id");
            int id = Integer.parseInt(tk);
            DichVuDAO dao = new DichVuDAO();
            dv1 = dao.getByID(id);
            
        }

        String err = "";
        if (request.getParameter("err") != null) {
            err = "Thất bại";
        }
        if (request.getParameter("check") != null) {
            String tenDV = request.getParameter("tenDV");
                   if(tenDV!=null&&tenDV.isEmpty()){
                            err = "Tên dịch vụ không để trống";
                           
                    }
            String giaCa = request.getParameter("giaCa");
                    if(giaCa!=null&&giaCa.isEmpty()){
                            err = "Giá cả không để trống";
                            
                    }
            String moTa = request.getParameter("moTa");
            //  ngaySinh=null;
    //                if(ngaysinh!=null&&ngaysinh.isEmpty()){
    //                        err = "Ngày sinh không để trống";
    //                        
    //                }

            String gioiHan = request.getParameter("gioiHan");
                    if(gioiHan !=null&&gioiHan.isEmpty()){
                            err = "Giới hạn không để trống";
                            
                    }

            if (err.isEmpty()) {
                int gh = Integer.parseInt(gioiHan);
                int gc = Integer.parseInt(giaCa);
                DichVu dv = new DichVu(dv1.getId(), tenDV, BigInteger.valueOf(gc), gh, moTa, null, null);
                session.setAttribute("dichvu", dv);
                response.sendRedirect("./doSuaDichVu.jsp");
                return;
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
                            <h2 class="title">Sửa dịch vụ</h2>
                            <p class="title" style="font-size: 14px;color: red"><%=err%></p>
                        </div>
                        <div class="card-body">
                            <form method="POST" action=<%="./gdTuyChinhDichVu.jsp?check=true&dv_id="+dv1.getId()%> >
                                
                                <div class="form-row">
                                    <div class="name">Tên dịch vụ</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "tenDV" name="tenDV" value=<%="'"+dv1.getTen()+"'" %>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="name">Giá cả</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "giaCa" name="giaCa" value=<%=dv1.getGiaCa()%>>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="name">Mô tả</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "moTa" name="moTa" value=<%="'"+dv1.getMoTa()+"'"%>>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-row">
                                    <div class="name">Giới hạn</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input class="input--style-5" type="text" id = "gioiHan" name="gioiHan" value=<%=dv1.getGioiHan()%>>
                                        </div>
                                    </div>
                                </div>


                                <div>

                                    <button class="btn btn--radius-2 btn--green" type="submit">Sửa</button>
                                    <button class="btn btn--radius-2 btn--red" type="button"><a style="text-decoration:none;" href="<%="gdQLDichVu.jsp?delete=" + dv1.getId()%>">
                                            <span style="color: #fff; " >Xóa</span></a></button>

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
