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
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= request.getContextPath() %>/AccountMainController?action=Edit"><i class="fas fa-user"></i>Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/SearchPurchasedTicketController"><i class="fas fa-cart-plus"></i>Your Purchase</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/user/update-password.jsp"><i class="fas fa-key"></i>Change Password</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="<%= request.getContextPath() %>/LogoutAccountController"><i class="fas fa-backward"></i>Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>