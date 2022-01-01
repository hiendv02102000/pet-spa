<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.KhachHang"%>
<%@page import="model.DichVu"%>
<%@page import="dao.DichVuDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="vi">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>QL dịch vụ</title>
        </head>
         <%
             if(request.getParameter("delete")!=null){
                 String delete = request.getParameter("delete");
                 int id=Integer.parseInt(delete);
                DichVuDAO dao = new DichVuDAO();
                DichVu dv1=dao.getByID(id);
                dao.delete(dv1, id);
             }
             
            DichVuDAO dao = new DichVuDAO();

             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
             DichVu[] listDV =  dao.getAll();
            
                
            

            
         %>  
        <body>
                <header>
                <div class="nav1">
                    <div class="logo">
                        <a href="gdQuanLy.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
            <h1 style="font-family: emoji; font-size: 250%;">Danh sách dịch vụ</h1>
            <table class="table">
              <tr>
                  
                <th class="table__heading">Mã dịch vụ</th>
                <th class="table__heading">Tên dịch vụ</th>
                <th class="table__heading">Mô tả</th>
                <th class="table__heading">Giới hạn</th>
                <th class="table__heading">Giá</th>
                <%
                    int STT=0;
                    for(int i=0;i<listDV.length;i++){
                        STT+=1;
//                         listDoanhThu[i].getNgay().getDayOfMonth();
                        
                        %>
                        <tr class="table__row">
                        <td class="table__content" ><a href=<%="gdTuyChinhDichVu.jsp?dv_id="+listDV[i].getId() %>><%=listDV[i].getId()%></a></td>
                        <td class="table__content" ><%=listDV[i].getTen() %></td>
                        <td class="table__content" ><%=listDV[i].getMoTa() %></td>
                        <td class="table__content" ><%=listDV[i].getGioiHan() %></td>
                        <td class="table__content" ><%=listDV[i].getGiaCa()+""+"₫" %></td>
                        </tr>
                   <%
                    }     
             %>  
<!--              
              <tr class="table__row">
                <td class="table__content" ><a href="gdLichHenChiTiet.jsp">H30</a></td>
                <td class="table__content" >9:00</td>
                <td class="table__content" >18/11/2021</td>
                <td class="table__content" >300.000đ</td>

              </tr>-->

                
            </table>
            <button class="btn btn--radius-2 btn--red" type="submit"><a href=gdThemDichVu.jsp>Thêm dịch vụ</a></button>
            </body>
            
            
</html>