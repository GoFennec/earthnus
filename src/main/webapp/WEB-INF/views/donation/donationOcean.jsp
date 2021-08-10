<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
			<div class="col-8 col-md-3">
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
			<div class="col-4 col-md-3">
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