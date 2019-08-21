<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="truongvl.tools.Tools"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="truongvl.dtos.TourDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>NeroTourist - Destination</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath(); %>
        <link rel="stylesheet" href="<%= path %>/fonts/poppins.css">
        <link rel="stylesheet" href="<%= path %>/fonts/abril-fatface.css">
        <link rel="stylesheet" href="<%= path %>/fonts/font-awesome/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="<%= path %>/css/animate.css">
        <link rel="stylesheet" href="<%= path %>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%= path %>/css/ionicons.min.css">    
        <link rel="stylesheet" href="<%= path %>/css/flaticon.css">
        <link rel="stylesheet" href="<%= path %>/css/icomoon.css">
        <link rel="stylesheet" href="<%= path %>/css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Places</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Destinations</h1>
                    </div>
                </div>
            </div>
        </div>
        <%
            Tools tools = new Tools();
            List<TourDTO> list = (List) request.getAttribute("list");
            String search = (request.getParameter("txtSearch") == null || request.getParameter("txtSearch").equals("null")) ? "" : request.getParameter("txtSearch");
        %>
        <form action="TourMainController" method="POST">
            <div class="row" style="position: relative; display: flex; justify-content: center; margin: auto; margin-top: 50px;">
                <div class="input-group form-group col-xl-10">
                    <div class="input-group-prepend">
                        <input value="Search" class="btn btn-info" disabled="true" style="width: 150px; cursor: default;"/>
                    </div>
                    <input type="text" class="form-control input" name="txtSearch" placeholder="Where do you want to go?" style="font-size: 15px;" value="<%= (search.isEmpty()) ? "" : request.getParameter("txtSearch")%>">
                    <div class="input-group-append">
                        <input type="submit" name="action" value="Search Tour" class="btn btn-outline-info">
                    </div>
                </div>
            </div>
        </form>
        <%
            if (list != null && list.isEmpty()) {
        %>
        <font color="red"> No record found! </font>
        <%
        } else if (list != null) {
            int maxPages = (int) request.getAttribute("maxPages");
        %>
        <section class="ftco-section">
            <div class="container" style="margin-top: -50px;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <% for (TourDTO dto : list) {%>
                            <div class="col-sm-4 col-md-4 col-lg-4 ftco-animate">
                                <div class="destination">
                                    <a href="" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('images/<%= dto.getImage() %>')" />
                                        <div class="icon d-flex justify-content-center align-items-center">
                                            <span class="icon-link"></span>
                                        </div>
                                    </a>
                                    <div class="text p-3">
                                        <div class="d-flex">
                                            <div class="one">
                                                <h3><%= dto.getName()%></h3>
                                            </div>
                                            <div class="two">
                                                <span class="price">$<%= dto.getAdultPrice()%></span>
                                            </div>
                                        </div>
                                        <p><%= dto.getDestination()%></p>
                                        <%
                                            LocalDate start = tools.strToDate(dto.getStartTime());
                                            LocalDate end = tools.strToDate(dto.getEndTime());
                                        %>
                                        <p class="days"><span><%= ChronoUnit.DAYS.between(start, end) + 1 %> days </span></p>
                                        <hr>
                                        <p class="bottom-area d-flex">
                                            <span><%= dto.getSeatAvailable()%> seats available</span>
                                            <span class="ml-auto"><a href="TicketMainController?action=Booking&tourId=<%= dto.getId() %>">Book now</a></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="row mt-5">
                            <div class="col text-center">
                                <div class="block-27">
                                    <ul>
                                        <%
                                            for (int i = 0; i <= maxPages; i++) {
                                        %>
                                        <li>
                                            <%
                                                if (search.isEmpty()) {
                                            %>
                                            <a href="<%= request.getContextPath()%>/destinations?page=<%= i + 1%>" style="margin-right: 5px;"><%= i + 1%></a>
                                            <%
                                            } else {
                                            %>
                                            <a href="<%= request.getContextPath()%>/destinations?page=<%= i + 1%>&txtSearch=<%= request.getParameter("txtSearch")%>" style="margin-right: 5px;"><%= i + 1%></a>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%%>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footer.jsp" %>
        <%@include file="components/loader.jsp" %>
        <script src="<%= path %>/js/jquery.min.js"></script>
        <script src="<%= path %>/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="<%= path %>/js/popper.min.js"></script>
        <script src="<%= path %>/js/bootstrap.min.js"></script>
        <script src="<%= path %>/js/jquery.easing.1.3.js"></script>
        <script src="<%= path %>/js/jquery.waypoints.min.js"></script>
        <script src="<%= path %>/js/jquery.stellar.min.js"></script>
        <script src="<%= path %>/js/owl.carousel.min.js"></script>
        <script src="<%= path %>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= path %>/js/aos.js"></script>
        <script src="<%= path %>/js/jquery.animateNumber.min.js"></script>  
        <script src="<%= path %>/js/scrollax.min.js"></script>
        <script src="<%= path %>/js/main.js"></script>
    </body>
</html>