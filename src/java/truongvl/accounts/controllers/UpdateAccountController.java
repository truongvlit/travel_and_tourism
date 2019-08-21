/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truongvl.accounts.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import truongvl.dtos.AccountErrorObject;
import truongvl.models.AccountDAO;

/**
 *
 * @author Nero
 */
public class UpdateAccountController extends HttpServlet {
    
    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "admin/admin-profile.jsp";
    private static final String USER = "user/profile.jsp";
    private static final String ADMIN_INVALID = "admin/admin-profile.jsp";
    private static final String USER_INVALID = "user/profile.jsp";
    
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
        try {
            HttpSession session = request.getSession();            
            String username = (String)session.getAttribute("accountInfo");            
            String fullname = request.getParameter("txtFullname");
            String address = request.getParameter("txtAddress").equals("") ? null : request.getParameter("txtAddress");
            String birthday = request.getParameter("txtBirthday").equals("") ? null : request.getParameter("txtBirthday");
            String email = request.getParameter("txtEmail").equals("") ? null : request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone").equals("") ? null : request.getParameter("txtPhone");
            boolean gender = request.getParameter("txtGender").equals("Male");
            AccountDAO dao = new AccountDAO();
            String role = dao.getRole(username);
            AccountErrorObject errorObj = new AccountErrorObject();
            if (email != null) {
                if (!email.matches("^\\b^['_a-z0-9-+]+(.['_a-z0-9-+]+)*@[a-z0-9-]+(.[a-z0-9-]+)*.([a-z]{2,6})$\\b$")) {
                    valid = false;
                    errorObj.setEmailError("Email is invalid");
                }
            }
            if (phone != null) {
                if (!phone.matches("^\\d{10}$|^\\d{11}$")) {
                    valid = false;
                    errorObj.setPhoneError("Phone is invalid");
                }
            }
            if (!valid) {
                if (role.equals("admin")) url = ADMIN_INVALID;
                else url = USER_INVALID;
                request.setAttribute("INVALID", errorObj);
                request.setAttribute("DTO", dao.getAccountInfo(username));
            } else {
                boolean check = dao.updateAccount(fullname, address, birthday, email, phone, username, gender);
                if (check) {
                    request.setAttribute("DTO", dao.getAccountInfo(username));
                    if (role.equals("admin")) url = ADMIN;
                    else url = USER;
                }
                else request.setAttribute("ERROR", "Update failed!");
            }
        } catch (Exception e) {
            log("ERROR at UpdateAccountController: " + e.getMessage());
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
