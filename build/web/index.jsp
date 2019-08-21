<%@page import="truongvl.tools.Tools"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="truongvl.dtos.TourDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>NeroTourist - Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%
            String action = request.getParameter("action");
            String info = (String) request.getAttribute("INFO");
            if (action != null) {
                if (action.equals("Logout")) {
        %>
        <script type="text/javascript" >
            history.pushState(null, null, location.href);
            window.onpopstate = function () {
                history.go(1);
            };
        </script>
        <%
                }
            }
            if (info != null) {
        %>
        <script type="text/javascript" >
            history.pushState(null, null, location.href);
            window.onpopstate = function () {
                history.go(1);
            };
        </script>
        <%
            }
        %>
        <% String path = request.getContextPath();%>
        <link rel="stylesheet" href="<%= path%>/css/style.css">
        <link rel="stylesheet" href="<%= path%>/fonts/poppins.css">
        <link rel="stylesheet" href="<%= path%>/fonts/abril-fatface.css">
        <link rel="stylesheet" href="<%= path%>/fonts/font-awesome/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="<%= path%>/css/animate.css">
        <link rel="stylesheet" href="<%= path%>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%= path%>/css/ionicons.min.css">    
        <link rel="stylesheet" href="<%= path%>/css/flaticon.css">
        <link rel="stylesheet" href="<%= path%>/css/icomoon.css">        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
                    <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left" data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">To travel <br>is to live</h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">We travel not to escape life, but for life not to escape us.</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section services-section bg-light">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-yatch"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Special Activities</h3>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-around"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Travel Arrangements</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-compass"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Private Guide</h3>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-map-of-roads"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Location Manager</h3>
                            </div>
                        </div>      
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4">Most Popular Destinations</h2>
                    </div>
                </div>
            </div>
            <%                Tools tools = new Tools();
                List<TourDTO> list = (List<TourDTO>) request.getAttribute("list");
                if (list != null) {
                    for (TourDTO dto : list) {
            %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12 ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/<%= dto.getImage()%>);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#"><%= dto.getCategory()%></a></h3>
                                    </div>
                                    <div class="two">
                                        <span class="price"><%= dto.getAdultPrice()%>$</span>
                                    </div>
                                </div>
                                <p><%= dto.getDestination()%></p>
                                <%
                                    LocalDate start = tools.strToDate(dto.getStartTime());
                                    LocalDate end = tools.strToDate(dto.getEndTime());
                                %>
                                <p class="days"><span><%= ChronoUnit.DAYS.between(start, end) + 1%> days </span></p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><%= dto.getSeatAvailable()%> seats available</span>
                                    <span class="ml-auto"><a href="#">Book now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </section>

        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <a href="destinations"><button class="btn">View more</button></a>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="100000">0</strong>
                                        <span>Happy Customers</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="40000">0</strong>
                                        <span>Destination Places</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="87000">0</strong>
                                        <span>Hotels</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="56400">0</strong>
                                        <span>Restaurant</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Tips &amp; Articles</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_1.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Tips, Travel</span>
                                <h3 class="heading mt-3"><a href="#">8 Best homestay in Philippines that you don't miss out</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_2.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Culture</span>
                                <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.jsp" class="block-20" style="background-image: url('images/image_3.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Tips, Travel</span>
                                <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            var info = "<%= (String) request.getAttribute("INFO")%>";
            if (info != "null") {
                function showInfo() {
                    alert(info);
                }
            }
        </script>
        <script>
            window.onload = showInfo();
        </script>
        <%
            if (session.getAttribute("accountInfo") != null) {
        %>
        <%@include file="components/subscribe.jsp" %>
        <%
            }
        %>
        <%@include file="components/footer.jsp" %>
        <%@include file="components/loader.jsp" %>
        <script src="<%= path%>/js/jquery.min.js"></script>
        <script src="<%= path%>/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="<%= path%>/js/popper.min.js"></script>
        <script src="<%= path%>/js/bootstrap.min.js"></script>
        <script src="<%= path%>/js/jquery.easing.1.3.js"></script>
        <script src="<%= path%>/js/jquery.waypoints.min.js"></script>
        <script src="<%= path%>/js/jquery.stellar.min.js"></script>
        <script src="<%= path%>/js/owl.carousel.min.js"></script>
        <script src="<%= path%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= path%>/js/aos.js"></script>
        <script src="<%= path%>/js/jquery.animateNumber.min.js"></script>  
        <script src="<%= path%>/js/scrollax.min.js"></script>
        <script src="<%= path%>/js/main.js"></script>
    </body>
</html>