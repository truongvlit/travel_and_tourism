<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath(); %>
        <link rel="stylesheet" href="<%= path %>/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= path %>/assets/vendor/fonts/circular-std/style.css">
        <link rel="stylesheet" href="<%= path %>/assets/libs/css/style.css">
        <link rel="stylesheet" href="<%= path %>/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>NeroTourist</title>
    </head>
    <body>
        <div class="dashboard-main-wrapper">
            <div class="dashboard-header">
            <%@include file="account-navbar.jsp" %>
            <%@include file="account-left-sidebar.jsp" %>
            <div class="dashboard-wrapper">
                <div class="dashboard-ecommerce">
                    <div class="container-fluid dashboard-content ">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header">
                                    <h2 class="pageheader-title">Welcome ${sessionScope.accountInfo}!</h2>                                    
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
                    </div>
                </div>
            </div>
        </div>
        <script src="<%= path %>/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="<%= path %>/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="<%= path %>/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <script src="<%= path %>/assets/libs/js/main-js.js"></script>
    </body>

</html>