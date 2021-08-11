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
section{text-align: center;}
section p{font-size: 0.8em; color: gray;}
.item {text-align: center;}
.item p{text-align: center;}
#donationBt{text-align: center;}
#lastDonationBt{padding-top: 13px;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>
	
<div class="container">
	
	<section>
	<h2>북극곰을 도와줘요!</h2>
	<p>EARTH & US에서는 가상의 상품을 구매함으로서 기부(후원)에 동참하게 됩니다.</p>
	</section><br>
	<hr><br><br><br>
	
	<div class="row">
	 	<c:forEach items="${ice}" var="donation" begin="0" end="2">
			<div class="item col-3 col-md-3">
				<img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지" width=80%><br><br>
				<c:set var="price" value="${donation.d_price}"/>
				<p>${donation.d_name} <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</p>
				<form action="/pay/pay" method="POST">
					<input type="hidden" name="mem_id" value="${auth_id}"/>
					<input type="hidden" name="pay_dnum" value="${donation.d_name}"/>
					<input type="hidden" name="pay_price" value="${donation.d_price}"/>
					
					<c:if test="${empty auth}">
						<div id="donationBt"><button type="button" class="btn btn-primary" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">후원하기</button></div>
					</c:if>
					<c:if test="${!empty auth}">
						<div id="donationBt"><input type="submit" class="btn btn-primary" value="후원하기"/></div>
					</c:if>
				</form>	
			</div>
		</c:forEach>
		
		<c:forEach items="${ice}" var="donation" begin="3" end="3">
			<div class="item col-4 col-md-3">
				<img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지" width=80%><br><br>
				<form action="/pay/pay" method="POST">
					<input type="hidden" name="mem_id" value="${auth_id}"/>
					<input type="hidden" name="pay_dnum" value="${donation.d_name}"/>
					<input type="text" size=10 height=20 name="pay_price"/>&nbsp;원
					
					<c:if test="${empty auth}">
						<div id="lastDonationBt"><button type="button" class="btn btn-primary" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">자율후원</button></div>
					</c:if>
					<c:if test="${!empty auth}">
						<div id="lastDonationBt"><input type="submit" class="btn btn-primary" value="자율후원"/></div>
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