<%-- 
    Document   : doChonDichVu.jsp
    Created on : Dec 31, 2021, 2:48:27 PM
    Author     : dovan
--%>

<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        int dvid = Integer.parseInt(request.getParameter("dv_id"));
        int sldv = Integer.parseInt(request.getParameter("dv_sl"));
        List<LichHenDichVu> listLHDV;
        listLHDV = (List<LichHenDichVu>) session.getAttribute("list_lhdv");
        DichVu[] listDV = (DichVu[]) session.getAttribute("list_dv");
//    DichVuDAO dvdao = new DichVuDAO();
//    DichVu[] listDV = dvdao.getAll();
//    listLHDV.add(new LichHenDichVu(0, listDV[0], 12));
        if (sldv <= 0) {
            for (LichHenDichVu lhdv : listLHDV) {
                if (lhdv.getDichVu().getId() == dvid) {
                    listLHDV.remove(lhdv);
                    break;
                }
            }
        } else {
            boolean isNew = true;
            for (LichHenDichVu lhdv : listLHDV) {
                if (lhdv.getDichVu().getId() == dvid) {
                    if(sldv>lhdv.getDichVu().getGioiHan()){
                    sldv = lhdv.getDichVu().getGioiHan();
    }
                    lhdv.setSoLuong(sldv);

                    isNew = false;
                    break;
                }
            }
            if (isNew) {
                for (DichVu dv : listDV) {
                    if (dv.getId() == dvid) {
                        listLHDV.add(new LichHenDichVu(0, dv, sldv));
                        break;
                    }
                }

            }
        }
        session.setAttribute("list_lhdv", listLHDV);
    } catch (Exception e) {
 
    }
    response.sendRedirect("./gdDatLich.jsp"); 
  
%>   

