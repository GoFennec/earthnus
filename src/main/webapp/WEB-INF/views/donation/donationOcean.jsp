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
 background-image: url('/resources/donation/oceanThema1.jpg');
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
	<div class="slider-height2 align-items-center">
		<div class="container">
			<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            	<div class="hero-cap hero-cap2 pt-85 m-4 animated animatedFadeInUp fadeInUp">
                	<h1 style="font-size: 2.5em; color: white;">바다가 힘들어요!</h1>
                    <p style="color: white;">EARTH & US에서는 가상의 상품을 구매함으로서 기부(후원)에 동참하게 됩니다.</p>
            	</div>
            </div>
            </div>
        </div>
    </div>
</div>

<div class="service-area">
<div class="container">
<br><br>
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
							<div id="donationBt"><input type="submit" id="input-text" class="btn btn-primary" value="후원하기"/></div>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${ocean}" var="donation" begin="3" end="3">
			<div class="item col-md-3 col-6">
				<div class="single-cat text-center mb-30">
					<div class="cat-icon"><img src="${donation.d_img}" title="후원 상품 이미지" alt="금액대별 후원 상품 이미지"></div><br>
					<form action="/pay/pay" method="POST" name="ac" onsubmit="return check()">
						<input type="hidden" name="mem_id" value="${auth_id}"/>
						<input type="hidden" name="pay_dname" value="${donation.d_name}"/>
						<input type="number" name="pay_price" min="1000" max="10000000" height=20/>&nbsp;원<br><br>
					<div class="cat-cap">
							<div id="lastDonationBt"><input type="submit" class="btn btn-primary" value="자율후원"/></div>
					</div>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
<br><br><br>	
</div>
</div>

<div class="container">
	<div class="row m-4">
	<div class="col-md-7 col-12">
		<div>
			<h2 style="color: #388E3C; margin-top: 0.5em;">바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.</h2><br>
			<p>그러나 바다는 지금 플라스틱 등 각종 독성 물질로 인한 오염, 파괴적인 어업은 물론 기후변화까지 심화되며 해양 생태계는 심각한 위협에 내몰리고 있습니다.
			하지만 우리가 함께 노력한다면, 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을 것입니다.</p>
		</div>
	</div>
	<div class="col-md-5 col-12">
		<img src="/resources/donation/oceanThema2.jpg" title="바다가 힘들어요! 테마 사진 2" alt="바다거북 사진" width="100%">
	</div>
	</div><br><br>
	
	<div class="row m-4">
	<div class="col-md-8 col-12">
		<img src="/resources/donation/oceanThema3.jpg" title="바다가 힘들어요! 테마 사진 3" alt="돌고래 사진" width="100%">
	</div>
	<div class="col-md-4 col-12">
		<div>
			<h2 style="color: #388E3C; margin-top: 0.5em;">EARTH & US 활동</h2><br>
			<p>EARTH & US는 안전하고 건강한 바다를 위해 해양보호구역 지정을 요구합니다.
			파괴적인 어업에 대항하고, 플라스틱 오염과 기후변화를 막기 위한 캠페인을 펼치며 바다를 보호하기 위해 활동하고 있습니다.</p>
		</div><br>
		<div id="camBt">
			<button type="button" class="btn btn-primary" onclick="location.href='/camBoard/list'">캠페인 둘러보기</button>
		</div>
	</div>
	</div><br><br><br>
	
	<div style="text-align: center;">
		<p style="font-size: 0.8em;">후원자님께서 보내주신 소중한 후원금은<br>
			지금 이 순간에도 많은 변화를 이뤄내고 있습니다.</p>
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
<div id="back-top" >
	<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<script>
function check() {
	if(ac.pay_price.value == "") {
		alert("후원하실 금액을 입력해 주세요.");
	    ac.pay_price.focus();
	    return false;
	} else {
		return true;
	} 
}
</script>
</body>
</html>