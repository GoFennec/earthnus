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
  	table {margin: auto; vertical-align: middle;}
	thead th {padding: 30px 10px; font-weight: bold; vertical-align: top; color: #696969; font-size: 1.5em; border-bottom: 3px solid #BEBEBE;}
	td {padding: 15px; border-bottom: 2px solid #ddd;}
	.td_left {text-align: center; vertical-align: middle;width:200px}
	.td_right{width: 300px; vertical-align: middle;}
	.sysBtn {text-align: center;}
	#ccSelect {width: 100px;}
	label {vertical-align: middle;}
	.updateForm{padding-top:80px;}
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
      <li class="nav-item  active">
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

          <!-- Row -->
          <div class="row">
          
             
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              	<div class="updateForm">
		<table class="insertFormTable">
			<thead>
				<tr><th scope="col" colspan="2">응원상세내역</th></tr>
			</thead>
			<tbody>
				<tr><td class="td_left">응&nbsp;&nbsp;원&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right">${cheBoardDetail.cheb_num}<input type="hidden" value="${cheBoardDetail.cheb_num}" id="cheb_num"></td></tr>
				<tr><td class="td_left">작&nbsp;성&nbsp;자&nbsp;&nbsp;I&nbsp;D&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right">${cheBoardDetail.cheb_id}</td></tr>
				<tr><td class="td_left">작&nbsp;성&nbsp;자&nbsp;이&nbsp;름&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right">${cheBoardDetail.cheb_name}</td></tr>
				<tr><td class="td_left">작&nbsp;&nbsp;성&nbsp;&nbsp;날&nbsp;&nbsp;짜&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${cheBoardDetail.cheb_time}"/></td></tr>
				<tr><td class="td_left">카&nbsp;&nbsp;테&nbsp;&nbsp;고&nbsp;&nbsp;리&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right">${cheBoardDetail.cheb_dname}</td></tr>
				<tr><td class="td_left">작&nbsp;&nbsp;성&nbsp;&nbsp;내&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right">${cheBoardDetail.cheb_content}</td></tr>
			</tbody>
		</table><br>
	</div><br>
	            <div class="" style="text-align:center;">
                  <button class="btn btn-sm btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="checkDelete()">응원 삭제</button>
                </div>
            </div>
          </div>
          <!--Row-->

          <!-- Modal Logout -->
          <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">응원 삭제</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  	<p>관리자 비밀번호를 입력하세요.</p>
                  	<input type="password" id="deletePW">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="cheBoardDelete()">삭제</button>
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
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
  
  <script type="text/javascript">
			function checkDelete(){
					$("#cancelModal").modal('show');
			}
			function cheBoardDelete(){
				var cheb_num = $("#cheb_num").val();
				var deletePW = $("#deletePW").val();
				if(deletePW == ""){
					alert("관리자 비밀번호를 입력해주세요.");
					return;
				}
	
				$.ajax({
		   			type: "POST", //요청 메소드 방식
		  			 url:"/adCheBoard/delete1",
		   			data: {"cheb_num":cheb_num, "deletePW": deletePW},
		   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
		   			
		   			success : function(result){
		      			if(result.error === true){
		    	  			alert('삭제되었습니다.');
		    	  			location.href="/adCheBoard/list";
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

</body>

</html>