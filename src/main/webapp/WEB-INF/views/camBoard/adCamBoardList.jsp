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
        <i class="fas fa-desktop"></i>
          <span>관리자 메인</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adMember/list">
        <i class="fas fa-user"></i>
          <span>회원 관리</span>
        </a>
      </li>
      <li class="nav-item  active">
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
			<jsp:include page="/WEB-INF/views/adHeader.jsp"/>
        <!-- Topbar -->
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">캠페인 관리</h1>
          </div>

          <!-- Row -->
          <div class="row">
          
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">전체 캠페인</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${camTotal}개</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-hourglass fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">진행 중인 캠페인</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${camIng}개</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-hourglass-half fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">종료한 캠페인</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${camFinish}개</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-hourglass-end fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="table-responsive p-3">
                  <a href="/adCamBoard/list" class="btn btn-sm btn-primary">전체 보기</a>
                  <a href="/adCamBoard/ing" class="btn btn-sm btn-primary">진행 중인 캠페인</a>
                  <a href="/adCamBoard/finish" class="btn btn-sm btn-primary">종료한 캠페인</a>
                  <a href="/adCamBoard/insert" class="btn btn-sm btn-primary"><i class="fas fa-plus"></i>&nbsp;&nbsp;캠페인 추가</a>
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>캠패인 번호</th>
                        <th>캠패인 이름</th>
                        <th>캠패인 주제</th>
                        <th>캠패인 등록 날짜</th>
                        <th>캠패인 시작 날짜</th>
                        <th>캠패인 종료 날짜</th>
                      </tr>
                    </thead>
					<tbody>
					<c:if test="${not empty CamBoardList}">
                    	<c:forEach items="${CamBoardList}" var="list">
                      	<tr onclick="location.href='/adCamBoard/detail?CAMB_NUM=${list.CAMB_NUM}'">
                        	<td>${list.CAMB_NUM}</td>
                        	<td>${list.CAMB_NAME}</td>
                        	<td>${list.CAMB_SUBJECT}</td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_DATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_STARTDATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_FINDATE}" /></td>
                      	</tr>
                     	</c:forEach>
                     </c:if>
                     <c:if test="${not empty CamBoardIngList}">
                    	<c:forEach items="${CamBoardIngList}" var="list">
                      	<tr onclick="location.href='/adCamBoard/detail?CAMB_NUM=${list.CAMB_NUM}'">
                        	<td>${list.CAMB_NUM}</td>
                        	<td>${list.CAMB_NAME}</td>
                        	<td>${list.CAMB_SUBJECT}</td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_DATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_STARTDATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_FINDATE}" /></td>
                      	</tr>
                     	</c:forEach>
                     </c:if>
                     <c:if test="${not empty CamBoardFinishList}">
                    	<c:forEach items="${CamBoardFinishList}" var="list">
                      	<tr onclick="location.href='/adCamBoard/detail?CAMB_NUM=${list.CAMB_NUM}'">
                        	<td>${list.CAMB_NUM}</td>
                        	<td>${list.CAMB_NAME}</td>
                        	<td>${list.CAMB_SUBJECT}</td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_DATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_STARTDATE}" /></td>
                        	<td><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="${list.CAMB_FINDATE}" /></td>
                      	</tr>
                     	</c:forEach>
                     </c:if>
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