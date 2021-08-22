<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>RuangAdmin - Form Basics</title>
  <link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
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
      <li class="nav-item">
        <a class="nav-link" href="/adIndex">
        <i class="fas fa-fw fa-chart-area"></i>
          <span>관리자 메인</span></a>
      </li>
      <li class="nav-item active">
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
        <a class="nav-link" href="/adExGoods/oList">
        <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 주문목록</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/adExGoods/dList">
        <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 배송처리목록</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/adExGoods/aList">
        <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 주문승인내역</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/adExGoods/cList">
        <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 주문취소내역</span>
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
            <h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
            <button type="button" class="btn btn-primary" style="margin:0px;background-color:#fc544b;border-color:#fc544b;" data-toggle="modal" data-target="#deleteModal">회원 삭제</button>
          </div>

          <div class="row">
            <div class="col-lg-6">
              <div class="card mb-4">
                <div class="card-body">
                    <div class="form-group">
                      <label for="exampleInputEmail1">아이디</label>
                      <input type="text" class="form-control" id="mem_id" value="${memberListDetail[0].mem_id}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">이메일</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail[0].mem_email}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">전화번호</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail[0].mem_tel}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">주소</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail[0].mem_addr}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">성별</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail[0].mem_gender}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">생일</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail[0].mem_birth}" readonly>
                    </div>
                </div>
              </div>
            </div>

            <div class="col-lg-6">
              <div class="card mb-4">
                <div class="card-body">
                    <div class="form-group">
                      <label for="exampleInputPassword1">이름</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail[0].mem_name}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">가입 날짜</label>
                      <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${memberListDetail[0].mem_date}" var="formatdate"/>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${formatdate}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">기부 횟수</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${payCount}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">기부 금액</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${payTotal}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">작성한 응원릴레이</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${cheerCount}"readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">포인트</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail[0].mem_point}" readonly>
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
          
          
          <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">${memberListDetail[0].mem_id} 회원을 삭제합니다.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>관리자 비밀번호를 입력하세요.</p>
                  <input type="password" id="deletePW">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="memberDelete()">삭제</button>
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
            <script type="text/javascript">
				function memberDelete(){
					var deletePW = $("#deletePW").val();
					var deleteMember = $("#mem_id").val();
					if(deletePW == ""){
						alert("관리자 비밀번호를 입력해주세요.");
						return;
					}
		
					$.ajax({
			   			type: "POST", //요청 메소드 방식
			  			 url:"/adMember/delete",
			   			data: {"deletePW":deletePW, "deleteMember":deleteMember},
			   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
			   			
			   			success : function(result){
			      			if(result.error === true){
			    	  			alert('삭제되었습니다.');
			    	  			location.href="/adMember/list";
			      			}else if(result.error === false){
			    	  			alert('관리자 비밀번호를 확인해 주세요.');
			    	  			return;
			      			}
			   			},
			   		 error:function(request,status,error){
			   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			      			//통신 실패시 발생하는 함수(콜백)
			   				}
						});
				}
			</script>
  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.min.js"></script>
  <script src="/resources/assets/js/ruang-admin.min.js"></script>

</body>

</html>