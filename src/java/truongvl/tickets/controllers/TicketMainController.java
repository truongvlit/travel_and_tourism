/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.tickets.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nero
 */
public class TicketMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SEARCH = "SearchPurchasedTicketController";
    private static final String BOOKING_TOUR = "BookingController";
    private static final String BOOKING_TOUR_1 = "Booking1Controller";
    private static final String BOOKING_TOUR_2 = "Booking2Controller";
    private static final String LOAD_TICKET = "LoadTicketController";
    private static final String CHECK_TICKET = "CheckTicketController";
    
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
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Booking")) {
                url = BOOKING_TOUR;
            } else if (action.equals("Confirm")) {
                url = BOOKING_TOUR_1;
            } else if (action.equals("Book")) {
                url = BOOKING_TOUR_2;
            } else if (action.equals("Check")) {
                url = CHECK_TICKET;
            } else if (action.equals("Load")){
                url = LOAD_TICKET;
            } else{
                request.setAttribute("ERROR", "Action is not supported!");
            }
        } catch (Exception e) {
            log("ERROR at TicketMainController: " + e.getMessage());
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
