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
	thead th {padding: 5px; font-weight: bold; vertical-align: top; color: #696969; font-size: 1.5em; border-bottom: 3px solid #BEBEBE;}
	td {padding: 15px; border-bottom: 2px solid #ddd;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 300px; vertical-align: middle;}
	.sysBtn {text-align: center;}
	#ccSelect {width: 100px;}
	label {vertical-align: middle;}
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

          <!-- Row -->
          <div class="row">
          
             
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              	<div class="updateForm">
	<form action="/adExGoods/cancle" id="adExGoodsCancle" method="POST">
		<input type="hidden" name="exg_num" value="${exGoods.exg_realnum}">
		<input type="hidden" name="exg_id" value="${exGoods.exg_id}"/>
		<input type="hidden" name="exg_point" value="${exGoods.exg_point}"/>
		<input type="hidden" name="exg_cancle" id="exg_cancle"/>
	</form>
	<form action="/adExGoods/deliveryOk" method="POST" onsubmit="return checkDelivery();">
		<table class="insertFormTable">
			<thead>
				<tr><th scope="col" colspan="2">결제상세내역</th></tr>
			</thead>
			<tbody>
				<tr><td class="td_left">결&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_num}<input type="hidden" name="exg_num" value="${exGoods.exg_realnum}"></td></tr>
				<tr><td class="td_left">주 문 자 이 름&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_name}</td></tr>
				<tr><td class="td_left">상&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;보&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_gnum}(${exGoods.exg_gname})</td></tr>
				<tr><td class="td_left">사용한포인트&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_point}</td></tr>
				<tr><td class="td_left">주&nbsp;&nbsp;문&nbsp;&nbsp;&nbsp;상&nbsp;&nbsp;태&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_state}</td></tr>
				<tr><td class="td_left">주 문 자 주 소&nbsp;&nbsp;&nbsp;</td>
					<td id="addr"></td></tr>
				<tr><td class="td_left">교&nbsp;&nbsp;환&nbsp;&nbsp;&nbsp;날&nbsp;&nbsp;짜&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_pdate}"/></td></tr>
				<tr><td class="td_left">택&nbsp;&nbsp;배&nbsp;&nbsp;&nbsp;회&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right"><select name="exg_cc" id="selectBox">
					    <option value="">직접입력</option>
					    <option value="CJ대한통운">CJ대한통운</option>
					    <option value="롯데택배">롯데택배</option>
					    <option value="우체국택배">우체국택배</option>
					    <option value="로젠택배">로젠택배</option>
					    <option value="한진택배">한진택배</option>
					    <option value="CU편의점택배">CU편의점택배</option>
					    <option value="EMS택배">EMS택배</option>
					    <option value="경동택배">경동택배</option>
					    <option value="대신택배">대신택배</option>
					    <option value="DHL택배">DHL택배</option>
					    <option value="FedEx">FedEx</option></select>
					<!-- <input type="text" id="exg_cc" value="" required> -->
				<tr><td class="td_left"><label for="exg_waybill">운 송 장 번 호&nbsp;&nbsp;&nbsp;</label></td>
					<td class="td_right"><input type="text" name="exg_waybill" id="exg_waybill" value="" maxlength="13" required pattern="^[0-9]+$"></td>
			</tbody>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="배송처리"/>
			<input type="button" class="btn-dark" value="취소처리" onclick="cancle()"/>
			<input type="button" class="btn-dark" value="뒤로가기" onclick="location.href='/adExGoods/list'"/>
		</div>	
	</form>
	</div><br>
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

  <script>
  $(function() {
  	var addrStr = "${exGoods.exg_addr}";
  	var addArr = addrStr.split("&");
  	$('#addr').html(addArr[0] + "<br>" + addArr[1] + " " + addArr[3] + "<br>" + addArr[2]);
  });
  function execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = '';
              var extraAddr = '';

              if (data.userSelectedType === 'R') {
                  addr = data.roadAddress;
              } else {
                  addr = data.jibunAddress;
              }

              if(data.userSelectedType === 'R'){
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  if(extraAddr !== ''){
                      extraAddr = '(' + extraAddr + ')';
                  }
                  document.getElementById("extraAddress").value = extraAddr;
              
              } else {
                  document.getElementById("extraAddress").value = '';
              }

              document.getElementById('postcode').value = data.zonecode;
              document.getElementById("address").value = addr;
              document.getElementById("detailAddress").value = '';
              document.getElementById("detailAddress").focus();
          }
      }).open();
  }
  function checkDelivery() {
  	if ($("#selectBox").val() == "") {
  		alert("택배회사를 선택해주세요.");
  		return false;
  	} else {
  		return true;
  	}
  }
  function cancle() {
  	if (confirm("정말 결제내역을 취소하시겠습니까?") == true) {
  		var cancleReason = prompt("결제취소 사유를 적어주세요.");
  		if (cancleReason != null) {
  			$("#exg_cancle").val(cancleReason);
  			$('#adExGoodsCancle').submit();
  		} else {
  			return false;
  		}
  	} else {
  		return false;
  	}
  }
  </script>

</body>

</html>