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
  <script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script>
  
  <style type="text/css">
  	label{
  		margin-top:1rem;
  	}
  	
  	th,td{
  		text-align:center;
  		min-height: 30px;
  	}
  	
  	.file-edit-icon a {
  		cursor: pointer;
  	}
  	
  	input, select {
  		border: none;
  	}
  	
  	#CAMB_SUBJECT{
  		width: 120px;
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
            <h1 class="h3 mb-0 text-gray-800">캠페인 수정</h1>
          </div>

            <!-- DataTable with Hover -->
            <div class="container col-sm-12 col-lg-8" style="text-align: center;">
			<form action="/adCamBoard/updateOk" method="POST" enctype="multipart/form-data">
			<table class="goodsTable">
				<tr>
					<td colspan = "4">
						<div id="max" class="file-wrapper flie-wrapper-area" style="padding-top: 30px;">
								<input type="file" name="CAMB_UPLOADFILE" id="file" class="upload-box upload-plus" accept="image/*" style="display: none;">
									<div id="preview"></div>
									<input type="hidden" name="goods_img" value="${goods.goods_img}">
								<div style="text-align: center;" class="file-edit-icon">
									<a class="preview-edit imgedit">사진 수정</a>
								</div>
						</div>
											
						<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
					</td>
				</tr>
				
				<tr>
					<td><b>제목</b></td>
					<td class="update"><input type="text" id="CAMB_NAME" name="CAMB_NAME" value="${camBoard.CAMB_NAME}" onchange="showUpdateButton()" required></td>
					<td><b>주제</b></td> 
					<td class="update">
						<select id="CAMB_SUBJECT" name="CAMB_SUBJECT" onchange="showUpdateButton()" required>
						<option value="해양">해양</option>
						<option value="플라스틱">플라스틱</option>
						<option value="산림">산림</option>
						<option value="극지방">극지방</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td><b>시작일</b></td>
					<td class="update">
					<input type="date" id="CAMB_STARTDATE" name="CAMB_STARTDATE" value="${CAMB_STARTDATE}" onchange="findate()">
					</td>
					<td><b>종료일</b></td>
					<td class="update">
						<input type="date" id="CAMB_FINDATE" name="CAMB_FINDATE" value="${CAMB_FINDATE}">
					</td>
				</tr>
				
				<tr style="text-align: center;">
					<td colspan="4"><b>캠페인 내용</b></td>
				</tr>
				<tr class="update" style="text-align: center;">
					<td colspan="4">
						<textarea id ="CAMB_CONTENT" name ="CAMB_CONTENT" cols="80" rows="10">
						${camBoard.CAMB_CONTENT}
						</textarea> 
						<script>
							CKEDITOR.replace('CAMB_CONTENT',{filebrowserUploadUrl:'/adCamBoard/insert/imgUpload'});
						</script>
					</td>
				</tr>
			</table>
			<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
			
			<div class="sysBtn">
				
				<input type="button" class="btn-dark editbutton" value="삭제"  data-toggle="modal" data-target="#deleteModal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn-dark editbutton" value="목록" onclick="location.href='/adCamBoard/list'"/>
			</div>
			
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">"${camBoard.CAMB_NAME}" 캠페인을 삭제합니다.</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>관리자 비밀번호를 입력하세요.</p>
                  <input type="password" id="deletePW">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="camBoardDelete()">삭제</button>
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>
		</form>
	</div>

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
<script type="text/javascript">
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  
	window.onload = function(){
		
		var date = "${camBoard.CAMB_STARTDATE}";
		
		$("#preview").html(['<img src="${camBoard.CAMB_FILE}" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="100%" alt="캠페인" onchange="showUpdateButton()" title="${camBoard.CAMB_NAME}"/>'].join(''))
		
		$('#CAMB_SUBJECT').val('플라스틱').prop("selected", true);
			
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
    	
    	var startdate = document.getElementById("CAMB_STARTDATE").value;
	  	document.getElementById("CAMB_FINDATE").setAttribute("min", startdate);
		}
	    
	    function findate(){
	  	  var startdate = document.getElementById("CAMB_STARTDATE").value;
	  	  document.getElementById("CAMB_FINDATE").setAttribute("min", startdate);
	    }
	
	function showUpdateButton(){
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
	    $("#preview").html(['<img src="/resources/camBoard/imgDefault.png" id="IMG" width="600" alt="캠페인" title="후원"/>'].join(''))
	});
	$('.preview-edit').click( function() {
	  $("#file").click();
	} );
	
	function camBoardDelete(){
		var CAMB_NUM = "${camBoard.CAMB_NUM}";
		var deletePW = $("#deletePW").val();
		
		if(deletePW == ""){
			alert("관리자 비밀번호를 입력해주세요.");
			return;
		}

		$.ajax({
   			type: "POST", //요청 메소드 방식
  			 url:"/adCamBoard/delete",
   			data: {"deletePW":deletePW, "CAMB_NUM":CAMB_NUM},
   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
   			
   			success : function(result){
      			if(result.error === true){
    	  			alert('삭제되었습니다.');
    	  			location.href="/adCamBoard/list";
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