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
    <body onload="getTotal();">
        <%@include file="components/navbar.jsp" %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Booking</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Booking Tour</h1>
                    </div>
                </div>
            </div>
        </div>
        <%            
            TourDTO dto = (TourDTO) request.getAttribute("DTO");
            Tools tools = new Tools();
        %>
        <section class="ftco-section">
            <div class="container" style="margin-top: -50px;">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="TicketMainController" method="POST">
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Number of infants</span>
                                    </div>
                                    <input type="number" min="0" class="form-control input" id="infant" name="txtInfantNumber" style="font-size: 15px;" value="0" onclick="getTotal();" onkeydown="return (event.keyCode !== 69 && event.keyCode !== 190)">
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Number of children</span>
                                    </div>
                                    <input type="number" min="0" class="form-control input" id="child" name="txtChildNumber" style="font-size: 15px;" value="0" onclick="getTotal();" onkeydown="return (event.keyCode !== 69 && event.keyCode !== 190)">
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-group form-group col-xl-12 ftco-animate">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px;">Number of adults</span>
                                    </div>
                                    <input type="number" min="1" class="form-control input" id="adult" name="txtAdultNumber" style="font-size: 15px;" value="1" onclick="getTotal();" onkeydown="return (event.keyCode !== 69 && event.keyCode !== 190)">
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-group form-group col-xl-12"  style="display: flex; justify-content: center;">
                                    <input type="hidden" name="tourId" value="<%= dto.getId() %>"/>
                                    <input type="hidden" name="total" value="<%= dto.getAdultPrice() %>"/>
                                    <input type="submit" class="btn btn-outline-primary" name="action" value="Confirm" style="width: 100px; height: 50px; margin-top: 20px;"/>
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
                                            <h3><%= dto.getName()%></h3>
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
                                        <span style="font-size: 30px;">Total: $<span style="font-size: 30px;" id="total"><%= dto.getAdultPrice()%></span></span>
                                        <span class="ml-auto"><%= dto.getSeatAvailable()%> seats available</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            function getTotal() {
                var infant = document.getElementById('infant').value;
                var child =  document.getElementById('child').value;
                var adult =  document.getElementById('adult').value;
                var total = infant * <%= dto.getInfantPrice() %> + child * <%= dto.getChildPrice() %> + adult * <%= dto.getAdultPrice() %>;
                document.getElementById('total').textContent = total;
                document.getElementsByName('total')[0].value = total;
            }
        </script>
        <script>
            var error = "<%= (String) request.getAttribute("INVALID")%>";
            if (error != "null") {
                function showError() {
                    alert(error);
                }
            }
        </script>
        <script>
            window.onload = showError;
        </script>
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