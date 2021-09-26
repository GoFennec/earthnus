<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<style>
	table {margin: auto;}
	thead th {padding: 5px; font-weight: bold; vertical-align: top; color: #696969; border-bottom: 3px solid #BEBEBE;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 400px;}
	.td_right2 .text {width: 199px;}
	#selectBox {width: 30%}
	.td_right2 .btnAdd {width: 80px;}
	.sysBtn {text-align: center;}
</style>
</head>
<body>
<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adLogout2" title="관리자 메인화면 바로가기">
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

          <!-- Row -->
          <div class="row">
          
		 <!-- DataTable with Hover -->
			<div class="col-lg-12">
				<div class="insertForm">
	<form action="/adGoods/insertOk" method="POST" enctype="multipart/form-data" onsubmit="return checkAdd();">
		<table class="insertFormTable">
			<thead><tr><th scope="col" colspan="2">지구마켓 상품추가</th></tr></thead>
			<tr><td class="td_left"><label for="goods_numV">상&nbsp;품&nbsp;&nbsp;번&nbsp;호&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" id="goods_numV" value="${newGoodsNum}" disabled required>
				<input type="hidden" name="goods_num" value="${newGoodsNum}"></td></tr>
			<tr><td class="td_left"><label for="goods_name">상&nbsp;품&nbsp;&nbsp;이&nbsp;름&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_name" id="goods_name" required></td></tr>
			<tr><td class="td_left"><label for="goods_category">상&nbsp;품&nbsp;&nbsp;분&nbsp;류&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right2"><input type="text" name="goods_category" id="goods_category" required>
				<select id="selectBox">
					<option value="">직접입력</option>
				<c:forEach var="category" items="${goodsCategory}">
					<option value="${category.goods_category}">${category.goods_category}</option>
				</c:forEach>
				</select></td></tr>
			<tr><td class="td_left"><label for="goods_point" pattern="^[0-9]+$">상품포인트&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_point" id="goods_point" required></td></tr>
			<tr><td class="td_left"><label for="goods_desc">상&nbsp;품&nbsp;&nbsp;설&nbsp;명&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><textarea cols="43" rows="4" style="resize: none;" name="goods_desc" id="goods_desc" required></textarea></td></tr>
			<tr><td class="td_left"><label for="goods_uploadFile">상&nbsp;품&nbsp;&nbsp;사&nbsp;진&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="file" accept="image/*" name="goods_uploadFile" id="goods_uploadFile"></td></tr>
			<tr><td class="td_left"><label for="goods_info">상&nbsp;품&nbsp;&nbsp;정&nbsp;보&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right2">
					<input type="hidden" name="total" id="total" value="2">
					<input type="text" name="goods_info_1" id="goods_info_1" class="text" required placeholder="색상">
					<input type="text" name="goods_info_2" id="goods_info_2" class="text" required placeholder="레드">
					<input type="button" id="addInput" class="btn-dark btnAdd" value="정보추가"/></td></tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="상품추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="location.href='/adGoods/list'"/>
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
<script type="text/javascript">
var i = 3;
$(function() {                
    $('#addInput').click (function () {
        $('.insertFormTable').append (
            "<tr><td></td><td class='td_right2'><input type='text' name='goods_info_"+i+"' id='goods_info_"+i+"' class='text' required> "
            +"<input type='text' name='goods_info_"+(i+1)+"' id='goods_info_"+(i+1)+"' class='text' required> "
            +"<input type='button' class='btnRemove btn-dark btnAdd' value='삭제'></td></tr>");
        $('.btnRemove').on('click', function () {
            $(this).prev().prev().remove();
            $(this).prev().remove();
            $(this).next().remove();
            $(this).remove();
        });
        i++; i++;
        $('#total').val(i-1);
    });
});
function checkAdd() {
	var o = 1;
	var dataInput = "";
	for (var num = 1; num <= $('#total').val(); num++) {
		if ($('#goods_info_'+num).val() == "" || $('#goods_info_'+num).val() == null) {
		} else {
			dataInput += num+"&";
		}
	}
	$('#total').val(dataInput);
}
$("#selectBox").change(function(){
	$("#goods_category").val($("#selectBox").val());
});
</script>
</body>
</html>