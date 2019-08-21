<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/home">NeroTourist</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="<%= request.getContextPath() %>/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/destinations" class="nav-link">Destinations</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/terms.jsp" class="nav-link">Terms</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/contact.jsp" class="nav-link">Contact</a></li>
                <%
                    String accountInfo = (String) session.getAttribute("accountInfo");
                    if (accountInfo == null) {
                %>                    
                    <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                <%
                    } else {
                %>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown nav-user">
                                <a class="nav-link" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="nav-item">
                                        <span class="icon-user"></span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                    <div class="nav-user-info">
                                        <div class="mb-0 nav-user-name d-flex justify-content-center"><b><%= accountInfo %></b></div>
                                    </div>
                                    <a class="dropdown-item" href="AccountMainController?action=Edit"><i class="fas fa-user mr-2"></i>Account</a>
                                    <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                    <a class="dropdown-item" href="AccountMainController?action=Logout"/>                                        
                                        <i class="fas fa-power-off mr-2"></i>Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>