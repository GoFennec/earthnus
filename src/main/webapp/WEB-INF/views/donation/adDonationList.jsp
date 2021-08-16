<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#button{text-align: right;}
table {
  width: 100%;
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
}
thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #04B4AE;
  border-bottom: 3px solid #04B4AE;
  background: none;
}
thead td {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #04B4AE;
  border-bottom: 3px solid #04B4AE;
}
th {
  width: 150px;
  padding: 10px;
  text-align: center;
  font-weight: bold;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
 td {
  padding: 9px;
  text-align: center;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
}
.paging {text-align: center;}
.donationInfo {cursor: pointer;}
</style>

<title>EARTH & US</title>
</head>

<body>
<br><br>

<div class="container">
	
	<div class="row">
	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">후원 내역 관리</th>
			<td><div id="button"><button type="button" id="cancel">결제 취소</button></div></td></tr>
		</thead>
	</table>
	</div><br>
	
	<div class="row">
		<div class="col-12">
		<table class="donationList">
			<tr>
				<th scope="col">No.</th>
				<th scope="col">결제 번호</th>
				<th scope="col">후원자</th>
				<th scope="col">아이디</th>
				<th scope="col">결제 상품</th>
				<th scope="col">후원 금액</th>
				<th scope="col">적립 포인트</th>
				<th scope="col">후원 일자</th>
				<th scope="col">후원 취소일자</th>
				<th scope="col">결제 상태</th>
			</tr>
			
			<c:forEach items="${adDonationList}" var="donation">
			<tr class="donationInfo" id="${donation.pay_no}">
				<td>${donation.pay_no}</td>
				<td>${donation.pay_num}</td>
				<td>${donation.pay_name}</td>
				<td>${donation.pay_id}</td>
				<td>${donation.pay_dnum}</td>
				<c:set var="price" value="${donation.pay_price}"/>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</td>
				<c:set var="point" value="${donation.pay_point}"/>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${point}"/>p</td>
				<td>${donation.pay_pdate}</td>
				<td>${donation.pay_cdate}</td>
				<td>${donation.pay_state}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
	</div><br>
		
	<div class="row">
		<div class="col-12">
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
</div>

<script>
var cancelNo = 0;
var cancelNum = "";

var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '-' + month  + '-' + day;

$(function() {
	$('.donationInfo').click(function() {
		$('.donationInfo').css("background-color", "transparent");
		selectTr = $(this);
		selectTd = selectTr.children();
		donationNo = selectTd.eq(0).text();
		donationNum = selectTd.eq(1).text();
		cancelNo = donationNo;
		cancelNum = donationNum;
		$('#'+donationNo).css("background-color", "#FFFFDE");
	});
});
$("#cancel").click(function(){
	if (cancelNum == "") {
		alert("결제를 취소할 항목을 선택해주세요.");
		return false;
	} else if(cancelNum != "") {
		if (confirm("정말 결제를 취소하시겠습니까?") == true) {
			cancelPay();
		} else {
			return false;
 		}
	}
});
function cancelPay() {
    jQuery.ajax({
      url : "/payments/cancel/" + cancelNum,
      method : "POST",
      headers : { "Content-Type": "application/json" },
      data : JSON.stringify ({
    	pay_no : cancelNo,
        pay_num : cancelNum,
        pay_cdate : dateString
      })
    }).done(function(result) { // 환불 성공시 로직 
        alert("결제가 취소되었습니다.");
    }).fail(function(error) { // 환불 실패시 로직
      alert("결제취소를 실패하였습니다.");
    });
 };
</script>
</body>
</html>