<%@page import="truongvl.dtos.AccountDTO"%>
<%@page import="truongvl.dtos.AccountErrorObject"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NeroTourist - Signup Page</title>
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
        <%            AccountErrorObject errorObj = (AccountErrorObject) request.getAttribute("INVALID");
            AccountDTO dto = (AccountDTO) request.getAttribute("DTO");
            String username = null, fullname = null, address = null, email = null, phone = null;
            if (dto != null) {
                username = dto.getUsername();
                fullname = dto.getFullname();
                address = dto.getAddress();
                email = dto.getEmail();
                phone = dto.getPhone();
            }
            String usernameError = null, passwordError = null, confirmError = null, fullnameError = null,
                    phoneError = null, emailError = null, addressError = null;
            if (errorObj != null) {
                usernameError = errorObj.getUsernameError();
                passwordError = errorObj.getPasswordError();
                confirmError = errorObj.getConfirmError();
                fullnameError = errorObj.getFullnameError();
                phoneError = errorObj.getPhoneError();
                emailError = errorObj.getEmailError();
                addressError = errorObj.getAddressError();
            }
        %>
        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container ftco-animate">
                <div class="d-flex justify-content-center h-100">
                    <div class="card">
                        <div class="card-header">
                            <h2><b>Sign Up</b></h2>
                        </div>
                        <div class="card-body">
                            <form action="AccountMainController" method="POST">             
                                <div class="input-group form-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 14px; display: flex; justify-content: center;">Username(*)</span>
                                    </div>
                                    <input type="text" class="form-control input" name="txtUsername" value="<%= username == null ? "" : username%>" <% if (usernameError != null) {%> placeholder="<%= usernameError%>"  <% } %>> 
                                </div>
                                <div class="input-group form-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 14px; display: flex; justify-content: center;">Password(*)</span>
                                    </div>
                                    <input type="password" class="form-control input" name="txtPassword" <% if (passwordError != null) {%> placeholder="<%= passwordError%>"  <% } %>>
                                </div>
                                <div class="input-group form-group col-md-6">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="font-size: 13px; display: flex; justify-content: center;">Confirm<br/>Password(*)</span>
                                    </div>
                                    <input type="password" class="form-control input" name="txtConfirm" <% if (confirmError != null) {%> placeholder="<%= confirmError%>"  <% }%>>
                                </div>
                                <label class="input-group form-group col-md-6 term-condition">
                                    <input type="checkbox" class="ckb" name="ckbPolicy" id="ckb" onclick="checkCheckbox();">
                                    <div class="links">I agree with the<a href="terms.jsp"> terms and conditions</a></div>
                                </label>
                                <div class="right-side">
                                    <div class="input-group form-group col-md-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Full name</span>
                                        </div>
                                        <input type="text" class="form-control input" name="txtFullname" value="<%= fullname == null ? "" : fullname%>">
                                    </div>
                                    <%
                                        if (fullnameError != null) {
                                    %>
                                    <div class="row alert-danger" style="margin: auto; width: 200px; margin-top: -15px;">
                                        <div class="" style="text-align: justify; margin: auto"><%= fullnameError%></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="input-group form-group col-md-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Address</span>
                                        </div>
                                        <input type="text" class="form-control input" name="txtAddress" value="<%= address == null ? "" : address%>">						
                                    </div>
                                    <%
                                        if (addressError != null) {
                                    %>
                                    <div class="row alert-danger" style="margin: auto; width: 200px; margin-top: -15px;">
                                        <div class="" style="text-align: justify; margin: auto"><%= addressError%></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="input-group form-group col-md-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Email</span>
                                        </div>
                                        <input type="text" class="form-control input" name="txtEmail" value="<%= email == null ? "" : email%>">
                                    </div>
                                    <%
                                        if (emailError != null) {
                                    %>
                                    <div class="row alert-danger" style="margin: auto; width: 200px; margin-top: -15px;">
                                        <div class="" style="text-align: justify; margin: auto"><%= emailError%></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="input-group form-group col-md-12">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Phone</span>
                                        </div>
                                        <input type="text" class="form-control input" name="txtPhone" value="<%= phone == null ? "" : phone%>">
                                    </div>
                                    <%
                                        if (phoneError != null) {
                                    %>
                                    <div class="row alert-danger" style="margin: auto; width: 250px; margin-top: -15px;">
                                        <div class="" style="text-align: justify; margin: auto"><%= phoneError%></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="d-flex form-group justify-content-xl-center">
                                    <input type="submit" name="action" value="Signup" id="btn-signup" class="btn btn-login">
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                Already have an account? <a href="login.jsp">Log In</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
        <%@include file="components/loader.jsp" %>
        <script>
            var error = "<%= (String) request.getAttribute("ERROR")%>";
            if (error != "null") {
                function showInvalidInfo() {
                    alert(error);
                }
            }
        </script>
        <script>
            window.onload = function () {
                checkCheckbox();
                showInvalidInfo();
            }
        </script>
        <script>
            function checkCheckbox() {
                if (document.getElementById('ckb').checked === false) {
                    document.getElementById('btn-signup').disabled = true;
                    document.getElementById('btn-signup').classList.add('disabled-button');
                } else {
                    document.getElementById('btn-signup').disabled = false;
                    document.getElementById('btn-signup').classList.remove('disabled-button');
                }
            }
        </script>
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