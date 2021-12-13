<%-- 
<<<<<<< HEAD:pet-spa/src/main/webapp/quanly/gdThemNV.jsp
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
=======
    Document   : doSuaND
    Created on : Nov 17, 2021, 8:51:37 PM
>>>>>>> 59193a021af4fb8609813029d6b95979406f5524:pet-spa/src/main/webapp/nguoidung/doSuaND.jsp
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
    <title>Thêm nhân viên</title>
    <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">
                        
                        <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
        <main>
            <div class="container2">
            <div class="login-form">
                <form action="" method="post">
                    <h1>Thêm nhân viên</h1>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập username">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập mật khẩu">
                    </div><!-- comment -->
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập họ và tên">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="date" placeholder="Nhập ngày sinh">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập email">
                    </div><!-- comment -->
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập địa chỉ">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập căn cước công da">
                    </div>
                    <div class="btn-box">
                        <button type="submit">
                            Thêm nhân viên
                        </button>
                    </div>
                </form>
            </div>
            </div>
        </main>
    </body>
</html>