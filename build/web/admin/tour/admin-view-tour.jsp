<%@page import="truongvl.dtos.TourDTO"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath(); %>/
        <link rel="stylesheet" href="<%= path %>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path %>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path %>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path %>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist - Admin</title>
    </head>
    <body>
        <%@include file="../admin-navbar.jsp" %>
        <%@include file="../admin-left-sidebar.jsp" %>
        <%
            List<TourDTO> list = (List) request.getAttribute("list");
            String search = (request.getParameter("txtSearch") == null || request.getParameter("txtSearch").equals("null")) ? "" : request.getParameter("txtSearch");
        %>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">View Tour</h2>                                    
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
                    <div class="ecommerce-widget">                       
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="display: flex; justify-content: center;">
                                <form action="TourMainController" method="POST">
                                    <div class="h5" style="margin-left: 15px; margin-bottom: 40px; ">Search
                                        <input type="text" name="txtSearch" style="margin-left: 10px; margin-right: 20px; width: 500px;" value="<%= (search.isEmpty()) ? "" : request.getParameter("txtSearch")%>"/>
                                        <input class="btn btn-info" type="submit" name="action" value="Search"/>
                                    </div>
                                </form>
                            </div>
                        </div>                            
                        <%
                            if (list.isEmpty()) {
                        %>
                        <div class="row">
                            <font color="red" style="margin-left: 15px; font-size: 20px;">No record found!</font>
                        </div>
                        <%
                        } else {
                            int count = (int) request.getAttribute("count");
                            int maxPages = (int) request.getAttribute("maxPages");
                        %>
                        <!-- =============================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Tour Available</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table" style="text-align: center">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">#</th>
                                                        <th class="border-0">Category</th>                                                        
                                                        <th class="border-0">Tour Name</th>
                                                        <th class="border-0">Start Time</th>
                                                        <th class="border-0">End Time</th>
                                                        <th class="border-0">Destination</th>
                                                        <th class="border-0">Infant ($)</th>
                                                        <th class="border-0">Child ($)</th>
                                                        <th class="border-0">Adult ($)</th>
                                                        <th class="border-0">Seat Remaining</th>
                                                        <th class="border-0">Delete</th>
                                                        <th class="border-0">Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (TourDTO tour : list) {
                                                    %> 
                                                    <tr>
                                                        <td><%= ++count%></td>
                                                        <td><%= tour.getCategory()%></td>                                                        
                                                        <td><%= tour.getName()%></td>
                                                        <td><%= tour.getStartTime()%></td>
                                                        <td><%= tour.getEndTime()%></td>
                                                        <td><%= tour.getDestination()%></td>
                                                        <td><%= tour.getInfantPrice()%></td>
                                                        <td><%= tour.getChildPrice()%></td>
                                                        <td><%= tour.getAdultPrice()%></td>
                                                        <td><%= tour.getSeatAvailable()%></td>
                                                        <td>
                                                            <form action="TourMainController" action="POST">
                                                                <input type="hidden" name="TourId" value="<%= tour.getId()%>">
                                                                <input type="submit" name="action" value="Delete" class="btn btn-outline-danger"></input>
                                                            </form>
                                                        </td>
                                                        <td>
                                                            <form action="TourMainController" action="POST">
                                                                <input type="hidden" name="tourId" value="<%= tour.getId()%>">
                                                                <input type="submit" name="action" value="Edit" class="btn btn-outline-warning"></input>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--===========================-->
                    <!--===========================-->
                    <div style="display: flex; justify-content: center" id="pagination">
                        <%
                            for (int i = 0; i <= maxPages; i++) {
                                if (search.isEmpty()) {
                        %>
                        <a href="<%= request.getContextPath()%>/SearchTourController?page=<%= i + 1%>"><button class="btn btn-outline-info" style="margin-right: 5px; margin-bottom: 30px;"><%= i + 1%></button></a>
                            <%
                            } else {
                            %>
                        <a href="<%= request.getContextPath()%>/SearchTourController?page=<%= i + 1%>&txtSearch=<%= request.getParameter("txtSearch")%>"><button class="btn btn-outline-info" style="margin-right: 5px; margin-bottom: 30px;"><%= i + 1%></button></a>
                            <%
                                        }
                                    }
                                }
                            %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%= path %>/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="<%= path %>/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="<%= path %>/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
</body>
</html>