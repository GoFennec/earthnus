<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>EARTH & US</title>
  <link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
  <style type="text/css">
  	.form-control{
  		font-size:1.5rem;
  	}
  </style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adIndex" title="관리자 메인화면 바로가기">
        <div class="sidebar-brand-icon">
          <img src="/resources/assets/img/logo/logo2_footer.png" alt="관리자 메인화면 바로가기">
        </div>
      </a>
      <li class="nav-item">
        <a class="nav-link" href="/adIndex">
        <i class="fas fa-desktop"></i>
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
        <jsp:include page="/WEB-INF/views/adHeader.jsp"/>
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
                      		<c:if test="${memberListDetail.mem_api eq \"NAVER\" }"><input type="text" class="form-control" id="mem_id" value="네이버 로그인 회원" readonly></c:if>
                      		<c:if test="${memberListDetail.mem_api eq \"KAKAO\" }"><input type="text" class="form-control" id="mem_id" value="카카오 로그인 회원" readonly></c:if>
                      		<c:if test="${memberListDetail.mem_api eq \"NULL\" }"><input type="text" class="form-control" id="mem_id" value="${memberListDetail.mem_id}" readonly></c:if>
                      		<c:if test="${memberListDetail.mem_api eq null }"><input type="text" class="form-control" id="mem_id" value="${memberListDetail.mem_id}" readonly></c:if>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">이메일</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail.mem_email}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">전화번호</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail.mem_tel}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">주소</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail.mem_addr}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">성별</label>
                      <input type="text" class="form-control" id="exampleInputEmail1" value="${memberListDetail.mem_gender}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">생일</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail.mem_birth}" readonly>
                    </div>
                </div>
              </div>
            </div>

            <div class="col-lg-6">
              <div class="card mb-4">
                <div class="card-body">
                    <div class="form-group">
                      <label for="exampleInputPassword1">이름</label>
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail.mem_name}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">가입 날짜</label>
                      <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${memberListDetail.mem_date}" var="formatdate"/>
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
                      <input type="text" class="form-control" id="exampleInputPassword1" value="${memberListDetail.mem_point}" readonly>
                    </div>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
          
          
          <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">${memberListDetail.mem_id} 회원을 삭제합니다.</h5>
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
			      			}else{
								alert('해당 회원은 배송 되지 않은 지구마켓 상품이 있습니다.');			      				
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