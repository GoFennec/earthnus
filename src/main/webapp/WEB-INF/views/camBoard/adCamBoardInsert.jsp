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
            <h1 class="h3 mb-0 text-gray-800">캠페인 추가</h1>
          </div>

          <!-- Row -->
          <div class="container"><br>

	<div class="insertForm">
	<form action="/adCamBoard/insertOk" method="POST" enctype="multipart/form-data">
		<table class="insertFormTable" style="text-align: center">
			<tr><td colspan="4" class="td_left"><label for="CAMB_FILE"><b>캠페인 사진</b></label></td></tr>
			<tr>
					<td colspan = "4">
						<div id="max" class="file-wrapper flie-wrapper-area">
								<input type="file" name="CAMB_UPLOADFILE" id="file" class="upload-box upload-plus" accept="image/*" style="display: none;">
									<div id="preview"></div>
									<input type="hidden" name="goods_img" value="${goods.goods_img}">
								<div class="file-edit-icon" id="file-edit" style="text-align: center;">
									<a href="#" class="preview-edit">추가</a>
								</div>
						</div>
											
						<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
					</td>
				</tr>
			
			<tr><td colspan="2" class="td_left"><label for="CAMB_NAME"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;제&nbsp;목&nbsp;</b></label></td>
				<td colspan="2" class="td_right"><input type="text" id="CAMB_NAME" name="CAMB_NAME" required></td></tr>
			<tr><td colspan="2" class="td_left"><label for="CAMB_SUBJECT"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;주&nbsp;제&nbsp;</b></label></td>
				<td colspan="2" class="td_right">
					<select name="CAMB_SUBJECT" id="CAMB_SUBJECT" required>
						<option selected>해양</option>
						<option>플라스틱</option>
						<option>산림</option>
						<option>극지방</option>
						<option>기타</option>
					</select>
				</td></tr>
			<tr><td colspan="4"><b>캠페인 기간</b></td></tr>
			<tr><td class="td_left"><label for="CAMB_NAME"><b>시작날짜</b></label></td>
				<td class="td_right"><input type="date" id="CAMB_STARTDATE" name="CAMB_STARTDATE" min="" required></td>
				<td class="td_left"><label for="CAMB_NAME"><b>종료날짜</b></label></td>
				<td class="td_right"><input type="date" id="CAMB_FINDATE" name="CAMB_FINDATE" onclick="checkStartDate()" required></td></tr>
			<tr><td colspan="4" class="td_center"><label for="CAMB_CONTENT"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;내&nbsp;용&nbsp;</b></label></td></tr>
			<tr class="update" style="text-align: center;">
				<td colspan="4">
					<textarea id = "CAMB_CONTENT" name = "CAMB_CONTENT" cols="80" rows="10"placeholder="캠페인 내용을 입력해주세요."></textarea> 
					<script>
						CKEDITOR.replace('CAMB_CONTENT',{filebrowserUploadUrl:'/ckupload/imgUpload'});
					</script>
				</td>
			</tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="캠페인 추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="window.history.back();"/>
		</div>
	</form>
	</div><br>

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
  <script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
    window.onload = function(){		
		$("#preview").html(['<img src="" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="" onchange="showUpdateButton()" title="기본 이미지"/>'].join(''))
		
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		
		var input = document.getElementById("CAMB_STARTDATE");
		input.setAttribute("min", "year-month-date");
	}
	function handleFileSelect(event) {
	    var input = this;
	    console.log(input.files)
	    if (input.files && input.files.length) {
	        var reader = new FileReader();
	        this.enabled = false
	        reader.onload = (function (e) {
	            $("#preview").html(['<img src="', e.target.result, '" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="100%" alt="캠페인" onchange="showUpdateButton()" title="', escape(e.name), '"/>'].join(''))
	        });
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#file').change(handleFileSelect);
	$('.file-edit-icon').on('click', '.preview-de', function () {
	    //$("#preview").html(['<img src="/resorces/camBoard/imgDefault.png" id="IMG" width="600" alt="캠페인" title="', escape(e.name), '"/>'].join(''))
	    $("#file").val("");
	});
	$('.preview-edit').click( function() {
	  $("#file").click();
	} );
	
	document.getElementById("CAMB_UPLOADFILE").onchange = function () {
		$( '#file-edit' ).html( '<a href="#" class="preview-edit">수정</a>' );
	}
	
	function submitCheck(){
		if(!document.getElementById("preview")){
			alert("메인 사진을 추가해 주세요.");
			return false;
		} else{
			return true;
		}
		
	}
	
	document.getElementById("CAMB_STARTDATE").onchange = function () {
	    var input = document.getElementById("CAMB_FINDATE");
	    input.setAttribute("min", this.value);
	}
	
	function checkStartDate(){
		if(!document.getElementById("CAMB_STARTDATE").value){
			alert("먼저 캠페인 시작날짜를 선택하세요.");
			return false;
		}else{
			return true;
		}
	}
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("CAMB_STARTDATE").setAttribute("max", today);
  </script>

</body>

</html>