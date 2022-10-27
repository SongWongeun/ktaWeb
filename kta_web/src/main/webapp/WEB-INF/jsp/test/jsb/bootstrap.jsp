<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="navbar navbar-top navbar-inverse">
    <div class="navbar-inner">
      <div class="container-fluid">

        <a class="brand" href="#;">Core Admin</a>

        <!-- the toggle buttons. notice the data-targets on them, they point to the topbar/sidebar -->

        <ul class="nav pull-right">
          <li class="toggle-primary-sidebar hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-primary"><a><i class="icon-th-list"></i></a></li>
          <li class="collapsed hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-top"><a><i class="icon-align-justify"></i></a></li>
        </ul>

        <div class="nav-collapse nav-collapse-top">

          <ul class="nav full pull-right">
            <li class="dropdown user-avatar">

              <!-- the dropdown has a custom user-avatar class, this is the small avatar with the badge -->

              <a href="#;" class="dropdown-toggle" data-toggle="dropdown">
                  <span>
                    <img class="menu-avatar" src="images/avatars/avatar1.jpg" /> <span>John Smith <i class="icon-caret-down"></i></span>
                    <span class="badge badge-dark-red">5</span>
                  </span>
              </a>

              <ul class="dropdown-menu">

                <!-- the first element is the one with the big avatar, add a with-image class to it -->

                <li class="with-image">
                  <div class="avatar">
                    <img src="images/avatars/avatar1.jpg" />
                  </div>
                  <span>John Smith</span>
                </li>
              </ul>
            </li>
          </ul>

          <!-- the bootstrap search bar has an optional animated class, that makes it grow when you click on it -->

          <form class="navbar-search pull-right">
            <input type="text" class="search-query animated" placeholder="Search">
            <i class="icon-search"></i>
          </form>

          ...
        </div>
      </div>
    </div>
  </div>
</body>
</html>