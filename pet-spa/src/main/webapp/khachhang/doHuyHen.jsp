<%-- 
    Document   : doHuyHen.jsp
    Created on : Dec 19, 2021, 8:12:17 PM
    Author     : dovan
--%>

<%@page import="model.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
            LichHenDichVuDAO lhdvdao = new LichHenDichVuDAO();
            LichHenDAO lhdao = new LichHenDAO();
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
            int lhid = Integer.parseInt(request.getParameter("lh_id"));
            LichHen lh = (LichHen )session.getAttribute("lhct");
            LichHenDichVu[] list = lh.getListLHDV();
            for(int i=0;i<list.length;i++){
                lhdvdao.delete(list[i].getId());
            }
            lhdao.delete(lhid);
            response.sendRedirect("./gdXemLichHen.jsp"); 
             //LichHenDichVu[] listLichHen =  ;
         %>   
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
