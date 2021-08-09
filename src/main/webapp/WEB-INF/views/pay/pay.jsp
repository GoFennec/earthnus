<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.top{text-align: center;}

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
  color: #369;
  border-bottom: 3px solid #036;
}
tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
td {
  width: 350px;
  padding: 10px;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

<div class="container">
	
	<section class="top">
		<h4><br><br><br>Ocean Img</h4>
		<h4><br><br><br>copy<br><br><br></h4>
	</section>
	<br><br><br><br>
	
	<section class="middle">
	<div id="payInfo">
		<table class="payInfo">
		<thead>
		<tr><th scope="row" colspan="2">후원/결제</th></tr>
		</thead>
		<tbody>
		<tr><th scope="row">성명</th><td>${member.mem_name}</td></tr>
		<tr><th scope="row">구매 상품</th><td>${pay.pay_dnum}</td></tr>		
		<c:set var="total" value="${pay.pay_price}"/>
		<tr><th scope="row">후원 금액</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/>원</td></tr>
		</tbody>
		</table>
	</div>
	<br><br>
	
	<div id="pointInfo">
		<table class="pointInfo">
		<thead>
		<tr><th scope="row" colspan="2">포인트</th></tr>
		</thead>
		<tbody>
		<c:set var="holdingPoint" value="${member.mem_point}"/>
		<tr><th scope="row">보유 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${holdingPoint}"/>p</td></tr>
		<c:set var="pay_point" value="${Math.round(pay.pay_price * 0.005)}"/>
		<tr><th scope="row">적립 예정 포인트</th><td>${pay_point}p</td></tr>		
		</tbody>
		</table>
	</div>
	<br><br>
	
	<div id="pay">
		<table class="pay">
		<thead>
		<tr><th scope="row" colspan="2">결제수단</th></tr>
		</thead>
		<tbody>
		<tr><th scope="row">일반 결제</th>
			<td><button type="button" id="inicis">일반 결제</button>
		<tr><th scope="row">간편 결제</th>
			<td><button type="button" id="kakaoPay">간편 결제</button>
		</tbody>
		</table>
	</div>
	<br><br>
	
	</section><br>
	
</div>	

<script>
	$("#inicis").click(function(){
        var IMP = window.IMP;
        IMP.init('imp38606976');
        
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '후원 상품(${pay.pay_dnum}) 결제',
            amount : '${pay.pay_price}',
            buyer_email : '${member.mem_email}',
            buyer_name : '${member.mem_name}',
            buyer_tel : '${member.mem_tel}',
            buyer_addr : '${member.mem_addr}',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    data: JSON.stringify ({
                        pay_num : rsp.imp_uid,
                        pay_id : '${member.mem_id}',
                        pay_name : '${member.mem_name}',
						pay_dnum : '${pay.pay_dnum}',
                        pay_price : '${pay.pay_price}',
                        pay_point : '${pay_point}',
                        pay_date : rsp.paid_at
                    })
                }).done(function(data) {
                	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                	if(rsp.paid_amount == data.response.amount) {
	                	var imp_id = rsp.imp_uid;
		                var msg = '결제가 완료되었습니다.';
		                /* msg += '\n고유ID : ' + rsp.imp_uid;
		                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                msg += '\n결제 금액 : ' + rsp.paid_amount;
		                msg += '\n카드 승인번호 : ' + rsp.apply_num; */
		                alert(msg);
		 	            location.href='/pay/payOk/'+imp_id;
		            } else {
		            	var msg = '결제에 실패하였습니다.';
		                msg += '\n실패 사유 : ' + rsp.error_msg;
		            	alert(msg);
		            }
                })
            }
        });
    });
</script>

<script>
	$("#kakaoPay").click(function(){
        var IMP = window.IMP;
        IMP.init('imp38606976');
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '후원 상품(${pay.pay_dnum}) 결제',
            amount : '${pay.pay_price}',
            buyer_email : '${member.mem_email}',
            buyer_name : '${member.mem_name}',
            buyer_tel : '${member.mem_tel}',
            buyer_addr : '${member.mem_addr}',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    data: JSON.stringify ({
                        pay_num : rsp.imp_uid,
                        pay_id : '${member.mem_id}',
                        pay_name : '${member.mem_name}',
						pay_dnum : '${pay.pay_dnum}',
                        pay_price : '${pay.pay_price}',
                        pay_point : '${pay_point}',
                        pay_date : rsp.paid_at
                    })
                }).done(function(data) {
                	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                	if(rsp.paid_amount == data.response.amount) {
	                	var imp_id = rsp.imp_uid;
		                var msg = '결제가 완료되었습니다.';
		                /* msg += '\n고유ID : ' + rsp.imp_uid;
		                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                msg += '\n결제 금액 : ' + rsp.paid_amount;
		                msg += '\n카드 승인번호 : ' + rsp.apply_num; */
		                alert(msg);
		 	            location.href='/pay/payOk/'+imp_id;
		            } else {
		            	var msg = '결제에 실패하였습니다.';
		                msg += '\n실패 사유 : ' + rsp.error_msg;
		            	alert(msg);
		            }
                })
            }
        });
    });
</script>

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>