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
import truongvl.dtos.TourDTO;
import truongvl.models.TourDAO;

/**
 *
 * @author Nero
 */
public class Booking1Controller extends HttpServlet {

    private static final String INVALID = "BookingController";
    private static final String VALID = "booking-info.jsp";
    private static final String ERROR = "error.jsp";
    
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
            String infant = request.getParameter("txtInfantNumber");
            String child = request.getParameter("txtChildNumber");
            String adult = request.getParameter("txtAdultNumber");
            int infantNumber = infant == null ? 0 : Integer.parseInt(infant);
            int childNumber = child == null ? 0 : Integer.parseInt(child);
            int adultNumber = adult == null ? 0 : Integer.parseInt(adult);
            int touristNumber = infantNumber + childNumber + adultNumber;
            String tourId = request.getParameter("tourId");
            TourDAO dao = new TourDAO();
            TourDTO dto = dao.getTourById(tourId);
            request.setAttribute("DTO", dto);
            if (touristNumber > dto.getSeatAvailable()) {
                url = INVALID;
                request.setAttribute("INVALID", "Sorry! There are only " + dto.getSeatAvailable() + " seat(s) left.");
            } else {
                request.setAttribute("touristNumber", touristNumber + "");
                url = VALID;
            }
        } catch (Exception e) {
            log("ERROR at Booking1Controller:" + e.getMessage());
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
