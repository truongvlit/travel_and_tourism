<%@page import="truongvl.dtos.TicketDTO"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath();%>/
        <link rel="stylesheet" href="<%= path%>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path%>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist - Your Purchase</title>
    </head>
    <body>
        <%@include file="admin-navbar.jsp" %>
        <%@include file="admin-left-sidebar.jsp" %>
        <%
            List<TicketDTO> list = (List) request.getAttribute("list");
        %>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">View Tickets</h2>                                    
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
                                                        <th class="border-0">TicketID</th>                                                        
                                                        <th class="border-0">TourID</th>
                                                        <th class="border-0">TouristID</th>
                                                        <th class="border-0">Book Date</th>
                                                        <th class="border-0">Ticket Price</th>
                                                        <th class="border-0">Booked By</th>
                                                        <th class="border-0">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (TicketDTO ticket : list) {
                                                    %> 
                                                    <tr>
                                                        <td><%= ++count%></td>
                                                        <td><%= ticket.getTicketId()%></td>                                                        
                                                        <td><%= ticket.getTourId()%></td>
                                                        <td><%= ticket.getTouristId()%></td>
                                                        <td><%= ticket.getBookDate()%></td>
                                                        <td><%= ticket.getPrice()%></td>
                                                        <td><%= ticket.getBookedBy()%></td>
                                                        <td>
                                                            <form action="TicketMainController" action="POST">
                                                                <input type="hidden" name="ticketId" value="<%= ticket.getTicketId()%>">                                                                
                                                                <input type="submit" name="action" value="Check" class="btn btn-outline-danger"></input>
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
                        %>
                        <a href="<%= request.getContextPath()%>/LoadTicketController?page=<%= i + 1%>"><button class="btn btn-outline-info" style="margin-right: 5px; margin-bottom: 30px;"><%= i + 1%></button></a>
                            <%
                                    }
                                }
                            %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%= path%>/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="<%= path%>/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="<%= path%>/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
</body>
</html>