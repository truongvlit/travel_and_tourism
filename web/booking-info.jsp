<%@page import="truongvl.dtos.TouristErrorObject"%>
<%@page import="truongvl.dtos.ContactErrorObject"%>
<%@page import="truongvl.dtos.TouristDTO"%>
<%@page import="truongvl.dtos.ContactDTO"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="truongvl.tools.Tools"%>
<%@page import="java.time.LocalDate"%>
<%@page import="truongvl.dtos.TourDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NeroTourist - Booking Tour</title>
        <link rel="stylesheet" href="fonts/poppins.css">
        <link rel="stylesheet" href="fonts/abril-fatface.css">
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="fonts/font-awesome/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/ionicons.min.css">    
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Booking Info</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Booking Info</h1>
                    </div>
                </div>
            </div>
        </div>
        <%            TourDTO dto = (TourDTO) request.getAttribute("DTO");
            int touristNumber = Integer.parseInt((String) request.getAttribute("touristNumber"));
            Tools tools = new Tools();
            ContactErrorObject conError = (ContactErrorObject) request.getAttribute("conError");
            TouristErrorObject touristError = (TouristErrorObject) request.getAttribute("touristError");
            ContactDTO conDTO = (ContactDTO) request.getAttribute("conDTO");
            TouristDTO touristDTO = (TouristDTO) request.getAttribute("touristDTO");
            String conNameError = null, conAddressError = null, conPhoneError = null, conEmailError = null;
            String touristNameError[] = null, touristPhoneError[] = null, touristAddressError[] = null, touristGenderError[] = null, touristNationalityError[] = null, touristPassportError[] = null;
            String conName = null, conAddress = null, conPhone = null, conEmail = null;
            String touristName[] = null, touristPhone[] = null, touristAddress[] = null, touristGender[] = null, touristNationality[] = null, touristPassport[] = null;
            if (conError != null) {
                conNameError = conError.getNameError();
                conAddressError = conError.getAddressError();
                conPhoneError = conError.getPhoneError();
                conEmailError = conError.getEmailError();
            }
            if (touristError != null) {
                touristNameError = touristError.getNameError();
                touristPhoneError = touristError.getPhoneError();
                touristAddressError = touristError.getAddressError();
                touristGenderError = touristError.getGenderError();
                touristNationalityError = touristError.getNationalityError();
                touristPassportError = touristError.getPassportError();
            }
            if (conDTO != null) {
                conName = conDTO.getName();
                conPhone = conDTO.getPhone();
                conAddress = conDTO.getAddress();
                conEmail = conDTO.getEmail();
            }
            if (touristDTO != null) {
                touristName = touristDTO.getName();
                touristPhone = touristDTO.getPhone();
                touristAddress = touristDTO.getAddress();
                touristGender = touristDTO.getGender();
                touristNationality = touristDTO.getNationality();
                touristPassport = touristDTO.getPassport();
            }
        %>
        <section class="ftco-section">
            <div class="container" style="margin-top: -50px;">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="TicketMainController" method="POST">
                            <div class="row">
                                <span style="font-size: 30px">Contact Information</span>
                            </div>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Name</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtContactName" style="font-size: 15px;" value="<%= conName == null ? "" : conName%>">
                                </div>
                            </div>
                            <%
                                if (conNameError != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= conNameError %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Phone</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtContactPhone" style="font-size: 15px;" value="<%= conPhone == null ? "" : conPhone%>">
                                </div>
                            </div>
                            <%
                                if (conPhoneError != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= conPhoneError %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Email</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtContactEmail" style="font-size: 15px;" value="<%= conEmail == null ? "" : conEmail%>">
                                </div>
                            </div>
                            <%
                                if (conEmailError != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= conEmailError %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Address</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtContactAddress" style="font-size: 15px;" value="<%= conAddress == null ? "" : conAddress%>">
                                </div>
                            </div>
                            <%
                                if (conAddressError != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= conAddressError %></div>
                            </div>
                            <%
                                }
                            %>
                            <%
                                for (int i = 0; i < touristNumber; i++) {
                            %>
                            <div class="row">
                                <span style="font-size: 30px">Tourist Information #<%= i + 1%></span>
                            </div>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Name</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtName" style="font-size: 15px;" <% if (touristName != null) {%> value="<%= touristName[i] == null ? "" : touristName[i]%>" <% } %> >
                                </div>
                            </div>
                            <%
                                if (touristNameError != null && touristNameError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristNameError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Phone</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtPhone" style="font-size: 15px;" <% if (touristPhone != null) {%> value="<%= touristPhone[i] == null ? "" : touristPhone[i]%>" <% } %>>
                                </div>
                            </div>
                            <%
                                if (touristPhoneError != null && touristPhoneError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristPhoneError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Address</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtAddress" style="font-size: 15px;" <% if (touristAddress != null) {%> value="<%= touristAddress[i] == null ? "" : touristAddress[i]%>" <% } %> />
                                </div>
                            </div>
                            <%
                                if (touristAddressError != null && touristAddressError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristAddressError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Gender</span>
                                    </div>
                                    <select class="form-control input" name="txtGender" style="font-size: 15px;">
                                        <option value="Male" <% if (touristGender != null && touristGender[i].equals("Male")) { %> selected <% } %>/>Male
                                        <option value="Female" <% if (touristGender != null && touristGender[i].equals("Female")) { %> selected <% } %>/>Female
                                    </select>
                                </div>
                            </div>
                            <%
                                if (touristGenderError != null && touristGenderError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristGenderError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Nationality</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtNationality" style="font-size: 15px;" <% if (touristNationality != null) {%> value="<%= touristNationality[i] == null ? "" : touristNationality[i]%>" <% } %>>
                                </div>
                            </div>
                            <%
                                if (touristNationalityError != null && touristNationalityError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristNationalityError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Passport</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtPassport" style="font-size: 15px;" <% if (touristPassport != null) {%> value="<%= touristPassport[i] == null ? "" : touristPassport[i]%>" <% } %>>
                                </div>
                            </div>
                            <%
                                if (touristPassportError != null && touristPassportError[i] != null) {
                            %>
                            <div class="row alert-danger" style="margin: auto; width: 540px; margin-top: -15px;">
                                <div class="" style="text-align: justify; margin: auto"><%= touristPassportError[i] %></div>
                            </div>
                            <%
                                }
                            %>
                            <%
                                }
                            %>
                            <div class="row">
                                <div class="input-group form-group col-xl-12"  style="display: flex; justify-content: center;">
                                    <input type="hidden" name="tourId" value="<%= dto.getId()%>"/>
                                    <input type="hidden" name="touristNumber" value="<%= touristNumber + ""%>"/>
                                    <input type="hidden" name="total" value="<%= request.getParameter("total")%>"/>
                                    <input type="hidden" name="txtInfantNumber" value="<%= request.getParameter("txtInfantNumber") %>"/>
                                    <input type="hidden" name="txtChildNumber" value="<%= request.getParameter("txtChildNumber") %>"/>
                                    <input type="hidden" name="txtAdultNumber" value="<%= request.getParameter("txtAdultNumber") %>"/>
                                    <input type="submit" class="btn btn-outline-primary" name="action" value="Book" style="width: 100px; height: 50px; margin-top: 20px;"/>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="destination">
                                <a href="" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('images/<%= dto.getImage()%>')"/>
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                                </a>
                                <div class="text p-3">
                                    <div class="d-flex">
                                        <div class="one">
                                            <h3><%= dto.getName() %></h3>
                                        </div>
                                        <span>Per infant $<%= dto.getInfantPrice()%></span>
                                        <span>Per child $<%= dto.getChildPrice()%></span>
                                        <span>Per adult $<%= dto.getAdultPrice()%></span>
                                    </div>
                                    <p><%= dto.getDestination()%></p>
                                    <%
                                        LocalDate start = tools.strToDate(dto.getStartTime());
                                        LocalDate end = tools.strToDate(dto.getEndTime());
                                    %>
                                    <p class="days"><span><%= ChronoUnit.DAYS.between(start, end) + 1%> days </span></p>
                                    <hr>
                                    <p class="bottom-area d-flex">                                        
                                        <span style="font-size: 30px;">Total: $<span style="font-size: 30px;"><%= request.getParameter("total") %></span></span>
                                        <span class="ml-auto"><%= dto.getSeatAvailable()%> seats available</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp" %>
        <%@include file="components/loader.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>  
        <script src="js/scrollax.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>