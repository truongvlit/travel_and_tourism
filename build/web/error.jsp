<!DOCTYPE html>
<html>
    <head>
        <title>NeroTourist - Error Page</title>
        <link rel="stylesheet" href="fonts/poppins.css">
        <link rel="stylesheet" href="fonts/abril-fatface.css">
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="fonts/font-awesome/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/signup.css">
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
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Error Page</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Error Page</h1>
                        <h2 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><font color="white"><%= request.getAttribute("ERROR") %></font></h2>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
        <%@include file="components/loader.jsp" %>
        <script src="js/signup.js"></script>
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