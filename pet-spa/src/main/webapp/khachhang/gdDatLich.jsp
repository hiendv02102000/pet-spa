<%-- 
    Document   : gdDatLich
    Created on : Oct 9, 2021, 7:40:02 PM
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt lịch</title>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="../style/datlichhoadon.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/lichhen.js"></script>
    </head>
    <%
        KhachHang kh = (KhachHang) session.getAttribute("khachhang");
        if (kh == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
        }
        DichVuDAO dvdao = new DichVuDAO();
        DichVu[] listDV = dvdao.getAll();
        List<LichHenDichVu> listLHDV;
        listLHDV = (List<LichHenDichVu>) session.getAttribute("list_lhdv");
        if (request.getParameter("tenDV") != null) {
            listDV = dvdao.getByCondition(request.getParameter("tenDV"));
        }
        if (listLHDV == null) {
            listLHDV = new ArrayList<LichHenDichVu>();
        }

        session.setAttribute("list_lhdv", listLHDV);
        session.setAttribute("list_dv", listDV);
    %>
    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <main>
            <div class="container1">
                <form method="get" action="./doLuuLichHen.jsp">
                    <div class = "item1">
                        <h1 style=" margin-left: 80px;">Chọn ngày giờ</h1>
                        <div class="input-box">
                            <i ></i>
                            <input type="date" name="ngay_hen">
                        </div>
                        <div class="input-box">
                            <i ></i>
                            <input type="time" name="thoi_gian_hen">
                        </div>
                        <div class="btn-box">
                            <button type="submit">
                                Đặt lịch
                            </button>
                        </div>
                    </div> 
                </form>
                <table class="table" style="margin-left: 20px; margin-top: 80px;">
                    <tr>
                        <th class="table__heading">STT</th>
                        <th class="table__heading">Tên dịch vụ</th>
                        <th class="table__heading">Số lượng</th>
                        <th class="table__heading">Giá</th>
                        <th class="table__heading">Tùy chọn</th>
                    </tr>
                    <%
                        int x = 0;
                        for (LichHenDichVu lhdv : listLHDV) {
                            x++;
                    %>
                    <tr class="table__row" id =<%="lhdv" + lhdv.getDichVu().getId()%> >
                        <td class="table__content" ><%=x%></td>
                        <td class="table__content" > <%= lhdv.getDichVu().getTen()%> </td>
                        <td class="table__content" >
                            <input style="width: 75px"  type="number" id=<%="sl" + lhdv.getDichVu().getId()%>     min='1'  max="1000000000" onchange=<%="themDV(" + lhdv.getDichVu().getId() + ",'them')"%> value= <%=lhdv.getSoLuong() + ""%>   />
                        </td>
                        <td class="table__content" > <%= lhdv.getDichVu().getGiaCa()%>đ</td>

                        <td class="table__content" ><div class="btn-box" style="text-align: center;">
                                <button type="submit" style="background-color: red; margin-left: 15px;" onclick=<%="themDV(" + lhdv.getDichVu().getId() + ",'xoa')"%>>
                                    Hủy
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>  

                </table>
                <div style="text-align: right; margin-right: 170px; margin-top: 10px; font-weight: bold;">
                    Giá dự kiến = 
                </div>

            </div>

            <div class="container2">
                <div class="item2">
                    <h1 style="text-align: center;">Tìm kiếm dịch vụ</h1>
                    <form action = "./gdDatLich.jsp">
                        <div class="input-box" style=" text-align: center;margin-top:70px;">
                            <i ></i>
                            <input type="text" name = "tenDV" placeholder="Tên dịch vụ" style="height: 55px; width: 70%;" value=<%=(request.getParameter("tendangnhap") != null) ? request.getParameter("tenDV") : ""%>>
                        </div>
                        <div class="btn-box" style="margin-right: 142px;">
                            <button type="submit">
                                Tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
                <table class="table" style="margin-left: 20px; margin-top: 105px;">
                    <tr>
                        <th class="table__heading">Mã DV</th>
                        <th class="table__heading">Tên dịch vụ</th>
                        <th class="table__heading">Giá</th>
                        <th class="table__heading">Tùy chọn</th>
                    </tr>


                    <%
                        for (int i = 0; i < listDV.length; i++) {
                            String display = "";
                            for (LichHenDichVu lhdv : listLHDV) {
                                if (lhdv.getDichVu().getId() == listDV[i].getId()) {
                                    display = "display:none;";
                                    break;
                                }
                            }
                    %>
                    <tr class="table__row" style="text-align: center;<%=display%>" id = <%="dv" + listDV[i].getId()%> >
                        <td class="table__content" ><%=listDV[i].getId()%></td>
                        <td class="table__content" ><%=listDV[i].getTen()%></td>
                        <td class="table__content" ><%=listDV[i].getGiaCa() + "đ"%></td>
                        <td class="table__content" ><div class="btn-box" style="text-align: center;">
                                <button  style="background-color: rgb(5, 199, 5);margin-left: 15px;" onclick=<%="themDV(" + listDV[i].getId() + ",'themmoi')"%>>
                                    Thêm
                                </button>
                            </div></td>
                    </tr>
                    <%
                        }
                    %>  

                </table>
            </div>
        </main>
    </body>
</html>
