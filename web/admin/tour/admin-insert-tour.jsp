<%@page import="truongvl.dtos.TourErrorObject"%>
<%@page import="truongvl.dtos.TourDTO"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <% String path = request.getContextPath();%>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist - Admin</title>
    </head>
    <body>
        <%@include file="../admin-navbar.jsp" %>
        <%@include file="../admin-left-sidebar.jsp" %>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Add Tour</h2>                                    
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
                        TourDTO dto = (TourDTO) request.getAttribute("DTO");
                        if (dto == null) {
                            dto = new TourDTO();
                        }
                        TourErrorObject errorObj = (TourErrorObject) request.getAttribute("errorObj");
                        String success = (String) request.getAttribute("SUCCESS");
                        String duplicate = (String) request.getAttribute("duplicate");
                        String categoryError = null, nameError = null,
                                destinationError = null, descriptionError = null,
                                startTimeError = null, endTimeError = null,
                                infantPriceError = null, childPriceError = null,
                                adultPriceError = null, seatError = null, imageError = null;
                        if (errorObj != null) {
                            categoryError = errorObj.getCategoryError();
                            nameError = errorObj.getNameError();
                            destinationError = errorObj.getDestinationError();
                            descriptionError = errorObj.getDescriptionError();
                            startTimeError = errorObj.getStartTimeError();
                            endTimeError = errorObj.getEndTimeError();
                            infantPriceError = errorObj.getInfantPriceError();
                            childPriceError = errorObj.getChildPriceError();
                            adultPriceError = errorObj.getAdultPriceError();
                            seatError = errorObj.getSeatError();
                            imageError = errorObj.getImageError();
                        }
                    %>
                    <%
                        if (success != null) {
                    %>
                    <div class="row alert-success" style="margin: auto; width: 300px; margin-top: -30px;">
                        <div class="" style="text-align: justify; margin: auto"><%= success %></div>
                    </div>
                    <%
                        }
                        if (duplicate != null) {
                    %>
                    <div class="row alert-danger" style="margin: auto; width: 300px; margin-top: -30px;">
                        <div class="" style="text-align: justify; margin: auto"><%= duplicate %></div>
                    </div>
                    <%
                        }
                    %>
                    <form action="<%= path%>/TourMainController" method="POST">
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Category</span>
                                </div>
                                <input type="text" class="form-control input" name="txtCategory" placeholder="Enter category" style="font-size: 15px;" value="<%= dto.getCategory() == null ? "" : dto.getCategory()%>">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Name</span>
                                </div>
                                <input type="text" class="form-control input" name="txtName" placeholder="Enter name" style="font-size: 15px;" value="<%= dto.getName() == null ? "" : dto.getName()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <%
                                    if (categoryError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= categoryError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-xl-6">
                                <%
                                    if (nameError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= nameError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Start time</span>
                                </div>
                                <input type="date" class="form-control input" name="txtStartTime" placeholder="Enter start time" style="font-size: 15px;" value="<%= dto.getStartTime() == null ? "" : dto.getStartTime()%>">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">End time</span>
                                </div>
                                <input type="date" class="form-control input" name="txtEndTime" placeholder="Enter end time" style="font-size: 15px;" value="<%= dto.getEndTime() == null ? "" : dto.getEndTime()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <%
                                    if (startTimeError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= startTimeError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-xl-6">
                                <%
                                    if (endTimeError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= endTimeError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-12">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Destination</span>
                                </div>
                                <input type="text" class="form-control input" name="txtDestination" placeholder="Enter destination" style="font-size: 15px;
                                       display: flex; justify-content: center;" value="<%= dto.getDestination() == null ? "" : dto.getDestination()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <%
                                    if (destinationError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= destinationError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Infant price</span>
                                </div>
                                <input type="text" class="form-control input" name="txtInfantPrice" placeholder="Enter ticket price for infant" style="font-size: 15px;" value="<%= dto.getInfantPrice() == null ? "" : dto.getInfantPrice()%>">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Child price</span>
                                </div>
                                <input type="text" class="form-control input" name="txtChildPrice" placeholder="Enter ticket price for child" style="font-size: 15px;" value="<%= dto.getChildPrice() == null ? "" : dto.getChildPrice()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <%
                                    if (infantPriceError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= infantPriceError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-xl-6">
                                <%
                                    if (childPriceError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= childPriceError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Adult price</span>
                                </div>
                                <input type="text" class="form-control input" name="txtAdultPrice" placeholder="Enter ticket price for adult" style="font-size: 15px;"  value="<%= dto.getAdultPrice() == null ? "" : dto.getAdultPrice()%>">
                            </div>
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Seat</span>
                                </div>
                                <input type="text" class="form-control input" name="txtSeatAvailable" placeholder="Enter available seat" style="font-size: 15px;"  value="<%= dto.getSeatAvailable() == null ? "" : dto.getSeatAvailable()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <%
                                    if (adultPriceError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= adultPriceError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-xl-6">
                                <%
                                    if (seatError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= seatError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-12">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Description</span>
                                </div>
                                <textarea rows="10" class="form-control input" name="txtDescription" style="font-size: 15px;"><%= dto.getDescription() == null ? "" : dto.getDescription() %></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <%
                                    if (descriptionError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div class="" style="text-align: justify; margin: auto"><%= descriptionError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="font-size: 15px; display: flex; justify-content: center; width: 100px;">Image</span>
                                </div>
                                <input type="file" class="input btn btn-brand-link" name="txtImage" accept="image/png, image/jpeg, image/jpg" style="font-size: 15px;">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <%
                                    if (imageError != null) {
                                %>
                                <div class="row alert-danger" style="margin: auto; width: 465px; margin-top: -10px;">
                                    <div style="text-align: justify; margin: auto"><%= imageError%></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-xl-12"  style="display: flex; justify-content: center;">
                                <input type="submit" class="btn btn-outline-primary" name="action" value="Insert" style="width: 80px; height: 50px; margin-top: 20px;"/>
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