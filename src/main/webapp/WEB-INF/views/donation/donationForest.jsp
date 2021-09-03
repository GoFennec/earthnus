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
 background-image: url('/resources/donation/forestThema1.jpg');
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
                	<h1 style="font-size: 2.5em; color: white;">나무를 심어요!</h1>
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
	 	<c:forEach items="${forest}" var="donation" begin="0" end="2">
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
		
		<c:forEach items="${forest}" var="donation" begin="3" end="3">
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
			<h2 style="color: #388E3C;">숲은 육지에 서식하는 많은 동식물들의 집입니다.</h2><br>
			<p>숲은 야생동물의 서식지이자 깨끗한 공기를 지켜주고 기후변화를 완화시키는 등 지구 전체를 위해 중요한 역할을 합니다.
			육지에 서식하는 식물과 동물 종의 약 3분의 2가 숲에 살고 있으며, 크고 작은 지역사회에 생명을 불어넣습니다.</p>
		</div>
	</div>
	<div class="col-md-5 col-12">
		<img src="/resources/donation/forestThema2.jpg" title="" alt="" width="100%">
	</div>
	</div><br><br>
	
	<div class="row">
	<div class="col-md-8 col-12">
		<img src="/resources/donation/forestThema3.jpg" title="" alt="" width="100%">
	</div>
	<div class="col-md-4 col-12">
		<div>
			<h2 style="color: #388E3C;">EARTH & US 활동</h2><br>
			<p>EARTH & US는 무분별한 벌채와 불법 목재 거래 등 산림 파괴를 막고 전 세계의 숲을 보호하기 위해 싸우고 있습니다.
			우리는 여러 환경 단체 및 시민들과 연대하고 함께 행동하며 자신들의 이익을 위해 숲을 파괴하는 기업과 정부에 대항합니다.</p>
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