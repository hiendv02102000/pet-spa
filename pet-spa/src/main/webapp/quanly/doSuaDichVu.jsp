<%-- 
    Document   : doLuuDangKy
    Created on : Nov 17, 2021, 9:07:18 PM
    Author     : admin
--%>


<%@page import="java.time.LocalDate"%>
<%@ page import="model.*, dao.*"  %>  

<%-- 
    Document   : dangnhap
    Created on : Oct 9, 2021, 7:30:34 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa dịch vụ</title>
    <link href="../style/loginregister.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/css/fonts/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
    <body>

                <%
             int err = 0;
             
            try {
                DichVuDAO dao = new DichVuDAO();
                DichVu dv = (DichVu)session.getAttribute("dichvu");                
                        
                       if( !dao.update(dv))err = 2;
                       else {
                          
//                          DichVu dv1 =(DichVu)session.getAttribute("dichvu");
                          session.setAttribute("dichvu", dv);
                          response.sendRedirect("./gdQLDichVu.jsp"); 
                          return;
                       }
                
                
            }catch(Exception e){
               
                response.sendRedirect("./gdTuyChinhDichVu.jsp?err="+err);
                return;
            }
            response.sendRedirect("./gdTuyChinhDichVu.jsp?err="+err); 
        %>
       
    </body>
</html>
