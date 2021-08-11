<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
section{text-align: center;}
section p{font-size: 0.8em; color: gray;}
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
#pay td{text-align: center;}
#button {text-align: center;}
button {
  cursor: pointer;
  border: none;
  outline: none;
  background:transparent;
}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

<div class="container">
	
	<section>
	<h2>당신의 후원이 지구를 낫게합니다.</h2>
	<p>EARTH & US에서는 가상의 상품을 구매함으로서 기부(후원)에 동참하게 됩니다.</p>
	</section><br>
	<hr><br><br>
	
	<section class="middle">
	<div id="payInfo">
		<table class="payInfo">
		<thead>
		<tr><th scope="row" colspan="2">후원/결제</th></tr>
		</thead>
		<tbody>
		<tr><th scope="row">후원자 명</th><td>${member.mem_name}</td></tr>
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
		<tr><td>일반 결제</td>
			<td>간편 결제</td></tr>
		<tr><td><div id="button"><button type="button" class="btm_image" id="inicis"><img src="/resources/pay/inicis.png" title="일반결제" alt="일반결제 버튼"/></button></div></td>
			<td><div id="button"><button type="button" class="btm_image" id="kakaoPay"><img src="/resources/pay/kakaoPay.png" title="간편결제" alt="카카오페이 간편결제 버튼"/></button></div></td></tr>
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