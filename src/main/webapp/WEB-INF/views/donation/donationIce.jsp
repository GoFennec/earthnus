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
 background-image: url('/resources/donation/iceThema1.jpg');
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
#camBt{text-align: right;}
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
                	<h1 style="font-size: 2.5em; color: white;">북극곰을 도와줘요!</h1>
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
	 	<c:forEach items="${ice}" var="donation" begin="0" end="2">
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
		
		<c:forEach items="${ice}" var="donation" begin="3" end="3">
			<div class="item col-md-3 col-6">
				<div class="single-cat text-center mb-30">
					<div class="cat-icon"><img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지"></div><br>
					<form action="/pay/pay" method="POST" name="ac" onsubmit="return check()">
						<input type="hidden" name="mem_id" value="${auth_id}"/>
						<input type="hidden" name="pay_dname" value="${donation.d_name}"/>
						<input type="number" name="amount" min="1000" max="10000000" size=8 height=20 name="pay_price"/>&nbsp;원<br><br>
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
		<div>
			<h2 style="color: #388E3C;">지구 온난화로 북극 기온이 상승하여 빙하가 녹고있습니다.</h2><br>
			<p>북극을 지키고, 지구를 지키기 위한 가장 중요한 시점은 바로 지금입니다.
			지구 온난화로 북극 기온이 빠르게 상승하고 있고, 매년 더 많은 빙하가 녹아 내리고 있습니다.
			하지만 이러한 위기 상황에서도 일부 기업들은 석유 시추를 위해 북극을 개발하려 합니다.</p>
		</div>
	</div>
	<div class="col-md-5 col-12">
		<img src="/resources/donation/iceThema2.jpg" title="" alt="" width="100%">
	</div>
	</div><br><br>
	
	<div class="row">
	<div class="col-md-8 col-12">
		<img src="/resources/donation/iceThema3.jpg" title="" alt="" width="100%">
	</div>
	<div class="col-md-4 col-12">
		<div>
			<h2 style="color: #388E3C;">EARTH & US 활동</h2><br>
			<p>빠르게 녹고 있는 북극을 지키기 위해서는 한시라도 빨리 화석연료에서 벗어나야 합니다.
			EARTH & US는 북극 바다에 해양보호구역을 만들기 위한 캠페인을 진행하고 있습니다.</p>
		</div><br>
		<div id="camBt">
			<button type="button" class="btn btn-primary" onclick="location.href='/camBoard/list'">캠페인 둘러보기</button>
		</div>
	</div>
	</div><br><br>

	<hr><br>
	<div style="text-align: center; padding: 20px;">
		<p style="font-weight: bold;">후원자님께서 보내주신 소중한 후원금은<br>
			지금 이 순간에도 많은 변화를 이뤄내고 있습니다.</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
<div id="back-top" >
	<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>
function check() {
	if(ac.amount.value == "") {
		alert("후원하실 금액을 입력해 주세요.");
	    ac.amount.focus();
	    return false;
	} else {
		return true;
	} 
}
</script>
</body>
</html>