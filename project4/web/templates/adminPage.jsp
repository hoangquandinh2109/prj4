<%-- 
    Document   : adminIndex
    Created on : Apr 19, 2019, 7:20:11 PM
    Author     : bemap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <header class="app-header"><a class="app-header__logo" href="index.jsp">Cang cu Cot</a>
                <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
                <!-- Navbar Right Menu-->
                <ul class="app-nav">
                  <li class="app-search">
                    <input class="app-search__input" type="search" placeholder="Search">
                    <button class="app-search__button"><i class="fa fa-search"></i></button>
                  </li>
                  <!--Notification Menu-->
                  <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell"></i></a>
                    <ul style="width:250px" class="app-notification dropdown-menu dropdown-menu-right">
                      <li class="app-notification__title">You have 4 new notifications.</li>
                      <div class="app-notification__content">
                        <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                            <div>
                              <p class="app-notification__message">Lisa sent you a mail</p>
                              <p class="app-notification__meta">2 min ago</p>
                            </div></a></li>
                        <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                            <div>
                              <p class="app-notification__message">Mail server not working</p>
                              <p class="app-notification__meta">5 min ago</p>
                            </div></a></li>
                        <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                            <div>
                              <p class="app-notification__message">Transaction complete</p>
                              <p class="app-notification__meta">2 days ago</p>
                            </div></a></li>
                        <div class="app-notification__content">
                          <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                              <div>
                                <p class="app-notification__message">Lisa sent you a mail</p>
                                <p class="app-notification__meta">2 min ago</p>
                              </div></a></li>
                          <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                              <div>
                                <p class="app-notification__message">Mail server not working</p>
                                <p class="app-notification__meta">5 min ago</p>
                              </div></a></li>
                          <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                              <div>
                                <p class="app-notification__message">Transaction complete</p>
                                <p class="app-notification__meta">2 days ago</p>
                              </div></a></li>
                        </div>
                      </div>
                      <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
                    </ul>
                  </li>
                  <!-- User Menu-->
                  <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
                    <ul class="dropdown-menu settings-menu dropdown-menu-right">
                      <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
                      <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
                      <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                    </ul>
                  </li>
                </ul>
              </header>
              <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/img/userAvatar/adminAvatar.jpg" width="48px" height="48px" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Mr ??</p>
          <p class="app-sidebar__user-designation">CCC's Developer</p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item active" href="index.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li><a class="app-menu__item" href="#"><i class="app-menu__icon fas fa-chart-pie-alt"></i><span class="app-menu__label">Charts</span></a></li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">Staff</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="insertStaff.jsp"><i class="icon far fa-dot-circle"></i>Create Staff</a></li>
            <li><a class="treeview-item" href="#" target="_blank" rel="noopener"><i class="icon far fa-dot-circle"></i>Staff Management</a></li>

          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">Product</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/showCatServlet"><i class="icon far fa-dot-circle"></i>Create new Product</a></li>
            <li><a class="treeview-item" href="${pageContext.request.contextPath}/showProductServlet"><i class="icon far fa-dot-circle"></i>List Product</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Order Management</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Category</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Type</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon far fa-gift"></i><span class="app-menu__label">Event</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Create Event</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Management Event</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-user fa-lg"></i><span class="app-menu__label">User</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="../testServlet"><i class="icon far fa-dot-circle"></i>User List</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Feedback</a></li>
            <li><a class="treeview-item" href="#"><i class="icon far fa-dot-circle"></i>Mailbox</a></li>
            
          </ul>
        </li>
      </ul>
    </aside>
   
    
    
    <!-- The javascript plugin to display page loading on top-->
   
