<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
#button{text-align: center;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

<div class="container">
	
	<section class="top">
		<h4><br><br><br>Ocean Img</h4>
		<h4><br><br><br>후원해주셔서 감사합니다. copy<br><br><br></h4>
	</section>
	<br><br><br><br>
	
	<section class="middle">
	<div id="payInfo">
		<table class="payInfo">
		<thead>
		<tr><th scope="row" colspan="2">후원/결제 내역</th></tr>
		</thead>
		<tbody>
		<tr><th scope="row">성명</th><td>${pay.pay_name}</td></tr>
		<tr><th scope="row">구매 상품</th><td>${pay.pay_dnum}</td></tr>		
		<c:set var="total" value="${pay.pay_price}"/>
		<tr><th scope="row">후원 금액</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/>원</td></tr>
		<tr><th scope="row">후원 일자</th><td>${pay.pay_date}</td></tr>		
		</tbody>
		</table>	
	</div>
	</section><br>

	<div id="button">
		<button type="button" class="btn btn-dark" onclick="location.href='/'">메인으로</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-dark" onclick="location.href='/member/myPage'">후원내역 조회</button>
	</div>

</div>

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>