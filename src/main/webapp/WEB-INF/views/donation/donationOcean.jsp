<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
section{text-align: center;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>
	
<div class="container">
	
	<section>
		<h4><br><br><br>copy<br><br><br></h4>
	</section>
	<br><br><br><br>
	
	<div class="row">
	 	<c:forEach items="${ocean}" var="donation" begin="0" end="2">
			<div class="col-xs-8 col-md-3">
				<img src="/resources/donation/testOcean.jpg" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지" width=100%>
				<h5>${donation.d_name} 구매</h5>
				<p>(1 ${donation.d_name} = ${donation.d_price}원)</p>
				<form action="/pay/pay" method="POST">
					<input type="hidden" name="mem_id" value="${auth_id}"/>
					<input type="hidden" name="pay_dnum" value="${donation.d_name}"/>
					<input type="hidden" name="pay_price" value="${donation.d_price}"/>
					
					<c:if test="${empty auth}">
						<div id="donationBt"><button type="button" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">후원하기</button></div>
					</c:if>
					<c:if test="${!empty auth}">
						<div id="donationBt"><input type="submit" value="후원하기"/></div>
					</c:if>
				</form>
			</div>
		</c:forEach>
		<c:forEach items="${ocean}" var="donation" begin="3" end="3">
			<div class="col-xs-4 col-md-3">
				<img src="/resources/donation/testOcean.jpg" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지" width=100%>
				<h5>숲 구매(자율 후원)</h5>
				<form action="/pay/pay" method="POST">
					<input type="hidden" name="mem_id" value="${auth_id}"/>
					<input type="hidden" name="pay_dnum" value="${donation.d_name}"/>
					<input type="text" name="pay_price"/>원
					
					<c:if test="${empty auth}">
						<div id="donationBt"><button type="button" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">후원하기</button></div>
					</c:if>
					<c:if test="${!empty auth}">
						<div id="donationBt"><input type="submit" value="후원하기"/></div>
					</c:if>
				</form>
			</div>
		</c:forEach>
	</div>
</div>

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>