<%@page import="truongvl.dtos.AccountErrorObject"%>
<%@page import="truongvl.dtos.AccountDTO"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath();%>
        <link rel="stylesheet" href="<%= path%>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist - Admin</title>
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
                                <h2 class="pageheader-title">Welcome <%= session.getAttribute("accountInfo")%></h2>                                    
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
                        AccountDTO dto = (AccountDTO) request.getAttribute("DTO");
                        AccountErrorObject errorObj = (AccountErrorObject) request.getAttribute("INVALID");
                        String emailError = null, phoneError = null;
                        if (errorObj != null) {
                            emailError = errorObj.getEmailError();
                            phoneError = errorObj.getPhoneError();
                        }
                    %>
                    <form action="<%= path%>/AccountMainController" method="POST">
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Username</span>
                                </div>
                                <input type="text" name="txtUsername" class="form-control input" style="font-size: 15px;" value="<%= dto.getUsername()%>" readonly="true">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Gender</span>
                                </div>
                                <select name="txtGender" class="form-control input" style="font-size: 15px; height: 45px;">
                                    <option value="Male" <% if (dto.isGender()) { %> selected <% } %>>Male</option>
                                    <option value="Female" <% if (!dto.isGender()) { %> selected <% }%>>Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Full name</span>
                                </div>
                                <input type="text" name="txtFullname" class="form-control input" style="font-size: 15px;"  value="<%= dto.getFullname()%>">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Address</span>
                                </div>
                                <input type="text" name="txtAddress" class="form-control input" style="font-size: 15px;"  value="<%= dto.getAddress()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Email</span>
                                </div>
                                <input type="text" name="txtEmail" class="form-control input" style="font-size: 15px;"  value="<%= dto.getEmail()%>">
                                <%
                                    if (emailError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= emailError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Phone</span>
                                </div>
                                <input type="text" name="txtPhone" class="form-control input" style="font-size: 15px;"  value="<%= dto.getPhone()%>">
                                <%
                                    if (phoneError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= phoneError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Birthday</span>
                                </div>
                                <input type="date" name="txtBirthday" class="form-control input" style="font-size: 15px;"  value="<%= dto.getBirthday()%>">
                            </div>
                        </div>
                        <div class="row" style="display: flex; justify-content: center;">
                            <input type="submit" name="action" value="Update" class="btn btn-outline-secondary"/>
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