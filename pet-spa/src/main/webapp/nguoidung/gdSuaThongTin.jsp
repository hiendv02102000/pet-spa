<%-- 
    Document   : gdSuaThongTin
    Created on : Oct 9, 2021, 7:30:58 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <title>Sửa thông tin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <div class="container1">
                <div class="nav1">
                    <div class="logo">
                        <a href="../index.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
        <main>
            <div class="container2" style="margin-top: 100px; margin-bottom: 100px ">
            <div class="login-form">
                <form action="" method="post">
                    <h1>Sửa thông tin</h1>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Username">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="password" placeholder="Mật khẩu">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Số căn cước công dân">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="date" placeholder="Ngày sinh">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Nhập email">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Số điện thoại">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Họ">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Tên đệm">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Tên">
                    </div>
                    <div class="input-box">
                        <i ></i>
                        <input type="text" placeholder="Họ">
                    </div>
                    <div class="btn-box">
                        <button type="submit">
                            Lưu
                        </button>
                        <button type="submit">
                            Hủy
                        </button>
                    </div>
                </form>
            </div>
            </div>
        </main>
    </body>
</html>
