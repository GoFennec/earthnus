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
 background-image: url('/resources/donation/oceanThema01.jpg');
 background-repeat: no-repeat;
 background-size: cover;
 }
.animated {
 animation-duration: 1s;
 animation-fill-mode: both;
 -webkit-animation-duration: 1s;
 -webkit-animation-fill-mode: both
}
.animatedFadeInUp {
 opacity: 0
}
.fadeInUp {
 opacity: 0;
 animation-name: fadeInUp;
 -webkit-animation-name: fadeInUp;
}
.item{text-align: center;}
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
			<div class="col-xl-8 col-lg-8 col-md-8 col-12">
            	<div class="hero-cap hero-cap2 pt-10 animated animatedFadeInUp fadeInUp">
                	<h1 style="font-size: 2.5em; color: white;">바다가 힘들어요!</h1>
                    <p style="color: white;">EARTH & US에서는 가상의 상품을 구매함으로서 기부(후원)에 동참하게 됩니다.</p>
            	</div>
            </div>
            </div>
        </div>
    </div>
</div>

<div class="service-area section-padding30">
<div class="container">
	<div class="row">
	 	<c:forEach items="${ocean}" var="donation" begin="0" end="2">
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
							<div id="donationBt"><input type="submit" class="btn btn-primary" value="후원하기"/></div>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${ocean}" var="donation" begin="3" end="3">
			<div class="item col-md-3 col-6">
				<div class="single-cat text-center mb-30">
					<div class="cat-icon"><img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지"></div><br>
					<form action="/pay/pay" method="POST">
						<input type="hidden" name="mem_id" value="${auth_id}"/>
						<input type="hidden" name="pay_dname" value="${donation.d_name}"/>
						<input type="text" size=8 height=20 name="pay_price"/>&nbsp;원<br><br>
					<div class="cat-cap">
							<div id="lastDonationBt"><input type="submit" class="btn btn-primary" value="자율후원"/></div>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</div>

<div class="container">
	<div class="row">
	<div class="col-md-7 col-12">
		<div style="padding:10px;">
			<h2 style="color: #388E3C;">바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.</h2><br>
			<p>그러나 지금 바다는 그 어느 때보다 큰 위험에 처해있습니다.<br>
			우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.<br>
			어쩌구 저쩌구 .... 어쩌구...<br>
			...... ...저쩌구..</p>
		</div>
	</div>
	<div class="col-md-5 col-12">
		<img src="/resources/donation/oceanThema02.jpg" title="" alt="" width="100%">
	</div>
	</div><br><br>
	
	<div class="row">
	<div class="col-md-8 col-12">
		<img src="/resources/donation/forestThema02.jpg" title="" alt="" width="100%">
	</div>
	<div class="col-md-4 col-12">
		<div style="padding:10px;">
			<h2 style="color: #388E3C;">바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.</h2><br>
			<p>그러나 지금 바다는 그 어느 때보다 큰 위험에 처해있습니다.<br>
			우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.<br>
			어쩌구 저쩌구 .... 어쩌구...<br>
			...... ...저쩌구..</p>
		</div>
	</div>
	</div><br><br>

	<div style="text-align: center; padding: 20px;">
		<p>여러분이 보내주신 후원은 정부와 기업의 기후행동을 강화하여,<br>
		인류가 자연에 미치는 영향을 줄임으로써 생물 다양성을 보전하는데 중요한 역할을 합니다.<br>
		copy...</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>