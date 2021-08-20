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
.image {
 background-image: url('/resources/donation/plasticThema.jpg');
 background-repeat: no-repeat;
 background-size: auto;
 }
.item {text-align: center;}
.item p{text-align: center;}
#donationBt{text-align: center;}
#lastDonationBt{padding-top: 13px;}
</style>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>


<div class="image">
	<div class="slider-height2 d-flex align-items-center">
		<div class="container">
			<div class="row">
			<div class="col-xl-12">
            	<div class="hero-cap hero-cap2 pt-10">
                	<h1 style="font-size: 2em; color: white;">플라스틱이 넘쳐요!</h1>
                    <p style="font-size: 0.8em; color: white;">EARTH & US에서는 가상의 상품을 구매함으로서 기부(후원)에 동참하게 됩니다.</p>
            	</div>
            </div>
            </div>
        </div>
    </div>
</div>

<div class="service-area section-padding30">
<div class="container">
	<div class="row">
	 	<c:forEach items="${plastic}" var="donation" begin="0" end="2">
			<div class="item col-md-3 col-6">
				<div class="single-cat text-center mb-30">
				<div class="cat-icon"><img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지"></div><br>
					<c:set var="price" value="${donation.d_price}"/>
					<p>${donation.d_name} <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>원</p><br>
					<form action="/pay/pay" method="POST">
						<input type="hidden" name="mem_id" value="${auth_id}"/>
						<input type="hidden" name="pay_dname" value="${donation.d_name}"/>
						<input type="hidden" name="pay_price" value="${donation.d_price}"/>
					<div class="cat-cap">
						<c:if test="${empty auth}">
							<div id="donationBt"><button type="button" class="btn btn-primary" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">후원하기</button></div>
						</c:if>
						<c:if test="${!empty auth}">
							<div id="donationBt"><input type="submit" class="btn btn-primary" value="후원하기"/></div>
						</c:if>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${plastic}" var="donation" begin="3" end="3">
			<div class="item col-md-3 col-6">
				<div class="single-cat text-center mb-30">
					<div class="cat-icon"><img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지"></div><br>
					<form action="/pay/pay" method="POST">
						<input type="hidden" name="mem_id" value="${auth_id}"/>
						<input type="hidden" name="pay_dname" value="${donation.d_name}"/>
						<input type="text" size=8 height=20 name="pay_price"/>&nbsp;원<br><br>
					<div class="cat-cap">
						<c:if test="${empty auth}">
							<div id="lastDonationBt"><button type="button" class="btn btn-primary" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">자율후원</button></div>
						</c:if>
						<c:if test="${!empty auth}">
							<div id="lastDonationBt"><input type="submit" class="btn btn-primary" value="자율후원"/></div>
						</c:if>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>