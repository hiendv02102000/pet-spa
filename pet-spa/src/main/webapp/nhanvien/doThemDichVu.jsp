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
        List<HoaDonDichVu> listHDDV;
        listHDDV = (List<HoaDonDichVu>) session.getAttribute("list_hddv");
        DichVu[] listDV = (DichVu[]) session.getAttribute("list_dv");
//    DichVuDAO dvdao = new DichVuDAO();
//    DichVu[] listDV = dvdao.getAll();
//    listLHDV.add(new LichHenDichVu(0, listDV[0], 12));
        if (sldv <= 0) {
            for (HoaDonDichVu lhdv : listHDDV) {
                if (lhdv.getDichVu().getId() == dvid) {
                    listHDDV.remove(lhdv);
                    break;
                }
            }
        } else {
            boolean isNew = true;
            for (HoaDonDichVu lhdv : listHDDV) {
                if (lhdv.getDichVu().getId() == dvid) {
                    if (sldv > lhdv.getDichVu().getGioiHan()) {
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
                        listHDDV.add(new HoaDonDichVu(0, dv, sldv));
                        break;
                    }
                }

            }
        }
        session.setAttribute("list_hddv", listHDDV);
    } catch (Exception e) {

    }
    String mahen = request.getParameter("ma_hen");
    if (mahen == null||mahen.equals("null")) {
        mahen = "";
    }else {
     mahen = "?ma_hen=" + mahen;
    }
    response.sendRedirect("./gdTaoHoaDon.jsp"+mahen);

%>   

