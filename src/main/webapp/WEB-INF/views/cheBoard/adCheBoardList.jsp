<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>EARTH & US ADMIN</title>
  <link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link href="/resources/assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
  <style type="text/css">
  	label{
  		margin-top:1rem;
  	}
  	
  	th,td{
  		text-align:center;
  	}
  	.btn btn-sm btn-primary{
  		font-color:#6777EF;
  	}
  </style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adIndex">
        <div class="sidebar-brand-icon">
          <img src="/resources/assets/img/logo/logo2_footer.png">
        </div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item">
        <a class="nav-link" href="/adIndex">
        <i class="fas fa-fw fa-chart-area"></i>
          <span>관리자 메인</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adMember/list">
        <i class="fas fa-user"></i>
          <span>회원 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adCamBoard/list">
        <i class="fas fa-peace"></i>
          <span>캠페인 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adDonation/list">
        <i class="fas fa-hand-holding-heart"></i>
          <span>기부 관리</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/adCheBoard/list">
        <i class="fas fa-comments"></i>
          <span>응원릴레이 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adGoods/list">
        <i class="fas fa-gift"></i>
          <span>지구마켓 상품 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
          aria-controls="collapseForm">
          <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 주문 관리</span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/adExGoods/oList">주문 목록</a>
            <a class="collapse-item" href="/adExGoods/dList">배송 처리 목록</a>
            <a class="collapse-item" href="/adExGoods/aList">주문 승인 내역</a>
            <a class="collapse-item" href="/adExGoods/cList">주문취소내역</a>
          </div>
        </div>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item">
        <a class="nav-link" href="/adDonation/list">
        <i class="fas fa-fw fa-chart-area"></i>
          <span>통계</span>
        </a>
      </li>
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
          <ul class="navbar-nav ml-auto">
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-address-card"></i>
                <span class="ml-2 d-none d-lg-inline text-white small">Maman Ketoprak</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- Topbar -->
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">응원릴레이 관리</h1>
          </div>

          <!-- Row -->
          <div class="row">
          
                      <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Earnings (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                        <span>Since last month</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-primary"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Sales</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">650</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                        <span>Since last years</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-cart fa-2x text-success"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">New User</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">366</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 20.4%</span>
                        <span>Since last month</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">Pending Requests</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                        <span>Since yesterday</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary"></h6>
                </div>
                <div class="table-responsive p-3">
                <div class="row">
                <div class="col-sm-12 col-md-6"></div>
                <div class="col-sm-12 col-md-6" style="text-align:right;">
                  <a href="" class="btn btn-sm btn-primary" id="cancel" style="background-color:#fc544b;border-color:#fc544b;">응원 삭제</a>
                </div>
                </div>
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>응원 번호</th>
                        <th>응원 내용</th>
                        <th>작성자 ID</th>
                        <th>작성자 이름</th>
                        <th>작성 날짜</th>
                      </tr>
                    </thead>
					<tbody>
                    	<c:forEach items="${CheBoard}" var="list">
                      	<tr class="cheInfo" id="${list.cheb_num}">
                      		<td>${list.cheb_num}</td>
                        	<td>${list.cheb_content}</td>
                        	<td>${list.cheb_id}</td>
                        	<td>${list.cheb_name}</td>
                        	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.cheb_date}" /></td>
                      	</tr>
                     	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->

          <!-- Modal Logout -->
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                  <a href="login.html" class="btn btn-primary">Logout</a>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!---Container Fluid-->
      </div>

      <!-- Footer -->
      <!-- Footer -->
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.min.js"></script>
  <script src="/resources/assets/js/ruang-admin.min.js"></script>
  <!-- Page level plugins -->
  <script src="/resources/assets/js/jquery.dataTables.min.js"></script>
  <script src="/resources/assets/js/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>

</body>

</html>