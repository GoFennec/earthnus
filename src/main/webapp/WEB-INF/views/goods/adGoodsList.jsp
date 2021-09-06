<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
  		th,td{
  			text-align:center;
  		}
  		label{
  		margin-top:1rem;
  		}
  		  /*radio 버튼 색상변경 */
  		input[type='checkbox'] {
    		-webkit-appearance:none;
    		width:16px;
    		height:16px;
    		outline:none;
    		background:#e6e6e6;
  		}
  		input[type='checkbox']:before {
    		content:'';
    		display:block;
    		width:60%;
    		height:60%;
    		margin: 20% auto;  
  		}
  		input[type='checkbox']:checked:before {
  			background:#66BB6A;
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
      <li class="nav-item active">
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
            <h1 class="h3 mb-0 text-gray-800">지구마켓 상품 관리</h1>
          </div>

          <!-- Row -->
          <div class="row">
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="table-responsive p-3">
                <div class="row">
                <div class="col-sm-12 col-md-6">
                <form action="/adGoods/update" method="post" onsubmit="return checkUpdate()">
                	<input class="btn btn-sm btn-primary" type="submit" value="상품 변경">
                	<input type="hidden" id="update" name="goodsNumU">
                	<input class="btn btn-sm btn-primary" type="button" onclick="location.href='/adGoods/insert'" value="상품 추가"/>
                </form>
                
                </div>
                <div class="col-sm-12 col-md-6" style="text-align:right;">
				<button class="btn btn-sm btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="checkDelete()">상품 삭제</button>
                </div>
                </div>  
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>상품 <br> 번호</th>
                        <th>상품 <br> 사진</th>
                        <th>상품 <br> 이름</th>
                        <th>상품 <br> 분류</th>
                        <th>상품 <br> 포인트</th>
                        <th>상품 <br> 정보</th>
                        <th>상품 <br> 설명</th>
                      </tr>
                    </thead>
					<tbody>
						<c:forEach items="${goodsList}" var="goods">
						<tr class="goodsInfo" id="${goods.goods_num}">
							<td>${goods.goods_num} <br> <input type="checkbox" id="test_check" value="${goods.goods_num}"></td>
							<td class="goodsImg"><img src="<spring:url value='${goods.goods_img}'/>" height="120" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></td>
							<td>${goods.goods_name}</td>
							<td>${goods.goods_category}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point<br/></td>
							<td><c:set var = "num" value="0"/>
							<c:forTokens  var="info" items="${goods.goods_info}" delims="&">
								${info}<c:if test="${num % 2 eq 0}"> : </c:if>
								<c:if test="${num % 2 eq 1}"><br></c:if>
								<c:set var="num" value="${num+1}"/>
							</c:forTokens></td>
							<td>${goods.goods_desc}</td>
						</tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
			
			
			<script type="text/javascript">
			function checkUpdate(){
				var checkArr = [];     // 배열 초기화
				$("input[id='test_check']:checked").each(function(i) {
        			checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    			});
				if(checkArr.length == 0){
					alert('변경할 상품을 체크해주세요.');
					return false;
				}else if(checkArr.length > 1){
					alert('변경할 상품을 한 개만 선택해주세요.');
					return false;
				}else{
					$("#update").val(checkArr[0]);
				}
			}
			</script>
			
			<script type="text/javascript">
			function checkDelete(){
				var checkArr = [];     // 배열 초기화
				$("input[id='test_check']:checked").each(function(i) {
        			checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    			});
				if(checkArr.length == 0){
					alert('삭제할 상품을 체크해주세요.');
					return;
				}else{
					$("#cancelModal").modal('show');
				}
			}
			</script>
          
          <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabelLogout">지구마켓 상품 삭제</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  	<p>관리자 비밀번호를 입력하세요.</p>
                  	<input type="password" id="deletePW">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" style="background-color:#fc544b;border-color:#fc544b;" onclick="goodsDelete()">삭제</button>
                  <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
                </div>
              </div>
            </div>
          </div>
              <script type="text/javascript">
				function goodsDelete(){
					var checkArr = [];     // 배열 초기화
					$("input[id='test_check']:checked").each(function(i) {
	        			checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	    			});
					var deletePW = $("#deletePW").val();
					if(deletePW == ""){
						alert("관리자 비밀번호를 입력해주세요.");
						return;
					}
		
					$.ajax({
			   			type: "POST", //요청 메소드 방식
			  			 url:"/adGoods/delete",
			   			data: {"checkArr":checkArr, "deletePW": deletePW},
			   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
			   			
			   			success : function(result){
			      			if(result.error === true){
			    	  			alert('삭제되었습니다.');
			    	  			location.href="/adGoods/list";
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