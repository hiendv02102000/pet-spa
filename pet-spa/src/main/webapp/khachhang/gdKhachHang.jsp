<%@page import="dao.KhachHangDAO"%>
<%@page import="model.KhachHang"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./style/main.css">
    <link href="../style/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%
     KhachHang kh = (KhachHang)session.getAttribute("khachhang");
     if(kh.getId()==0){
     KhachHangDAO dao = new KhachHangDAO();
    }
%>
<body>
    <div id="main">
        <div id="header">
            <div class="logo">
                <a href="#content"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
            </div>
            <!-- begin nav -->
            <ul id="nav">
                <li><a href="#content">Trang chủ </a></li>
                <li><a href="#dv">Dịch vụ</a></li>             
                <li><a href="#contact">Liên hệ</a></li>
                <li><a href="gdXemLichHen.jsp">Xem lịch hẹn</a></li>
                <li><a href="../nguoidung/gdSuaThongTin.jsp">Sửa thông tin</a></li>
                <li ><a href="#">Đăng xuất</a></li>
                

            </ul> 
           
           
        </div>
        
        <div class="calender">
            <a href="gdDatLich.jsp"><img src="../assets/img/pngwing.com.png" alt="calender"  class="place-img"></a>
        </div>
        <div id="content">
            <!-- About section -->
            <div class="content-section1">
                    <div class="img"></div> 
                    <div class="centered">
                        <h1>LODU Pet Spa</h1>   
                        <p>Shop chăm sóc động vật, thú cưng</p>
                    </div>              
    
            </div>

            <div id="gt" class="info">
                
                <div class="intro">
                    <div class="head2"><h2>Giới thiệu</h2></div>
                    <div class="if"><p>LODU Pet Spa được xây dựng dựa trên tiêu chí là cổng thông tin khổng lồ và hoàn toàn miễn phí về các vấn đề xung quanh động vật , đặc biệt là thú cưng, cụ thể như các bệnh về chó mèo, các thực phẩm dinh dưỡng dành cho thú cưng, cách chăm sóc và điều trị bệnh cho chó mèo...</p></div>
                   <br> <div class="if"><p>Tất cả những thông tin tại LODU được sưu tầm và tham khảo từ nhiều nguồn khác nhau có chọn lọc, bên cạnh đó còn là trải nghiệm thực tế của chúng tôi trong quá trình nuôi thú cưng để đem đến cho độc giả những thông tin chính xác và hữu ích nhất.</p></div>
                </div>

                <div class="shiba"></div>

            </div>


            <!-- Tour section -->
            <div class="tour-section" id="dv">
                <div class="content-section">
                    <div class="place-list">
                        <h2 style="font-size: 45px;" class="section-heading text-white">Dịch vụ</h2> 
                        <p style="font-size: 25px;" class="section-sub-heading text-white">Chúng tôi sẽ tạo ra trải nghiệm tốt nhất với thú cưng của bạn</p>
                    </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class = "kind">

                    <div class="place-item">
                        <img src="./assets/img/pet1.jpg" alt="New York" class="place-img">
                        <div class="place-body">
                            <h3 class="place-heading">Cắt tỉa lông</h3>
                            <p class="place-time">100,000 đ</p>
                            <p class="place-desc">Thú cưng của bạn sẽ có một bộ lông sành điệu</p>
                            <a href="quanly/gdChiTietDichVu.jsp" class="place-buy-btn">Xem thêm</a>
                        </div>
                    </div>
                    <div class="place-item">
                        <img src="./assets/img/pet2.jpg" alt="Paris" class="place-img">
                        <div class="place-body">
                            <h3 class="place-heading">Tắm</h3>
                            <p class="place-time">200,000 đ</p>
                            <p class="place-desc">Thú cưng của bạn sẽ trở lên thơm tho</p>
                            <a href="#" class="place-buy-btn">Xem thêm</a>

                        </div>
                    </div>
                    <div class="place-item">
                        <img src="./assets/img/pet3.jpg" alt="San Francisco" class="place-img">
                        <div class="place-body">
                            <h3 class="place-heading">Mát xa</h3>
                            <p class="place-time">300,000 đ</p>
                            <p class="place-desc">Thú cưng của bạn sẽ được thư giãn</p>
                            <a href="#" class="place-buy-btn">Xem thêm</a>

                        </div>
                    </div>

                </div>
                
            </div>
            <!-- Contact section -->
            <div class="content-section2" id="contact">
                <h2 class="section-heading">LODU Pet Spa</h2> 
                <div class = "section__icon1">
                    <i class="fab fa-instagram" aria-hidden="true"></i>       
                </div>
                <div class = "section__icon2">
                    <i class="fab fa-facebook" aria-hidden="true"></i>
                </div>
                <div class = "section__icon3">
                    <i class="fab fa-twitter" aria-hidden="true"></i>
                </div>

            </div>
        </div>
        <div id="footer">

        </div>
    </div>
</body>
</html>
<<<<<<< HEAD

=======
>>>>>>> 570ff5e1ceeb6f2c9b60ce649062a5519718e819
