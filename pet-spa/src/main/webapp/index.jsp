<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="dao.*" %>
        <%@ page import="model.*" %>
    </head>
    <body>
       
        <% 
           DichVuDAO dvd =new DichVuDAO();
           DichVu dv = dvd.getByID(1) ;
          
            String s = ""+dv;
            
        %>
        <h1> <%=s%> </h1>
    </body>
</html>
