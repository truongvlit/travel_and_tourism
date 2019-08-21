/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.tours.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import truongvl.dtos.TourDTO;
import truongvl.dtos.TourErrorObject;
import truongvl.models.TourDAO;
import truongvl.tools.Tools;

/**
 *
 * @author Nero
 */
public class InsertTourController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "admin/tour/admin-insert-tour.jsp";
    private static final String SUCCESS = "admin/tour/admin-insert-tour.jsp";

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
        boolean valid = true;
        TourDTO dto = new TourDTO();
        TourErrorObject errorObj = new TourErrorObject();
        Tools tools = new Tools();
        try {
            String category = request.getParameter("txtCategory");
            String name = request.getParameter("txtName");
            String startTime = request.getParameter("txtStartTime");
            String endTime = request.getParameter("txtEndTime");
            String destination = request.getParameter("txtDestination");
            String infantPriceStr = request.getParameter("txtInfantPrice");
            String childPriceStr = request.getParameter("txtChildPrice");
            String adultPriceStr = request.getParameter("txtAdultPrice");
            String seatStr = request.getParameter("txtSeatAvailable");
            String description = request.getParameter("txtDescription");
            String image = request.getParameter("txtImage");
            //validate category
            if (category.isEmpty()) {
                valid = false;
                errorObj.setCategoryError("Category is required");
            } else {
                dto.setCategory(category);
            }
            //validate name
            if (name.isEmpty()) {
                valid = false;
                errorObj.setNameError("Name is required");
            } else {
                dto.setName(name);
            }
            //validate start time
            if (startTime.isEmpty()) {
                valid = false;
                errorObj.setStartTimeError("Start time is required");
            } else if (!tools.checkDate(startTime)) {
                valid = false;
                dto.setStartTime(startTime);
                errorObj.setStartTimeError("Start time must be after current date at least one week");
            } else {
                dto.setStartTime(startTime);
            }
            //validate end time
            if (endTime.isEmpty()) {
                valid = false;
                errorObj.setEndTimeError("End time is required");
            } else if (!tools.checkTwoDates(startTime, endTime)) {
                valid = false;
                dto.setEndTime(endTime);
                errorObj.setEndTimeError("Tour has to be at least one day long");
            } else {
                dto.setEndTime(endTime);
            }
            //validate destination
            if (destination.isEmpty()) {
                valid = false;
                errorObj.setDestinationError("Destination is required");
            } else {
                dto.setDestination(destination);
            }
            //vaidate infant ticket price
            String regex = "^(\\d*[.])?\\d+$";
            if (infantPriceStr.isEmpty()) {
                valid = false;
                errorObj.setInfantPriceError("Infant ticket price is required");
            } else if (!infantPriceStr.matches(regex)) {
                valid = false;
                errorObj.setInfantPriceError("Infant ticket price must be a positive real number");
            } else {
                dto.setInfantPrice(Float.parseFloat(infantPriceStr));
            }
            //validate child ticket price
            if (childPriceStr.isEmpty()) {
                valid = false;
                errorObj.setChildPriceError("Child ticket price is required");
            } else if (!childPriceStr.matches(regex)) {
                valid = false;
                errorObj.setChildPriceError("Child ticket price must be a positive real number");
            } else {
                dto.setChildPrice(Float.parseFloat(childPriceStr));
            }
            //validate adult ticket price
            if (adultPriceStr.isEmpty()) {
                valid = false;
                errorObj.setAdultPriceError("Adult ticket price is required");
            } else if (!adultPriceStr.matches(regex)) {
                valid = false;
                errorObj.setAdultPriceError("Adult ticket price must be a positive real number");
            } else {
                dto.setAdultPrice(Float.parseFloat(adultPriceStr));
            }
            //validate seat available
            if (seatStr.isEmpty()) {
                valid = false;
                errorObj.setSeatError("Seat available is required");
            } else if (!seatStr.matches("^\\d+$")) {
                valid = false;
                errorObj.setSeatError("Seat must be a positive integer");
            } else {
                dto.setSeatAvailable(Integer.parseInt(seatStr));
            }
            //validate description
            if (description.isEmpty()) {
                valid = false;
                errorObj.setDescriptionError("Description is required");
            } else {
                dto.setDescription(description);
            }
            //validate email
            if (image.isEmpty()) {
                valid = false;
                errorObj.setImageError("Image is required");
            } else {
                dto.setImage(image);
            }
            //check if valid
            if (!valid) {
                url = INVALID;
                request.setAttribute("DTO", dto);
                request.setAttribute("errorObj", errorObj);
            } else {
                Float infantPrice = Float.parseFloat(request.getParameter("txtInfantPrice"));
                Float childPrice = Float.parseFloat(request.getParameter("txtChildPrice"));
                Float adultPrice = Float.parseFloat(request.getParameter("txtAdultPrice"));
                Integer seatAvailable = Integer.parseInt(request.getParameter("txtSeatAvailable"));
                TourDAO dao = new TourDAO();
                boolean check = dao.insertTour(category, name, startTime, endTime, destination, infantPrice, childPrice, adultPrice, seatAvailable, description, image);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("SUCCESS", "Tour has been inserted successfully!");
                } else {
                    request.setAttribute("ERROR", "Insert failed!");
                }
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                url = INVALID;
                request.setAttribute("DTO", dto);
                request.setAttribute("errorObj", errorObj);
                request.setAttribute("duplicate", "This tour is already exists");
            }
            log("ERROR at InsertTourController: " + e.getMessage());
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
