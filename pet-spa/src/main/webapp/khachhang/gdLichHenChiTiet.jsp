<%-- 
    Document   : gdKTLichHen
    Created on : Oct 9, 2021, 7:36:13 PM
    Author     : admin
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="model.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.*"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Lịch hẹn chi tiết</title>
        </head>
         <%
             LichHenDichVuDAO dao = new LichHenDichVuDAO();
             DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("HH:mm  dd-MM-yyyy");
            //  KhachHang kh = (KhachHang)session.getAttribute("khachhang");
            // if(kh==null){
            //   return;
            // }
            int lhid = Integer.parseInt(request.getParameter("lh_id"));
            LichHen lh = new LichHen();
            lh.setListLHDV(dao.getByLichHenID(lhid));
            session.setAttribute("lhct", lh);
             //LichHenDichVu[] listLichHen =  ;
         %>   
            <body>
                <header>
                <div class="nav1">
                    <div class="logo">
                        <a href="gdKhachHang.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                    </div>
            </div>
        </header>
            <h1 style="font-family: emoji; font-size: 250%;">Lịch hẹn của khách hàng</h1>
            <table class="table">
              <tr>
                <th class="table__heading">Dịch vụ</th>
                <th class="table__heading">Số lượng</th>
                <th class="table__heading">Giá</th>
              
                <%
                    BigInteger tong = new BigInteger("0");
                    LichHenDichVu[] list = lh.getListLHDV();
                    for(int i=0;i<list.length;i++){
                        BigInteger t =(list[i].getDichVu().getGiaCa().multiply(new BigInteger(""+list[i].getSoLuong())));
                        tong = tong.add(t);
                        %>
                        <tr class="table__row">
                            <td class="table__content" ><%=list[i].getDichVu().getTen()%></td>
                            <td class="table__content" ><%=list[i].getSoLuong()%></td>
                            <td class="table__content" ><%=list[i].getDichVu().getGiaCa()+"₫"%></td>
                           
                        </tr>
                   <%
                    }     
             %>  
<!--              <tr class="table__row">
                <td class="table__content" >Mát-xa</td>
                <td class="table__content" >2</td>
                <td class="table__content" >250.000đ</td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >Cắt tỉa</td>
                <td class="table__content" >3</td>
                <td class="table__content" >300.000đ</td>
                <td class="table__content" ></td>
              </tr>-->
              <tr class="table__row" style ="font-weight: bold">
                <td class="table__content"  >Tổng : </td>
                <td class="table__content" ></td>
                <td class="table__content" ><%=tong+"₫"%></td>
              
              </tr>

                
            </table>
                <style>
                    
                 .button {
                  background-color: #4CAF50;
                  border: none;
                  color: white;
                  padding: 15px 32px;
                  text-align: center;
                  text-decoration: none;
                  display: inline-block;
                  font-size: 16px;
                  margin: 4px 2px;
                  cursor: pointer;
                }
                .center {
                    margin: auto;
                    width: 50%;
                    border: 3px solid green;
                    padding: 10px;
                }
                .center:hover {
                   color: white;
                   text-decoration: none;
                }
                </style>
                 <div>
                     <a class="button center" type="submit" href=<%= "doHuyHen.jsp?lh_id="+lhid%> >Xoá </a>
                 </div>
            </body>
            
            
</html>