<%-- 
    Document   : gdKTLichHen
    Created on : Nov 17, 2021, 9:03:33 PM
    Author     : admin
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="../style/table.css" rel="stylesheet" type="text/css"/>
            <title>Kiểm Tra Lịch</title>
            </head>
            
            <body>
                <header>
                    <div class="container1">
                        <div class="nav1">
                            <div class="logo">
                                <a href="gdNhanVien.jsp"><img src="../assets/img/logo.png" alt="logo" class="place-img"> </a>
                            </div>
                    </div>
                </header>
            <h1 style="font-size: 300%;">Lịch hẹn của khách hàng</h1>
            <div class="btn-box">
                <button type="submit">
                  Tìm kiếm
              </button>
          </div>  
            <table class="table">
              <tr>
                <th class="table__heading">STT</th>
                <th class="table__heading">Mã KH</th>
                <th class="table__heading">Tên Khách Hàng</th>
                <th class="table__heading">Số điện thoại</th>
                <th class="table__heading">Giờ hẹn</th>
                <th class="table__heading">Thời gian hẹn</th>
                <th class="table__heading">Các dịch vụ</th>
                <th class="table__heading">Giá dự kiến</th>
              </tr>
              <tr class="table__row">
                <td class="table__content" >1</td>
                <td class="table__content" ></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp">Nguyễn Minh Hiếu</a></td>
                <td class="table__content" >0123456798</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >2</td>
                <td class="table__content" ></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp">Đỗ Văn Hiển</a></td>
                <td class="table__content" >0123456798</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >3</td>
                <td class="table__content" ></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp">Lê Trung Kiên</a></td>
                <td class="table__content" >0123456798</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >4</td>
                <td class="table__content" ></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp">Đỗ Thị Khoa</a></td>
                <td class="table__content" >0123456798</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
              <tr class="table__row">
                <td class="table__content" >5</td>
                <td class="table__content" ></td>
                <td class="table__content" ><a href="gdChiTietLichHen.jsp">Lò Văn Dự</a></td>
                <td class="table__content" >0123456798</td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
                <td class="table__content" ></td>
              </tr>
                
            </table>
            </body>
            
            
</html>