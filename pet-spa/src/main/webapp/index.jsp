<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          
        DichVu[] list =dvd.getByTenDV("ch") ;
          String s= "s" ;
          for(int i=0;i<list.length;i++){
            s+="" +list[i]+'\n';
            }
         %>
         <h1> <%=s%> </h1>
         
        <h1>chào</h1>
    </body>
</html>
