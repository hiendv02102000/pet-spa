<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link href="../style/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <%
            session.setAttribute("acc", null);

            session.setAttribute("khachhang", null);

            session.setAttribute("quanly", null);

            session.setAttribute("nhanvien", null);
        
    %>
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
            <div class="container2">
                <div class="login-form">
                    <form action="doCheckLogin.jsp" method="post">
                        <h1>Đăng nhập vào website</h1>
                        <p style="color: red; margin-bottom: 20px" class = "text">${mess}<p>
                        <div class="input-box">
                            <i ></i>
                            <input name ="tendangnhap" type="text" placeholder="Nhập tên đăng nhập">
                        </div>
                        <div class="input-box">
                            <i ></i>
                            <input name ="matkhau" type="password" placeholder="Nhập mật khẩu">
                        </div>
                        <div class="btn-box">
                            <button type="submit">
                                Đăng nhập
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>
