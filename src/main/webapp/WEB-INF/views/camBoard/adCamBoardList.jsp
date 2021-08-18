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
  	
  	.form-control{
  		width: 160px;
  		height: 30px;
  		font-size:13px;
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
        <a class="nav-link" href="/adGoods/list">
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
        <a class="nav-link" href="/adExGoods/list">
        <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 내역 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBootstrap"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <span>Bootstrap UI</span>
        </a>
        <div id="collapseBootstrap" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Bootstrap UI</h6>
            <a class="collapse-item" href="alerts.html">Alerts</a>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="dropdowns.html">Dropdowns</a>
            <a class="collapse-item" href="modals.html">Modals</a>
            <a class="collapse-item" href="popovers.html">Popovers</a>
            <a class="collapse-item" href="progress-bar.html">Progress Bars</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
          aria-controls="collapseForm">
          <i class="fab fa-fw fa-wpforms"></i>
          <span>Forms</span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Forms</h6>
            <a class="collapse-item" href="form_basics.html">Form Basics</a>
            <a class="collapse-item" href="form_advanceds.html">Form Advanceds</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTable" aria-expanded="true"
          aria-controls="collapseTable">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span>
        </a>
        <div id="collapseTable" class="collapse" aria-labelledby="headingTable" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Tables</h6>
            <a class="collapse-item" href="simple-tables.html">Simple Tables</a>
            <a class="collapse-item" href="datatables.html">DataTables</a>
          </div>
        </div>
      </li>

      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Examples
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage" aria-expanded="true"
          aria-controls="collapsePage">
          <i class="fas fa-fw fa-columns"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Example Pages</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span>
        </a>
      </li>
      <hr class="sidebar-divider">
      <div class="version" id="version-ruangadmin"></div>
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
            <h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
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
                  <a href="/adCamBoard/list" class="btn btn-sm btn-primary">전체 보기</a>
                  <a href="/adCamBoard/ing" class="btn btn-sm btn-primary">진행 중인 캠페인</a>
                  <a href="/adCamBoard/finish" class="btn btn-sm btn-primary">종료한 캠페인</a>
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

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">캠페인 관리 ${page.search_type}</th>
			<td><button class="btn-dark" type="button" onClick="location.href='/adCamBoard/insert'">캠페인 추가</button></td></tr>
		</thead>
	</table><br>
	
	<div>
		<ul style="text-align: left;">
			<c:if test="${empty page.search}">
			<li><a href="/adCamBoard/list?arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=end" id="end">캠페인 종료</a></li><br>
			<li><a href="/adCamBoard/list?arr=${page.arr}&order=desc" id="desc">최신순</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list?arr=${page.arr}&order=asc" id="asc">오래된순</a></li>
			</c:if>
			<c:if test="${!empty page.search}">
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=entire" id="entire">캠페인 전체</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=doing" id="doing">캠페인 중</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=end" id="end">캠페인 종료</a></li><br>
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=${page.arr}&order=desc" id="desc">최신순</a></li>&nbsp;&nbsp;&nbsp;
			<li><a href="/adCamBoard/list/search?search=${page.search}&search_type=${page.search_type}&arr=${page.arr}&order=asc" id="asc">오래된순</a></li>
			</c:if>
		</ul>
	
		<div style="text-align: right;">		
			<select id="search_type">
				<option value="CAMB_ENTIRE">전체검색</option>
				<option value="CAMB_NAME">제목검색</option>
				<option value="CAMB_SUBJECT">주제검색</option>
				<option value="CAMB_CONTENT">내용검색</option>
			</select>
			<input type="text" id="search" placeholder="캠페인 검색"  value="${page.search}">
			<input type="button" value="검색" onclick="searchUrl()">
		</div>

	</div>
		
	<div class="row">
		<div class="col-sm-12">
			<c:if test="${page.totalcount ne 0}">
			<table class="goodsTable">
			<tr>
				<th scope="col">캠페인번호</th>
				<th scope="col">캠페인사진</th>
				<th scope="col">캠페인이름</th>
				<th scope="col">캠페인주제</th>
				<th scope="col">캠페인내용</th>
			</tr>
			
				<c:forEach items="${CamBoardList}" var="list">
					<tr onclick="location.href='/adCamBoard/detail?CAMB_NUM=${list.CAMB_NUM}'">
						<td>${list.CAMB_NUM}</td>
						<td class="camBoardImg"><img src="${list.CAMB_FILE}" width="150" alt="캠페인" title="${list.CAMB_NAME} 이미지"/></td>
						<td>${list.CAMB_NAME}</td>
						<td>${list.CAMB_SUBJECT}</td>
						<td><c:set var = "CAMB_CONTENT" value="${list.CAMB_CONTENT}"/>
						${fn.substring(CAMB_CONTENT,0,20)}
						${liat.CAMB_CONTENT}
						</td>
					</tr>
				</c:forEach>
			</table>
			</c:if>
			<c:if test="${page.totalcount eq 0}">
				<div><h2 style="text-align: center;">'${page.search}'에 대한 검색 결과가 없습니다.</h2></div>
			</c:if>	
		</div>
	</div>
	<c:if test="${page.totalcount ne 0}">
	<div class="row">
	<div class="col-sm-12">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;">
					<c:if test="${page.prev}">
						<a href="?pagenum=${page.getStartPage()-1}">&lt;</a>
					</c:if>&nbsp;
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a href="?pagenum=${idx}">${idx}&nbsp;</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a href="?pagenum=${page.getEndPage()+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table><br/>
	</div>
	</div>
	</c:if>
	<c:if test="${page.totalcount eq 0}">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;"></td>
			</tr>
		</table><br/>
	</c:if>
</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
	window.onload = function(){
		var search_type = "${page.search_type}";
		
		$('select[id="search_type"]').find('option:contains(search_type)').attr("selected",true);
		
		var obj = document.getElementsByName("search_type");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] !== search_type){
	            obj[i].checked = false;
	        }else if(obj[i] === search_type){
	        	obj[i].checked = true;
	        }
	    }
	}
	
   function changepage(){
       location.href="file:///Users/gimjeongbin/Desktop/finalproject/camBoardDetail.html";
   }
   
   function searchUrl(){
	   
	   var search = document.getElementById("search").value;
	   var search_type = document.getElementById("search_type");
	   search_type = search_type.options[search_type.selectedIndex].value;
	   
	   location.href="/adCamBoard/list/search?search=" + search + "&search_type=" + search_type;
   }
	
   $.urlParam = function(name){
	   const results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
   
</script>
</body>

</html>