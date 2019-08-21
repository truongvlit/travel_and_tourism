/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.tours.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import truongvl.dtos.TourDTO;
import truongvl.models.TourDAO;

/**
 *
 * @author Nero
 */
public class SearchTourController extends HttpServlet {

    private static final int RECORDS_PER_PAGE = 10;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pageId = 0;
        String search = null;
        String url = null;
        try {
            //get page number from url
            String page = request.getParameter("page");
            pageId = page == null ? 1 : Integer.parseInt(page);
            search = request.getParameter("txtSearch");
            boolean check = (search == null || search.equals("null") || search.trim().isEmpty());
            //get max pages
            TourDAO dao = new TourDAO();
            double temp = RECORDS_PER_PAGE;
            int maxPages;
            if (check) {
                maxPages = ((dao.getListSize() / temp) == Math.ceil(dao.getListSize() / RECORDS_PER_PAGE)) 
                    ? ((int) Math.ceil(dao.getListSize() / RECORDS_PER_PAGE) - 1) : ((int) Math.ceil(dao.getListSize() / RECORDS_PER_PAGE));
            } else {
                maxPages = ((dao.getSearchListSize(search) / temp) == Math.ceil(dao.getSearchListSize(search) / RECORDS_PER_PAGE)) 
                    ? ((int) Math.ceil(dao.getSearchListSize(search) / RECORDS_PER_PAGE) - 1) : ((int) Math.ceil(dao.getSearchListSize(search) / RECORDS_PER_PAGE));
            }
            if (pageId < 0 || pageId > (maxPages + 1)) {
                pageId = 1;
            }
            //get records by page
            List<TourDTO> list;
            if (pageId == 1) {
                if (check) list = dao.getTourByPage(1, RECORDS_PER_PAGE, null);
                else list = dao.getTourByPage(1, RECORDS_PER_PAGE, search);
            } else {
                if (check) list = dao.getTourByPage(((pageId - 1) * RECORDS_PER_PAGE) + 1, pageId * RECORDS_PER_PAGE, null);
                else list = dao.getTourByPage(((pageId - 1) * RECORDS_PER_PAGE) + 1, pageId * RECORDS_PER_PAGE, search);
            }
            int count = (pageId - 1) * RECORDS_PER_PAGE;
            request.setAttribute("list", list);
            request.setAttribute("count", count);
            request.setAttribute("maxPages", maxPages);            
            request.setAttribute("search", search);
            if (check) url = "admin/tour/admin-view-tour.jsp?page=" + pageId;
            else {
                url = "admin/tour/admin-view-tour.jsp?page=" + pageId + "&txtSearch=" + search;
            }
        } catch (Exception e) {
            log("ERROR at SearchTourController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}