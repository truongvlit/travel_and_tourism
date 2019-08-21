/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.tickets.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import truongvl.dtos.TicketDTO;
import truongvl.models.TicketDAO;

/**
 *
 * @author Nero
 */
public class LoadTicketController extends HttpServlet {

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
        String url = null;
        try {
            //get page number from url
            String page = request.getParameter("page");
            pageId = page == null ? 1 : Integer.parseInt(page);
            //get max pages
            TicketDAO dao = new TicketDAO();
            double temp = RECORDS_PER_PAGE;
            int maxPages;
            maxPages = ((dao.loadFullListSize() / temp) == Math.ceil(dao.loadFullListSize() / RECORDS_PER_PAGE)) 
                    ? ((int) Math.ceil(dao.loadFullListSize() / RECORDS_PER_PAGE) - 1) : ((int) Math.ceil(dao.loadFullListSize() / RECORDS_PER_PAGE));
            if (pageId < 0 || pageId > (maxPages + 1)) {
                pageId = 1;
            }
            //get records by page
            List<TicketDTO> list;
            if (pageId == 1) {
               list = dao.loadTicket(1, RECORDS_PER_PAGE);
            } else {
               list = dao.loadTicket(((pageId - 1) * RECORDS_PER_PAGE) + 1, pageId * RECORDS_PER_PAGE);
            }
            int count = (pageId - 1) * RECORDS_PER_PAGE;
            request.setAttribute("list", list);
            request.setAttribute("count", count);
            request.setAttribute("maxPages", maxPages);            
            url = "admin/dashboard.jsp?page=" + pageId;
        } catch (Exception e) {
            log("ERROR at SearchPurchasedTicketController: " + e.getMessage());
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
