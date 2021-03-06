<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  			font-size: 0.8em;
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
      <li class="nav-item active">
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
            <h1 class="h3 mb-0 text-gray-800">후원 관리</h1>
          </div>

          <!-- Row -->
          <div class="row">
          
             <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">전체 후원 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payTotal}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-list-alt fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">이 달의 후원 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payMonthly}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-uppercase mb-1">포인트 승인 대기 중인 후원</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${payWaiting}건</div>
                    </div>
                    <div class="col-auto">
                      <i class="far fa-stop-circle fa-2x text-info"></i>
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
                      <div class="text-xs font-weight-bold text-uppercase mb-1">해양</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payOcean}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-tint fa-2x text-primary"></i>
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
                      <div class="text-xs font-weight-bold text-uppercase mb-1">숲</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payForest}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-tree fa-2x text-success"></i>
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
                      <div class="text-xs font-weight-bold text-uppercase mb-1">플라스틱</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payPlastic}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-sync-alt fa-2x text-secondary"></i>
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
                      <div class="text-xs font-weight-bold text-uppercase mb-1">북극곰</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${payIce}"/></div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-snowflake fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- DataTable with Hover -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="table-responsive p-3">
                <div class="row">
                <div class="col-sm-12 col-md-6">
                <a href="/adDonation/list" class="btn btn-sm btn-primary">전체 보기</a>
                <a href="/adDonation/waiting" class="btn btn-sm btn-primary">포인트 승인 대기</a>
                <a href="/adDonation/canceled" class="btn btn-sm btn-primary">취소된 후원</a>
                </div>
                <div class="col-sm-12 col-md-6" style="text-align:right;">
                <button class="btn btn-sm btn-danger" onclick="checkDelete()">결제 취소</button>
                </div>
                </div>  
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>기부 <br> 번호</th>
                        <th>결제 <br> 번호</th>
                        <th>후원자 <br> 이름</th>
                        <th>후원자 <br>아이디</th>
                        <th>결제 <br> 상품</th>
                        <th>후원 <br> 금액</th>
                        <th>발생 <br> 포인트</th>
                        <th>후원 <br> 날짜</th>
                        <th>후원 <br> 취소일</th>
                        <th>결제 <br> 상태</th>
                        <th>포인트 <br> 적립</th>
                      </tr>
                    </thead>
					<tbody>
					<c:if test="${not empty adDonationList}">
						<c:forEach items="${adDonationList}" var="donation">
						<tr>
							<td>${donation.pay_no} <br> <input type="checkbox" name="test_check" value="${donation.pay_num}"></td>
							<td>${donation.pay_num}</td>
							<td>${donation.pay_name}</td>
							<td>${donation.pay_id}</td>
							<td>${donation.pay_dname}</td>
							<c:set var="price" value="${donation.pay_price}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</td>
							<c:set var="point" value="${donation.pay_point}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${point}"/>p</td>
							<td>${donation.pay_pdate}</td>
							<td>${donation.pay_cdate}</td>
							<c:if test="${donation.pay_state eq '결제취소'}">
								<td class="text-danger">${donation.pay_state}</td>
							</c:if>
							<c:if test="${donation.pay_state ne '결제취소'}">
								<td>${donation.pay_state}</td>
							</c:if>
							<c:if test="${donation.pay_state eq '결제승인' and donation.pay_pstate eq '적립예정'}">
							<td><form action="/adDonation/pointUpdate" method="POST">
								<input type="hidden" name="pay_id" value="${donation.pay_id}"/>
								<input type="hidden" name="pay_no" value="${donation.pay_no}"/>
								<input type="hidden" name="pay_point" value="${donation.pay_point}"/>
								<input type="submit" class="btn btn-sm btn-primary" value="승인"/></form></td>
							</c:if>
							<c:if test="${donation.pay_pstate eq '적립완료' or donation.pay_state eq '결제취소'}">
								<td style="color:#66bb6a;">${donation.pay_pstate}</td>
							</c:if>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty waitingList}">
						<c:forEach items="${waitingList}" var="donation">
						<tr>
							<td>${donation.pay_no} <br> <input type="checkbox" name="test_check" value="${donation.pay_num}"></td>
							<td>${donation.pay_num}</td>
							<td>${donation.pay_name}</td>
							<td>${donation.pay_id}</td>
							<td>${donation.pay_dname}</td>
							<c:set var="price" value="${donation.pay_price}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</td>
							<c:set var="point" value="${donation.pay_point}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${point}"/>p</td>
							<td>${donation.pay_pdate}</td>
							<td>${donation.pay_cdate}</td>
							<td>${donation.pay_state}</td>
							<c:if test="${donation.pay_state eq '결제승인' and donation.pay_pstate eq '적립예정'}">
							<td><form action="/adDonation/pointUpdate" method="POST">
								<input type="hidden" name="pay_id" value="${donation.pay_id}"/>
								<input type="hidden" name="pay_no" value="${donation.pay_no}"/>
								<input type="hidden" name="pay_point" value="${donation.pay_point}"/>
								<input type="submit" class="btn btn-sm btn-primary" value="승인"/></form></td>
							</c:if>
				
							<c:if test="${donation.pay_pstate eq '적립완료' or donation.pay_state eq '결제취소'}">
							<td>${donation.pay_pstate}</td>
							</c:if>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${not empty cancelList}">
						<c:forEach items="${cancelList}" var="donation">
						<tr class="donationInfo" id="${donation.pay_no}">
							<td>${donation.pay_no}</td>
							<td>${donation.pay_num}</td>
							<td>${donation.pay_name}</td>
							<td>${donation.pay_id}</td>
							<td>${donation.pay_dname}</td>
							<c:set var="price" value="${donation.pay_price}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</td>
							<c:set var="point" value="${donation.pay_point}"/>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${point}"/>p</td>
							<td>${donation.pay_pdate}</td>
							<td>${donation.pay_cdate}</td>
							<td class="text-danger">${donation.pay_state}</td>
							<c:if test="${donation.pay_state eq '결제승인' and donation.pay_pstate eq '적립예정'}">
							<td><form action="/adDonation/pointUpdate" method="POST">
								<input type="hidden" name="pay_id" value="${donation.pay_id}"/>
								<input type="hidden" name="pay_no" value="${donation.pay_no}"/>
								<input type="hidden" name="pay_point" value="${donation.pay_point}"/>
								<input type="submit" value="승인"/></form></td>
							</c:if>
				
							<c:if test="${donation.pay_pstate eq '적립완료' or donation.pay_state eq '결제취소'}">
							<td>${donation.pay_pstate}</td>
							</c:if>
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
          <script type="text/javascript">
			function checkDelete(){
				var checkArr = [];     // 배열 초기화
				$("input[name='test_check']:checked").each(function(i) {
        			checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    			});
				if(checkArr.length == 0){
					alert('취소할 후원을 체크해주세요.');
					return;
				}else if(checkArr.length > 1){
					alert('취소할 후원을 한 개만 선택해주세요.');
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
                  <h5 class="modal-title" id="exampleModalLabelLogout">후원 결제 취소</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  	<p>관리자 비밀번호를 입력하세요.</p>
                  	<input type="password" id="deletePW">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" onclick="donationDelete()">삭제</button>
                  <button type="button" class="btn" data-dismiss="modal">취소</button>
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
  <script>
var cancelNo = "";
var cancelNum = "";
var selectTr = "";
var selectTd = "";
var payState = "";
var pointState = "";

var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '-' + month  + '-' + day;

function donationDelete(){
   var checkBox = $("input:checkbox[name=test_check]:checked");
   checkBox.each(function(i){
      selectTr = checkBox.parent().parent().eq(i);
      selectTd = selectTr.children();
      cancelNo = selectTd.eq(0).text();
       cancelNum = selectTd.eq(1).text();
       payState = selectTd.eq(9).text();
       pointState = selectTd.eq(10).text();
   });
   var deletePW = $("#deletePW").val();
   if(deletePW == ""){
      alert("관리자 비밀번호를 입력해주세요.");
      return;
   }

   $.ajax({
         type: "POST", //요청 메소드 방식
          url:"/adDonation/delete",
         data: {"deletePW":deletePW},
         dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
         
         success : function(result){
           if(result.error === true){
              cancelPay();
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


function cancelPay() {
   if (payState == '결제취소') {
      alert("이미 취소 된 결제입니다.");
      location.href="/adDonation/list";
      return;
   } else if (pointState == '적립완료') {
      alert("포인트 적립이 완료 된 결제는 취소 할 수 없습니다.");
      location.href="/adDonation/list";
      return;
   } else {
       jQuery.ajax({
         url : "/payments/cancel/" + cancelNum,
         method : "POST",
         headers : { "Content-Type": "application/json" },
         data : JSON.stringify ({
          pay_no : cancelNo,
           pay_num : cancelNum,
           pay_cdate : dateString
         })
       }).done(function(result) {
           alert("결제가 취소되었습니다.");
           location.href="/adDonation/list";
       }).fail(function(error) {
         alert("결제취소를 실패하였습니다.");
       });
   }
 };
</script>

</body>

</html>