<%-- 
    Document   : gdDatLich
    Created on : Oct 9, 2021, 7:40:02 PM
    Author     : admin
--%>

<%@page import="utils.FormateDateTime"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.*"%>
<%@page import="utils.*"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo hóa đơn</title>
        <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="../style/datlichhoadon.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/hoadon.js"></script>
    </head>
    <%@page import="model.*"%>
    <%@page import="dao.*"%>
    <%
        NhanVien nv = (NhanVien) session.getAttribute("nhanvien");
        if (nv == null) {
            response.sendRedirect("../nguoidung/gdDangNhap.jsp");
            return;
        }
        String err = "";
        DichVuDAO dvdao = new DichVuDAO();
        DichVu[] listDV = dvdao.getAll();
        List<HoaDonDichVu> listHDDV;
        listHDDV = (List<HoaDonDichVu>) session.getAttribute("list_hddv");
        if (listHDDV == null) {
            listHDDV = new ArrayList<HoaDonDichVu>();
        }
        // List<HoaDonDichVu> tmpHDDV = new ArrayList<HoaDonDichVu>(listHDDV);
        if (request.getParameter("tenDV") != null) {
            listDV = dvdao.getByCondition(request.getParameter("tenDV"));

        }
        if (request.getParameter("ma_hen") != null && request.getParameter("ma_hen").isEmpty() == false) {
            LichHenDAO lhDAO = new LichHenDAO();
            int idlh = Integer.parseInt(request.getParameter("ma_hen"));
            LichHen lh = lhDAO.getByIDWithPreLoadKhachHang(idlh);
            if (lh == null) {
                err = "Không có lịch hẹn ";
            } else {
                err = "Khách hàng: " + lh.getKhachHang().getHoTen();
                LichHen oldLH = (LichHen) session.getAttribute("lichhen");
                if (oldLH != null && oldLH.getId() != idlh) {
                    LichHenDichVuDAO lhdv_dao = new LichHenDichVuDAO();
                    lh.setListLHDV(lhdv_dao.getByLichHenID(idlh));
                    //err = ""+lh.getListLHDV().;
                    for (LichHenDichVu lhdv : lh.getListLHDV()) {
                        boolean isNew = true;
                        for (HoaDonDichVu hddv : listHDDV) {
                            if (lhdv.getDichVu().getId() == hddv.getDichVu().getId()) {
                                hddv.setSoLuong(lhdv.getSoLuong());
                                isNew = false;
                                break;
                            }
                        }
                        if (isNew) {
                            listHDDV.add(new HoaDonDichVu(0, lhdv.getDichVu(), lhdv.getSoLuong()));
                        }
                    }
                }
            }
            session.setAttribute("lichhen", lh);
        } else {
            session.setAttribute("lichhen", null);
        }

        BigInteger tong = new BigInteger("0");

        session.setAttribute("list_hddv", listHDDV);
        session.setAttribute("list_dv", listDV);
    %>

    <body>
        <header>
            <div class="nav1">
                <div class="logo">
                    <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                </div>
            </div>
        </header>
        <main>
            <div class="container1">
                <div class="item2">
                    <h1 style="text-align: center;">Tìm kiếm lịch hẹn</h1>
                    <form action = "./gdTaoHoaDon.jsp">
                        <div class="input-box" style=" text-align: center;margin-top:70px;">
                            <i ></i>
                            <input type="number" name="ma_hen" placeholder="Mã lịch hẹn" style="height: 55px; width: 70%;" value=<%=(request.getParameter("ma_hen") != null) ? request.getParameter("ma_hen") : ""%> >
                        </div>
                        <div class="btn-box" style="margin-right: 142px;">
                            <button type="submit">
                                Tìm kiếm lịch hẹn
                            </button>
                        </div>
                    </form>
                    <h3 style="text-align: center;color: red"><%=err%></h3>
                </div>
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
                        for (HoaDonDichVu hddv : listHDDV) {
                            x++;
                            String tien = FormateDateTime.convertBigNumToCurrency(hddv.getDichVu().getGiaCa());
                            tong = tong.add(hddv.getGiaDV().multiply(new BigInteger("" + hddv.getSoLuong())));
                    %>
                    <tr class="table__row" id =<%="lhdv" + hddv.getDichVu().getId()%> >
                        <td class="table__content" ><%=x%></td>
                        <td class="table__content" > <%= hddv.getDichVu().getTen()%> </td>
                        <td class="table__content" >
                            <input style="width: 75px"  type="number" id=<%="sl" + hddv.getDichVu().getId()%>     min='1'  max="1000000000" onchange=<%="themDV(" + hddv.getDichVu().getId() + ",'them')"%> value= <%=hddv.getSoLuong() + ""%>   />
                        </td>
                        <td class="table__content" > <%=tien%>đ</td>

                        <td class="table__content" ><div class="btn-box" style="text-align: center;">
                                <button type="submit" style="background-color: red; margin-left: 15px;" onclick=<%="themDV(" + hddv.getDichVu().getId() + ",'xoa')"%>>
                                    Hủy
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                        String tongTien = FormateDateTime.convertBigNumToCurrency(tong);
                    %>  

                </table>
                <div style="text-align: right; margin-right: 170px; margin-top: 10px; font-weight: bold;">
                    <%=" Thành tiền = " + tongTien + "đ"%>
                </div>
                <<form action="gdThanhToan.jsp">
                    <div class="btn-box" style="margin-right: 100px; margin-top: 50px;">
                        <button  type="submit" style="background-color: rgb(5, 199, 5);">
                            Tạo hóa đơn
                        </button>
                    </div></form>
            </div>

            <div class="container2">
                <div class="item2">
                    <h1 style="text-align: center;">Tìm kiếm Dịch vụ</h1>
                    <form action = "./gdTaoHoaDon.jsp">
                        <div class="input-box" style=" text-align: center;margin-top:70px;">
                            <i ></i>
                            <input type="text" name = "tenDV" placeholder="Tên dịch vụ" style="height: 55px; width: 70%;" value=<%=(request.getParameter("tenDV") != null) ? request.getParameter("tenDV") : ""%>>
                        </div>
                        <div class="btn-box" style="margin-right: 142px;">
                            <button type="submit">
                                Tìm Dịch Vụ
                            </button>
                        </div>
                    </form>
                    <%
                        if (!err.isEmpty()) {
                    %>
                    <br>

                    <%}%>
                </div>
                <table class="table" style="margin-left: 20px; margin-top: 80px;">
                    <tr>
                        <th class="table__heading">STT</th>
                        <th class="table__heading">Tên dịch vụ</th>
                        <th class="table__heading">Giá</th>
                        <th class="table__heading">Tùy chọn</th>
                    </tr>
                    <%
                        for (int i = 0;
                                i < listDV.length;
                                i++) {
                            String display = "";
                            for (HoaDonDichVu lhdv : listHDDV) {
                                if (lhdv.getDichVu().getId() == listDV[i].getId()) {
                                    display = "display:none;";
                                    break;
                                }
                            }
                    %>
                    <tr class="table__row" style="text-align: center;<%=display%>" id = <%="dv" + listDV[i].getId()%> >
                        <td class="table__content" ><%=listDV[i].getId()%></td>
                        <td class="table__content" ><%=listDV[i].getTen()%></td>
                        <td class="table__content" ><%=FormateDateTime.convertBigNumToCurrency(listDV[i].getGiaCa()) + "đ"%></td>
                        <td class="table__content" ><div class="btn-box" style="text-align: center;">
                                <button  style="background-color: rgb(5, 199, 5);margin-left: 15px;" onclick=<%="themDV(" + listDV[i].getId() + ",'themmoi')"%>>
                                    Thêm
                                </button>
                            </div></td>
                    </tr>
                    <%
                        }
                    %>  
                    <%
                        session.setAttribute("thanhTien", tong);
                    %>
                </table>
            </div>
        </main>
    </body>
</html>
