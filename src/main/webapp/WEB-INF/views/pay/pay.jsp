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
		<tr><th scope="row">구매 상품</th><td>1 ${pay.pay_dnum}</td></tr>		
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
		<c:set var="point" value="${member.mem_point}"/>
		<tr><th scope="row">보유 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${point}"/>p</td></tr>
		<tr><th scope="row">적립 예정 포인트</th><td>${pay.pay_price * 0.005}원</td></tr>		
		</tbody>
		</table>
	</div>
	<br><br>
	
	<div id="pay">
		<form method="POST">
		<input type="hidden" name="pay_dnum" value="${pay.pay_dnum}"/>
		<input type="hidden" name="pay_price" value="${pay.pay_price}"/>
		<input type="hidden" name="mem_id" value="${member.mem_id}"/>
		<input type="hidden" name="mem_name" value="${member.mem_name}"/>
		<input type="hidden" name="mem_email" value="${member.mem_email}"/>
		<input type="hidden" name="mem_tel" value="${member.mem_tel}"/>
		<input type="hidden" name="mem_addr" value="${member.mem_addr}"/>
		<table class="pay">
		<thead>
		<tr><th scope="row" colspan="2">결제수단</th></tr>
		</thead>
		<tbody>
		<tr><th scope="row">카카오 페이</th>
			<td><input type="submit" value="결제하기" formaction="/pay/kakaoPay"/></td></tr>
		<tr><th scope="row">네이버 페이</th>
			<td><input type="submit" value="결제하기" formaction="/pay/naverPay"/></td></tr>		
		</tbody>
		</table>
		</form>
	</div>
	<br><br>
	
	</section><br>
	
</div>	

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>