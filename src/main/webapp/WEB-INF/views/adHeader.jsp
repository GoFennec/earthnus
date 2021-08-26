<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>EARTH & US ADMIN</title>
</head>

<body id="page-top">
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
          <ul class="navbar-nav ml-auto">
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
<<<<<<< HEAD
				<i class="fas fa-address-card"></i>
                <span class="ml-2 d-none d-lg-inline text-white">${auth_id}</span>
              </a>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="auth/adLogin" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="ml-2 d-none d-lg-inline text-white">로그 아웃</span>
              </a>
=======
            <i class="fas fa-address-card"></i>
               &nbsp; ${auth.auth_id}님 환영합니다.
             </a>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="/adLogout" id="userDropdown" 
                aria-haspopup="true" aria-expanded="false">
               로그 아웃
              </a> 
>>>>>>> origin/kang
            </li>
          </ul>
        </nav>
        <!-- Topbar -->

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
      <!-- Footer -->
    </div>
</body>

</html>