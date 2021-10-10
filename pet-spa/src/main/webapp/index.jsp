<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="dao.*" %>
        <%@ page import="model.*" %>
         <%@ page import="static utils.FormateDateTime.convertParamToLocalDateTime" %>
    </head>
    <body>
       
        <% 
          DichVuDAO dvd =new DichVuDAO();
           DichVu dv = new DichVu() ;
          
            String s = "Xin chào"+ convertParamToLocalDateTime("2021-10-10T01%3A46") ;
            
        %>
        <h1> <%=s%> </h1>
    </body>
</html>
