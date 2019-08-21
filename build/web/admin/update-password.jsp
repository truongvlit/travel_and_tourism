<%@page import="truongvl.dtos.AccountErrorObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <% String path = request.getContextPath();%>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist</title>
    </head>
    <body>
        <%@include file="admin-navbar.jsp" %>
        <%@include file="admin-left-sidebar.jsp" %>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Update Password</h2>                                    
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        AccountErrorObject errorObj = (AccountErrorObject) request.getAttribute("INVALID");
                        String currentError = null;
                        String passwordError = null;
                        String confirmError = null;
                        if (errorObj != null) {
                            currentError = errorObj.getCurrentPasswordError();
                            passwordError = errorObj.getPasswordError();
                            confirmError = errorObj.getConfirmError();
                        }
                    %>
                    <form action="<%= request.getContextPath()%>/AccountMainController" method="POST">
                        <div class="row" style="display: flex; justify-content: center;">
                            <div class="input-group form-group col-xl-8">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px">Current Password</span>
                                </div>
                                <input type="password" class="form-control input" name="txtCurrent" placeholder="Enter current password" style="font-size: 15px;"/>
                            </div>
                        </div>
                        <%
                            if (currentError != null) {
                        %>
                        <div class="row alert-danger" style="margin: auto; width: 300px; margin-top: -10px;">
                            <div class="" style="text-align: justify; margin: auto"><%= currentError%></div>
                        </div>
                        <%
                            }
                        %>
                        <div class="row" style="display: flex; justify-content: center;">
                            <div class="input-group form-group col-xl-8">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px">New Password</span>
                                </div>
                                <input type="password" class="form-control input" name="txtPassword" placeholder="At least 8 characters of numbers and letters" style="font-size: 15px;">
                            </div>
                        </div>
                        <%
                            if (passwordError != null) {
                        %>
                        <div class="row alert-danger" style="margin: auto; width: 300px; margin-top: -10px;">
                            <div class="" style="text-align: justify; margin: auto"><%= passwordError%></div>
                        </div>
                        <%
                            }
                        %>
                        <div class="row" style="display: flex; justify-content: center;">
                            <div class="input-group form-group col-xl-8">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 150px">Confirm Password</span>
                                </div>
                                <input type="password" class="form-control input" name="txtConfirm" placeholder="Must be the same with new password" style="font-size: 15px;
                                       display: flex; justify-content: center;">
                            </div>
                        </div>
                        <%
                            if (confirmError != null) {
                        %>
                        <div class="row alert-danger" style="margin: auto; width: 300px; margin-top: -10px">
                            <div class="" style="text-align: justify; margin: auto"><%= confirmError%></div>
                        </div>
                        <%
                            }
                        %>
                        <div class="row">                            
                            <div class="input-group form-group col-xl-12"  style="display: flex; justify-content: center;">
                                <input type="submit" class="btn btn-outline-primary" name="action" value="Update Password" style="height: 50px; margin-top: 30px"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="<%= path%>/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="<%= path%>/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="<%= path%>/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="<%= path%>/assets/libs/js/main-js.js"></script>
</body>

</html>