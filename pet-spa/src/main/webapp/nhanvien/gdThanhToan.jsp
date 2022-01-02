<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="utils.FormateDateTime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.*"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="./style/main.css">
        <link href="../style/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            body {
                background: rgb(238, 191, 199)
            }
        </style>
    </head>
    <%@page import="model.*"%>
    <%@page import="dao.*"%>
    <%
        NhanVien nv = (NhanVien) session.getAttribute("nhanvien");
        if (nv == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
            return;
        }session.setAttribute("nhanvien", nv);
         DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm 'ngày' dd-MM-yyyy");
        HoaDon hd = null;
        List<HoaDonDichVu> listHDDV;
        listHDDV = (List<HoaDonDichVu>) session.getAttribute("list_hddv");
        if (listHDDV != null && listHDDV.isEmpty() == false) {
            LichHen lh = (LichHen) session.getAttribute("lichhen");
            KhachHang kh = null;
            if (lh != null) {

                kh = lh.getKhachHang();
            }

            BigInteger thanhTien = (BigInteger) session.getAttribute("thanhTien");
            HoaDonDichVu[] list = new HoaDonDichVu[listHDDV.size()];

            hd = new HoaDon(0, thanhTien, LocalDateTime.now(), "", kh, nv, listHDDV.toArray(list));
            session.setAttribute("hoadon", hd);
        }

    %>
    <body oncontextmenu='return false' class='snippet-body'>
        <div id="main">
            <div id="header">
                <div class="logo">
                    <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
                <!-- begin nav -->
                <ul id="nav">
                    <li ><a href="gdTaoHoaDon.jsp">Tạo hóa đơn</a></li>             
                </ul> 
            </div>

            <div class="container mt-5">
                <div class="d-flex justify-content-center row" style="margin-top: 150px;">
                    <div class="col-md-8">
                        <div class="p-3 bg-white rounded">
                            <div class="row">
                                <div class="col-md-6">
                                    <h1 class="text-uppercase">Thanh toán</h1>
                                    <%if (hd != null) {%>
<!--                                    <div class="billed"><span class="font-weight-bold text-uppercase">Mã hóa đơn:</span><span class="ml-1"><%=hd.getListHDDV().length%></span></div>-->
                                    <div class="billed"><span class="font-weight-bold text-uppercase">Mã Nhân Viên:</span><span class="ml-1"><%=nv.getId()%></span></div>
                                    <div class="billed"><span class="font-weight-bold text-uppercase">Khách hàng:</span><span class="ml-1"><%=(hd.getKhachHang() != null) ?  hd.getKhachHang().getHoTen(): ""%></span></div>
                                    <div class="billed"><span class="font-weight-bold text-uppercase">Thời gian:</span><span class="ml-1"><%=hd.getNgayTao().format(myFormatObj)%></span></div>
                                    <%
                                        }
                                    %>   

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
                                            <%if (hd != null) {
                                                    int x = 0;
                                                    for (HoaDonDichVu hddv : listHDDV) {
                                                        x++;
                                                        String tien = FormateDateTime.convertBigNumToCurrency(hddv.getDichVu().getGiaCa());

                                            %>



                                            <tr>
                                                <td><%=hddv.getDichVu().getTen()%></td>
                                                <td><%=hddv.getSoLuong()%></td>
                                                <td><%=FormateDateTime.convertBigNumToCurrency(hddv.getDichVu().getGiaCa())%></td>
                                                <td><%=FormateDateTime.convertBigNumToCurrency(hddv.getDichVu().getGiaCa().multiply(new BigInteger("" + hddv.getSoLuong())))%></td>
                                            </tr>


                                            <%                                                }
                                                float khuyenmai = 0;
                                                if (hd.getKhachHang() != null) {
                                                    khuyenmai = hd.getKhachHang().getLoaiKhachHang().getKhuyenMai();
                                                }
                                                BigInteger thanhTien = new BigInteger(hd.getThanhTien().toString());
                                                thanhTien = thanhTien.multiply(new BigInteger("" + (1000 - (int) (khuyenmai * 10)))).divide(new BigInteger("1000000")).multiply(new BigInteger("1000"));
                                            %>
                                            <tr>
                                                <td></td>
                                                <td>Tổng</td>
                                                <td></td>
                                                <td><%=FormateDateTime.convertBigNumToCurrency(hd.getThanhTien())%>đ</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>Khuyến mãi</td>
                                                <td></td>
                                                <td><%=khuyenmai + "%"%></td>
                                            </tr>
                                            
                                            <tr>
                                                <td></td>
                                                <td>Thành Tiền</td>
                                                <td></td>
                                                <td><%=FormateDateTime.convertBigNumToCurrency(thanhTien) + "đ"%></td>
                                            </tr>
                                            <%  hd.setThanhTien(thanhTien);
                                                } %>   
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%if (hd != null) {%>
                            <<form action="doLuuHoaDon.jsp" method="post">
                                <div class="text-right mb-3">
                                    <button class="btn btn-danger btn-sm mr-5" type="submit">In hóa đơn</button>
                                </div>
                            </form>
                            <%
                                }
                            %>   
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

