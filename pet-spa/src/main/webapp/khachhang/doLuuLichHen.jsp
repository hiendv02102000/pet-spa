<%-- 
    Document   : doChonDichVu.jsp
    Created on : Dec 31, 2021, 2:48:27 PM
    Author     : dovan
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="com.mysql.cj.result.LocalDateTimeValueFactory"%>
<%@page import="java.time.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        LichHenDAO lhdao = new LichHenDAO();

        LocalDateTime thoiGianHen = LocalDateTime.of(LocalDate.parse(request.getParameter("ngay_hen")),
                LocalTime.parse(request.getParameter("thoi_gian_hen")));

        List<LichHenDichVu> listLHDV;
        listLHDV = (List<LichHenDichVu>) session.getAttribute("list_lhdv");
        if(listLHDV.isEmpty()){
            throw new Exception("looxi");
        }
        KhachHang khachHang = (KhachHang) session.getAttribute("khachhang");
       
        BigInteger giaDuKien = new BigInteger("0");
        for (LichHenDichVu lhdv : listLHDV) {
            giaDuKien = giaDuKien.add(lhdv.getDichVu().getGiaCa().multiply(new BigInteger("" + lhdv.getSoLuong())));
        }
        LichHenDichVu[] list = new LichHenDichVu[listLHDV.size()];
        LichHen lh = new LichHen(0, thoiGianHen, giaDuKien, khachHang, listLHDV.toArray(list));
        if(!lhdao.insert(lh)) return ;
        LichHenDichVuDAO lhdv_dao = new LichHenDichVuDAO();
        for (LichHenDichVu lhdv : listLHDV) {
            lhdv_dao.insert(lh.getId(), lhdv);
        }
    } catch (Exception e) {
        response.sendRedirect("./gdDatLich.jsp");
        return;
    }
    session.setAttribute("list_lhdv", null);
    response.sendRedirect("./gdDatLich.jsp");

%>   

