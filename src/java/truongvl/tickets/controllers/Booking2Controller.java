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
import javax.servlet.http.HttpSession;
import truongvl.dtos.ContactDTO;
import truongvl.dtos.ContactErrorObject;
import truongvl.dtos.TourDTO;
import truongvl.dtos.TouristDTO;
import truongvl.dtos.TouristErrorObject;
import truongvl.models.ContactDAO;
import truongvl.models.TicketDAO;
import truongvl.models.TourDAO;
import truongvl.models.TouristDAO;

/**
 *
 * @author Nero
 */
public class Booking2Controller extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "booking-info.jsp";
    private static final String SUCCESS = "home";

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
            String accountInfo = (String) session.getAttribute("accountInfo");
            int touristNumber = Integer.parseInt(request.getParameter("touristNumber"));
            String tourId = request.getParameter("tourId");
            //All tourists information got from Form
            String[] nameList = request.getParameterValues("txtName");
            String[] phoneList = request.getParameterValues("txtPhone");
            String[] addressList = request.getParameterValues("txtAddress");
            String[] genderList = request.getParameterValues("txtGender");
            String[] nationalityList = request.getParameterValues("txtNationality");
            String[] passportList = request.getParameterValues("txtPassport");
            //Init error variables
            String[] nameError = new String[touristNumber];
            String[] phoneError = new String[touristNumber];
            String[] addressError = new String[touristNumber];
            String[] genderError = new String[touristNumber];
            String[] nationalityError = new String[touristNumber];
            String[] passportError = new String[touristNumber];
            //Use to contain tourist information
            String[] name = new String[touristNumber];
            String[] phone = new String[touristNumber];
            String[] address = new String[touristNumber];
            String[] gender = new String[touristNumber];
            String[] nationality = new String[touristNumber];
            String[] passport = new String[touristNumber];
            //Contact information got from Form
            String contactName = request.getParameter("txtContactName");
            String contactPhone = request.getParameter("txtContactPhone");
            String contactEmail = request.getParameter("txtContactEmail");
            String contactAddress = request.getParameter("txtContactAddress");
            //
            String infant = request.getParameter("txtInfantNumber");
            String child = request.getParameter("txtChildNumber");
            String adult = request.getParameter("txtAdultNumber");
            int infantNumber = infant == null ? 0 : Integer.parseInt(infant);
            int childNumber = child == null ? 0 : Integer.parseInt(child);
            int adultNumber = adult == null ? 0 : Integer.parseInt(adult);
            //
            ContactErrorObject conError = new ContactErrorObject();
            TouristErrorObject touristError = new TouristErrorObject();
            ContactDTO conDTO = new ContactDTO();
            TouristDTO touristDTO = new TouristDTO();
            //
            if (contactName == null || contactName.isEmpty()) {
                valid = false;
                conError.setNameError("Name is required");
            } else {
                conDTO.setName(contactName);
            }
            if (contactPhone == null || contactPhone.isEmpty()) {
                valid = false;
                conError.setPhoneError("Phone is required");
            } else {
                conDTO.setPhone(contactPhone);
            }
            if (contactEmail == null || contactEmail.isEmpty()) {
                valid = false;
                conError.setEmailError("Email is required");
            } else if (!contactEmail.matches("^\\b^['_a-z0-9-+]+(.['_a-z0-9-+]+)*@[a-z0-9-]+(.[a-z0-9-]+)*.([a-z]{2,6})$\\b$")) {
                valid = false;
                conDTO.setEmail(contactEmail);
                conError.setEmailError("Email is invalid");
            } else {
                conDTO.setEmail(contactEmail);
            }
            if (contactAddress == null || contactAddress.isEmpty()) {
                valid = false;
                conError.setAddressError("Address is required");
            } else {                
                conDTO.setAddress(contactAddress);
            }
            for (int i = 0; i < touristNumber; i++) {
                String touristName = nameList[i] == null ? "" : nameList[i];
                String touristPhone = phoneList[i] == null ? "" : phoneList[i];
                String touristAddress = addressList[i] == null ? "" : addressList[i];
                String touristGender = genderList[i] == null ? "" : genderList[i];
                String touristNationality = nationalityList[i] == null ? "" : nationalityList[i];
                String touristPassport = passportList[i] == null ? "" : passportList[i];
                if (touristName.isEmpty()) {
                    valid = false;
                    nameError[i] = "Name is required";
                } else {
                    name[i] = touristName;
                }
                if (touristPhone.isEmpty()) {
                    valid = false;
                    phoneError[i] = "Phone is required";
                } else if (!touristPhone.matches("^\\d{10}$|^\\d{11}$")) {
                    valid = false;
                    phone[i] = touristPhone;
                    phoneError[i] = "Phone contains 10 or 11 digits";
                } else {
                    phone[i] = touristPhone;
                }
                if (touristAddress.isEmpty()) {
                    valid = false;
                    addressError[i] = "Address is required";
                } else {
                    address[i] = touristAddress;
                }
                if (touristGender.isEmpty()) {
                    valid = false;
                    genderError[i] = "Gender is required";
                } else {
                    gender[i] = touristGender;
                }
                if (touristNationality.isEmpty()) {
                    valid = false;
                    nationalityError[i] = "Nationality is required";
                } else {
                    nationality[i] = touristNationality;
                }
                if (touristPassport.isEmpty()) {
                    valid = false;
                    passportError[i] = "Passport is required";
                } else {
                    passport[i] = touristPassport;
                }
            }
            if (valid) {
                url = SUCCESS;
                //Insert Contact
                ContactDAO conDAO = new ContactDAO();
                conDAO.insert(tourId, conDTO);
                String contactId = conDAO.findContactId(tourId, conDTO);
                //Insert Tourist
                TouristDAO touristDAO = new TouristDAO();
                for (int i = 0; i < touristNumber; i++) {
                    String touristName = nameList[i];
                    String touristPhone = phoneList[i];
                    String touristAddress = addressList[i];
                    String touristGender = genderList[i];
                    String touristNationality = nationalityList[i];
                    String touristPassport = passportList[i];
                    touristDAO.insert(touristPassport, touristNationality, touristName, touristAddress, touristGender, touristPhone);
                }
                //Insert Ticket
                TourDAO tourDAO = new TourDAO();
                TourDTO tourDTO = tourDAO.getTourById(tourId);
                TicketDAO ticketDAO = new TicketDAO();
                for (int i = 0; i < touristNumber; i++) {
                    String touristPassport = passportList[i];
                    if (infantNumber == 0) {
                        if (childNumber == 0) {
                            if (adultNumber == 0) {}
                            else {
                                adultNumber -= 1;
                                ticketDAO.insert(tourId, touristPassport, tourDTO.getAdultPrice(), contactId, accountInfo);
                            }
                        } else {
                            childNumber -= 1;
                            ticketDAO.insert(tourId, touristPassport, tourDTO.getChildPrice(), contactId, accountInfo);
                        }
                    } else {
                        infantNumber -= 1;
                        ticketDAO.insert(tourId, touristPassport, tourDTO.getInfantPrice(), contactId, accountInfo);
                    }
                }
                //Update seat available
                tourDAO.updateSeat(tourId, (tourDTO.getSeatAvailable() - touristNumber));
                //Announce User that the purchase is success
                request.setAttribute("INFO", "Thank you for your order. We've received your information and will contact you soon!");
            } else {
                url = INVALID;
                TourDAO dao = new TourDAO();
                TourDTO dto = dao.getTourById(tourId);
                touristError = new TouristErrorObject(nameError, phoneError, addressError, genderError, nationalityError, passportError);
                touristDTO = new TouristDTO(name, phone, address, gender, nationality, passport);
                request.setAttribute("touristDTO", touristDTO);
                request.setAttribute("conDTO", conDTO);
                request.setAttribute("touristError", touristError);
                request.setAttribute("conError", conError);
                request.setAttribute("touristNumber", touristNumber + "");
                request.setAttribute("DTO", dto);
            }
        } catch (Exception e) {
            log("ERROR at Booking2Controller: " + e.getMessage());
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
