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
  		font-size: 0.8em;
  	}
  	.btn btn-sm btn-primary{
  		font-color:#6777EF;
  	}
  	.exGoodsTr {
  		cursor: pointer;
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
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adLogout2" title="회원 메인화면 바로가기">
        <div class="sidebar-brand-icon">
          <img src="/resources/assets/img/logo/logo2_footer.png" alt="회원 메인화면 바로가기">
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
        <div id="collapseForm" class="collapse show" aria-labelledby="headingForm" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item active" href="/adExGoods/oList">주문 목록</a>
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
            <h1 class="h3 mb-0 text-gray-800">지구마켓 주문 목록</h1>
          </div>

          <!-- Row -->
          <div class="row">
          
          <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="m-0 font-weight-bold">전체 주문 건 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">${countTotal}건</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span></span><br>
                        <span></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-list-alt fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
             <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="m-0 font-weight-bold">이번 달의 주문</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">${countMonthly}건</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span></span><br>
                        <span></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-info"></i>
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
                      <div class="m-0 font-weight-bold">배송 대기 중인 주문</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="h6">${countWaiting}건</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span></span><br>
                        <span></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="far fa-stop-circle fa-2x text-info"></i>
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
                      <div class="m-0 font-weight-bold">이번 달의 인기 제품</div>
                      <c:if test="${not empty countLanking}">
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6"><i class="fas fa-crown"></i> ${countLanking.get(0).getExg_gname()}(${countLanking.get(0).getCount()}개)</div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                      </div>
                      </c:if>
                      <c:if test="${empty countLanking}">
                      <div class="h5 mb-0 font-weight-bold text-gray-800" id="h6">없음</div>
                      </c:if>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-list-ol fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>결제 번호</th>
                        <th>아이디</th>
                        <th>주문 상태</th>
                        <th>상품 정보</th>
                        <th>사용 포인트</th>
                        <th>주문 날짜</th>
                        <th>배송 메세지</th>
                      </tr>
                    </thead>
					<tbody>
                    	<c:forEach items="${exGoodsList}" var="exGoods">
							<tr class="exGoodsTr" onclick="location.href='/adExGoods/detail?exg_num=${exGoods.exg_realnum}'">
								<td>${exGoods.exg_num}</td>
								<td>${exGoods.exg_id}</td>
								<td>${exGoods.exg_state}</td>
								<td>${exGoods.exg_gnum}(${exGoods.exg_gname})</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${exGoods.exg_point}"/> point</td>
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_pdate}"/></td>
								<td>${exGoods.exg_message}</td>
							</tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->


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