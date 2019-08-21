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
import truongvl.dtos.AccountDTO;
import truongvl.dtos.AccountErrorObject;
import truongvl.models.AccountDAO;

/**
 *
 * @author Nero
 */
public class SignupAccountController extends HttpServlet {

    private static final String SUCCESS = "login.jsp";
    private static final String INVALID = "signup.jsp";
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
        boolean valid = true;
        AccountDTO dto = new AccountDTO();
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String fullname = request.getParameter("txtFullname").equals("") ? null : request.getParameter("txtFullname");
            String address = request.getParameter("txtAddress").equals("") ? null : request.getParameter("txtAddress");
            String email = request.getParameter("txtEmail").equals("") ? null : request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone").equals("") ? null : request.getParameter("txtPhone");
            AccountErrorObject errorObj = new AccountErrorObject();            
            if (username.isEmpty()) {
                valid = false;
                errorObj.setUsernameError("Username cannot be empty");
            } else {
                dto.setUsername(username);
            }
            if (password.isEmpty()) {
                valid = false;
                errorObj.setPasswordError("Password cannot be empty");
            } else if (password.length() < 8) {
                valid = false;
                errorObj.setPasswordError("Password must be at aleast 8 characters");
            }
            if (confirm.isEmpty()) {
                valid = false;
                errorObj.setConfirmError("Confirm password cannot be empty");
            } else if (!confirm.equals(password)){
                valid = false;
                errorObj.setConfirmError("Confirm must match Password");
            }
            if (fullname != null) {
                dto.setFullname(fullname);
            }
            if (address != null) {
                dto.setAddress(address);
            }
            if (email != null) {
                if (email.matches("^\\b^['_a-z0-9-+]+(.['_a-z0-9-+]+)*@[a-z0-9-]+(.[a-z0-9-]+)*.([a-z]{2,6})$\\b$"))
                    dto.setEmail(email);
                else {
                    valid = false;
                    errorObj.setEmailError("Email is invalid");
                }
            }
            if (phone != null) {
                if (phone.matches("^\\d{10}$|^\\d{11}$")) {
                    dto.setPhone(phone);
                } else {
                    valid = false;
                    errorObj.setPhoneError("Phone contains 10 or 11 digits");
                }
            }
            if (!valid) {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
                request.setAttribute("DTO", dto);
            } else {
                AccountDAO dao = new AccountDAO();            
                boolean check = dao.checkSignup(username, password, fullname, address, email, phone);
                if (check) url = SUCCESS;
                else request.setAttribute("ERROR", "Signup failed!");
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                url = INVALID;
                request.setAttribute("DTO", dto);
                request.setAttribute("ERROR", "Username already exists!");
            }
            log("ERROR at SignupController: " + e.getMessage());
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