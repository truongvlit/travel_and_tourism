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
public class UpdatePasswordController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "admin/update-password.jsp";
    private static final String USER = "user/update-password.jsp";
    
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
        String url = null;
        String role = null;
        boolean valid = true;
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("accountInfo");
            String currentPassword = request.getParameter("txtCurrent");
            String newPassword = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            AccountDAO dao = new AccountDAO();
            role = dao.getRole(username);
            if (role.equals("admin")) url = ADMIN;
            else url = USER;
            AccountErrorObject errorObj = new AccountErrorObject();
            // check empty fields
            if (currentPassword.isEmpty()) {
                valid = false;
                errorObj.setCurrentPasswordError("Current password cannot be empty!");
            }
            if (newPassword.isEmpty()) {
                valid = false;
                errorObj.setPasswordError("New password cannot be empty!");
            }
            if (confirm.isEmpty()) {
                valid = false;
                errorObj.setConfirmError("Confirm password cannot be empty!");
            }
            // validate fields
            role = dao.checkLogin(username, currentPassword);
            if (role.equals("failed") && !currentPassword.isEmpty()) {
                valid = false;
                errorObj.setCurrentPasswordError("Password is wrong!");
            } else {
                if (!role.equals("failed")) {
                    if (!newPassword.isEmpty() && !newPassword.matches("[A-Za-z0-9]{8,}")) {
                        valid = false;
                        errorObj.setPasswordError("Password contains at least 8 characters of numbers and letters");
                    }
                }
            }
            if (!confirm.isEmpty() && !confirm.equals(newPassword)) {
                valid = false;
                errorObj.setConfirmError("Password and confirm password do not match!");
            }
            // if pass validation => update
            if (valid) {
                boolean check = dao.updatePassword(username, newPassword);
                if (!check) {
                    url = ERROR;
                    request.setAttribute("ERROR", "Update password failed!");
                }
            } else {
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            url = ERROR;
            log("ERROR at UpdatePasswordController: " + e.getMessage());
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
