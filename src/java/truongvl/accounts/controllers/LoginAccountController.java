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
public class LoginAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "AccountMainController?action=Edit";
    private static final String USER = "home";
    private static final String INVALID = "login.jsp";
    
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
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            AccountDAO dao = new AccountDAO();
            AccountErrorObject errorObj = new AccountErrorObject();
            if (username.isEmpty()) {
                valid = false;
                errorObj.setUsernameError("Username cannot be empty");
            }
            if (password.isEmpty()) {
                valid = false;
                errorObj.setPasswordError("Password cannot be empty");
            }
            if (!valid) {
                url = INVALID;
                request.setAttribute("ERROR", errorObj);
            }
            else {
                String role = dao.checkLogin(username, password);
                if (!role.equals("failed")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("accountInfo", username);
                    if (role.equals("admin")) {
                        url = ADMIN;
                    } else {
                        url = USER;
                    }
                }
                else {
                    url = INVALID;
                    request.setAttribute("INVALID", "Invalid Username or Password");
                }
            }
        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
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
