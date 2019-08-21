<%@page import="truongvl.dtos.TouristDTO"%>
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
        <title>NeroTourist - Tourist Information</title>
    </head>
    <body>
        <%@include file="account-navbar.jsp" %>
        <%@include file="account-left-sidebar.jsp" %>
        <%
            TouristDTO dto = (TouristDTO) request.getAttribute("DTO");
        %>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Tourist ID: <%= dto.getTouristPassport() %> Information</h2>                                    
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
                    <div class="row">
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Passport</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;" value="<%= dto.getTouristPassport()%>" readonly="true">
                        </div>
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Nationality</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;"  value="<%= dto.getTouristNationality()%>" readonly="true">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Name</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;"  value="<%= dto.getTouristName()%>" readonly="true">
                        </div>
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Address</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;"  value="<%= dto.getTouristAddress()%>" readonly="true">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Phone</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;"  value="<%= dto.getTouristPhone()%>" readonly="true">
                        </div>
                        <div class="input-group form-group col-xl-6">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Gender</span>
                            </div>
                            <input type="text" class="form-control input" style="font-size: 15px;"  value="<%= dto.getTouristGender()%>" readonly="true">
                        </div>
                    </div>
                    <div class="row" style="display: flex; justify-content: center;">                        
                        <a href="<%= request.getContextPath() %>/TicketMainController?action=Search">
                            <button class="btn btn-outline-secondary"/>Return</button>
                        </a>
                    </div>
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