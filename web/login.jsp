<%@page import="truongvl.dtos.AccountErrorObject"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NeroTourist - Login Page</title>
        <% String path = request.getContextPath();%>
        <link rel="stylesheet" href="<%= path%>/fonts/poppins.css">
        <link rel="stylesheet" href="<%= path%>/fonts/abril-fatface.css">
        <link rel="stylesheet" href="<%= path%>/css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path%>/fonts/font-awesome/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="<%= path%>/css/login.css">
        <link rel="stylesheet" href="<%= path%>/css/animate.css">
        <link rel="stylesheet" href="<%= path%>/css/magnific-popup.css">
        <link rel="stylesheet" href="<%= path%>/css/ionicons.min.css">    
        <link rel="stylesheet" href="<%= path%>/css/flaticon.css">
        <link rel="stylesheet" href="<%= path%>/css/icomoon.css">
        <link rel="stylesheet" href="<%= path%>/css/style.css">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%            AccountErrorObject errorObj = (AccountErrorObject) request.getAttribute("ERROR");
            String usernameError = null, passwordError = null;
            if (errorObj != null) {
                usernameError = errorObj.getUsernameError();
                passwordError = errorObj.getPasswordError();
            }
        %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container ftco-animate">
                <div class="d-flex justify-content-center h-100">
                    <div class="card">
                        <div class="card-header">
                            <h2><b>Login</b></h2>
                            <div class="d-flex justify-content-end social-icon">
                                <span><i class="fab fa-facebook-square"></i></span>
                                <span><i class="fab fa-google-plus-square"></i></span>
                                <span><i class="fab fa-twitter-square"></i></span>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="AccountMainController" method="POST">
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user" style="margin: auto;"></i></span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtUsername" id="user" <% if (usernameError != null) {%> placeholder="<%= usernameError%>" <% } else { %> placeholder="Enter your Username" <% } %>>												
                                </div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key" style="margin: auto;"></i></span>
                                    </div>
                                    <input type="password" class="form-control input" name="txtPassword" <% if (passwordError != null) {%> placeholder="<%= passwordError%>" <% } else { %> placeholder="Enter your Password" <% }%>>						
                                </div>
                                <div class="d-flex form-group justify-content-xl-center">
                                    <input type="submit" name="action" value="Login" class="btn btn-login">
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                Don't have an account?<a href="signup.jsp">Sign Up</a>
                            </div>
                            <div class="d-flex justify-content-center">
                                <a href="#">Forgot your password?</a>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
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