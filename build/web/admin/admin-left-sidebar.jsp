<div class="nav-left-sidebar sidebar-dark">
    <div class="menu-list">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav flex-column">
                    <li class="nav-divider">
                        Menu
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3">
                            <i class="fas fa-plane"></i>Tour Management
                        </a>
                        <div id="submenu-3" class="collapse submenu" style="">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="<%= request.getContextPath()%>/TourMainController?action=Search">View Tour</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<%= request.getContextPath()%>/admin/tour/admin-insert-tour.jsp">Insert Tour</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= request.getContextPath()%>/TicketMainController?action=Load"><i class="fas fa-bookmark"></i>Dashboard</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= request.getContextPath()%>/AccountMainController?action=Edit"><i class="fas fa-user"></i>Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath()%>/admin/update-password.jsp"><i class="fas fa-key"></i>Change Password</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= request.getContextPath()%>/AccountMainController?action=Logout"><i class="fas fa-backward"></i>Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>