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
        HoaDonDAO hdDAO = new HoaDonDAO();

        HoaDon hd = (HoaDon) session.getAttribute("hoadon");
        hdDAO.insert(hd);
        HoaDonDichVuDAO hddvDAO = new HoaDonDichVuDAO();
        for (HoaDonDichVu hddv : hd.getListHDDV()) {
            hddvDAO.insert(hd.getId(), hddv);
        }
        session.setAttribute("hoadon", null);
        session.setAttribute("list_hddv", null);
        session.setAttribute("lichhen", null);
    } catch (Exception e) {
        response.sendRedirect("./gdThanhToan.jsp");
        return;
    }

    response.sendRedirect("./gdThanhToan.jsp");

%>   

