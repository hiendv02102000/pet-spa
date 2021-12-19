<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê chi tiết hóa đơn</title>
    <link rel="stylesheet" href="./style/main.css">
    <link href="../style/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <style>body {
    background: rgb(238, 191, 199)
    }</style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
    <div id="main">
        <div id="header">
            <div class="logo">
                <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"></a>
            </div>
            <!-- begin nav -->
            <ul id="nav">         
            </ul> 
        </div>

        <div class="container mt-5">
    <div class="d-flex justify-content-center row" style="margin-top: 150px;">
        <div class="col-md-8">
            <div class="p-3 bg-white rounded">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="text-uppercase">Thanh toán</h1>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Mã hóa đơn:</span><span class="ml-1">HD1234</span></div>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Mã Nhân Viên:</span><span class="ml-1">NV124</span></div>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Khách hàng:</span><span class="ml-1">Đỗ Văn A</span></div>
                        <div class="billed"><span class="font-weight-bold text-uppercase">Thời gian:</span><span class="ml-1">19:12 ngày 21/9/2021</span></div>
                    </div>
                    <div class="col-md-6 text-right mt-3">
                        <h4 class="text-danger mb-0">LoDu Petspa</h4>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Dịch vụ</th>
                                    <th>Số lượng</th>
                                    <th>Giá dịch vụ</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Cắt tỉa</td>
                                    <td>2</td>
                                    <td>100.000đ</td>
                                    <td>200.000đ</td>
                                </tr>
                                <tr>
                                    <td>mát xa</td>
                                    <td>1</td>
                                    <td>300.000đ</td>
                                    <td>300.000đ</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        </div>
    </div>
</div>
                                <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
                                <script type='text/javascript' src=''></script>
                                <script type='text/javascript' src=''></script>
                                <script type='text/Javascript'></script>
        
</body>
</html>

