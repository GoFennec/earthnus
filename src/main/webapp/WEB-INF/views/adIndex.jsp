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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
  <style type="text/css">
  	#more{
  		background-color:#66bb6a;
  		color:white;
  	}
  	tr,td{
  		text-align:center;
  	}
  	#h6{
  		margin-top:20px;
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
      <li class="nav-item active">
        <a class="nav-link" href="/adIndex">
        <i class="fas fa-desktop"></i>
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
          <span>후원 관리</span>
        </a>
      </li>
      <li class="nav-item">
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
        <a class="nav-link" href="/adChart">
        <i class="fas fa-fw fa-chart-area"></i>
          <span>통계</span>
        </a>
      </li>
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
			<jsp:include page="adHeader.jsp"/>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">관리자 메인</h1>
          </div>

          <div class="row mb-3">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <h6 class="m-0 font-weight-bold">오늘의 후원 금액</h6>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${sumPay}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-hand-holding-heart fa-2x text-info"></i>
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
                      <h6 class="m-0 font-weight-bold">오늘 가입한 회원</h6>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">${countMember}명</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-info"></i>
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
                      <h6 class="m-0 font-weight-bold">오늘 주문한 지구 마켓</h6>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="h6">${orderExGoods}건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-cart fa-2x text-info"></i>
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
                      <h6 class="m-0 font-weight-bold">오늘의 방문</h6>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">${todayVisitor}명</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-door-open fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			
            <!-- Invoice Example -->
            <div class="col-xl-6 col-lg-6 mb-4">
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <i class="fas fa-hand-holding-heart"></i>
                  <h6 class="m-0 font-weight-bold">포인트 적립 대기 중인 후원</h6>
                  <a class="m-0 float-right btn btn btn-sm" id="more" href="/adDonation/list">바로 가기 
                  <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                      	<th>후원<br>번호</th>
                        <th>아이디</th>
                        <th>결제<br>상품</th>
                        <th>후원<br>금액</th>
                        <th>후원<br>날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adPay}" var="adPayList">
                      <tr>
                      	<td>${adPayList.pay_no}</td>
                        <td>${adPayList.pay_id}</td>
                        <td>${adPayList.pay_dname}</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${adPayList.pay_price}"/></td>
                        <td>${adPayList.pay_pdate}</td>
                      </tr>
                     </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            
            <!-- Invoice Example -->
            <div class="col-xl-6 col-lg-6 mb-4">
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <i class="fas fa-shopping-cart"></i>
                  <h6 class="m-0 font-weight-bold">배송 대기 중인 주문</h6>
                  <a class="m-0 float-right btn btn btn-sm" id="more" href="/adExGoods/oList">바로 가기 
                  <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                      	<th>주문<br>번호</th>
                        <th>아이디</th>
                        <th>결제<br>상품</th>
                        <th>결제<br>날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adGoods}" var="adGoodsList">
                      <tr>
                        <td>${adGoodsList.exg_num}</td>
                        <td>${adGoodsList.exg_id}</td>
                        <td>${adGoodsList.exg_gname}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${adGoodsList.exg_pdate}" /></td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            
                        <!-- Invoice Example -->
            <div class="col-xl-6 col-lg-6 mb-4">
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <i class="fas fa-comments"></i>
                  <h6 class="m-0 font-weight-bold">최근 작성한 응원릴레이</h6>
                  <a class="m-0 float-right btn btn btn-sm" id="more" href="adCheBoard/list">바로 가기 
                  <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                        <th>응원<br>번호</th>
                        <th>아이디</th>
                        <th>카테고리</th>
                        <th>작성<br>날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adCheboard}" var="adCheboardList">
                      <tr>
                        <td>${adCheboardList.cheb_num}</td>
                        <td>${adCheboardList.cheb_id}</td>
                        <td>${adCheboardList.cheb_dname}</td>
                        <td>${adCheboardList.cheb_date}</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            
                        <div class="col-xl-6 col-lg-6 mb-4">
              <div class="card">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <i class="fas fa-peace"></i>
                  <h6 class="m-0 font-weight-bold">현재 진행 중인 캠페인</h6>
                  <a class="m-0 float-right btn btn btn-sm" id="more" href="/adCamBoard/list">바로 가기 
                  <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="table-responsive">
                  <table class="table align-items-center table-flush">
                    <thead class="thead-light">
                      <tr>
                      	<th>캠페인<br>번호</th>
                        <th>캠페인<br>이름</th>
                        <th>캠페인<br>주제</th>
                        <th>시작<br>날짜</th>
                        <th>종료<br>날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adCamboard}" var="adCamboardList">
                      <tr>
                        <td>${adCamboardList.CAMB_NUM}</td>
                        <td>${adCamboardList.CAMB_NAME}</td>
                        <td>${adCamboardList.CAMB_SUBJECT}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${adCamboardList.CAMB_STARTDATE}" /></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${adCamboardList.CAMB_FINDATE}" /></td>
                      </tr>
                    </c:forEach>  
                    </tbody>
                  </table>
                </div>
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

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.min.js"></script>
  <script src="/resources/assets/js/ruang-admin.min.js"></script>
  <script src="/resources/assets/js/Chart.min.js"></script>
  <script src="/resources/assets/js/chart-area-demo.js"></script>
  
</body>

</html>