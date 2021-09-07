<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>EARTH & US</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="resources/assets/css/progressbar_barfiller.css">
<link rel="stylesheet" href="resources/assets/css/gijgo.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/animated-headline.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">


<!-- CHEBOARD -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- CAMBOARD -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.testimonial{
    margin-bottom: 10px;
}

    .testimonial-section {
        width: 100%;
        height: auto;
        padding: 15px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        position: relative;
        border: 1px solid #fff;
    }
    .testimonial-section:after {
        top: 100%;
        left: 50px;
        border: solid transparent;
        content: " ";
        position: absolute;
        border-top-color: #fff;
        border-width: 15px;
        margin-left: -15px;
    }

    .testimonial-desc {
        margin-top: 20px;
        text-align:left;
        padding-left: 15px;
    }
        .testimonial-desc img {
            border: 1px solid #f5f5f5;
            border-radius: 150px;
            height: 70px;
            padding: 3px;
            width: 70px;
            display:inline-block;
            vertical-align: top;
        }

        .testimonial-writer{
            display: inline-block;
            vertical-align: top;
            padding-left: 10px;
        }

            .testimonial-writer-name{
                font-weight: bold;
            }

            .testimonial-writer-designation{
                font-size: 85%;
            }

            .testimonial-writer-company{
                font-size: 85%;
            }
    /*---- Outlined Styles ----*/
    .testimonial.testimonial-default{
        
    }
        .testimonial.testimonial-default .testimonial-section{
            border-color: #777;
        }

            .testimonial.testimonial-default .testimonial-section:after{
                border-top-color: #777;
            }

        .testimonial.testimonial-default .testimonial-desc{
            
        }

            .testimonial.testimonial-default .testimonial-desc img{
                border-color: #777;
            }

            .testimonial.testimonial-default .testimonial-writer-name{
                color: #777;
            }



    .testimonial.testimonial-success{
        
    }
        .testimonial.testimonial-success .testimonial-section{
            border-color: #5CB85C;
            color: #449d44;
            background-color: rgba(92, 184, 92, 0.1);
        }

            .testimonial.testimonial-success .testimonial-section:after{
                border-top-color: #5CB85C;
            }

        .testimonial.testimonial-success .testimonial-desc{
            
        }

            .testimonial.testimonial-success .testimonial-desc img{
                border-color: #5CB85C;
            }

            .testimonial.testimonial-success .testimonial-writer-name{
                color: #5CB85C;
            }

 /* card details start  */
@import url('https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto+Condensed:400,400i,700,700i');
section{
    padding: 100px 0;
}


.card-content {
	background: #ffffff;
	border: 4px;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
}

.card-img {
	position: relative;
	overflow: hidden;
	border-radius: 0;
	z-index: 1;
}

.card-img img {
	width: 100%;
	height: auto;
	display: block;
}

.card-img span {
	position: absolute;
    top: 15%;
    left: 12%;
    background: #1ABC9C;
    padding: 6px;
    color: #fff;
    font-size: 12px;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
    transform: translate(-50%,-50%);
}
.card-img span h4{
        font-size: 12px;
        margin:0;
        padding:10px 5px;
         line-height: 0;
}
.card-desc {
	padding: 1.25rem;
}

.card-desc h3 {
	color: #000000;
    font-weight: 600;
    font-size: 1.5em;
    line-height: 1.3em;
    margin-top: 0;
    margin-bottom: 5px;
    padding: 0;
}

.card-desc p {
	color: #747373;
    font-size: 14px;
	font-weight: 400;
	font-size: 1em;
	line-height: 1.5;
	margin: 0px;
	margin-bottom: 20px;
	padding: 0;
	font-family: 'Raleway', sans-serif;
}
.btn-card{
	background-color: #1ABC9C;
	color: #fff;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12);
    padding: .84rem 2.14rem;
    font-size: .81rem;
    -webkit-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    -o-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    margin: 0;
    border: 0;
    -webkit-border-radius: .125rem;
    border-radius: .125rem;
    cursor: pointer;
    text-transform: uppercase;
    white-space: normal;
    word-wrap: break-word;
    color: #fff;
}

a.btn-card {
    text-decoration: none;
    color: #fff;
}
/* End card section */  


</style>
</head>

<body>

	<!-- ? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="resources/assets/img/logo/loder.png" alt="로고이미지" title="사이트 로고이미지">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->

	<jsp:include page="header.jsp" />
	<!-- Header End -->

	<main>

		<!-- slider Area Start-->
		<div class="slider-area position-relative">
			<div class="slider-active dot-style">
				<!-- Single Slider -->
				<div
					class="single-slider hero-overly slider-height slider-bg1 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".2s">EARTH & US</h1>
									<P data-animation="fadeInUp" data-delay=".4s">
										하나뿐인 우리 지구<br> EARTH & US와 함께 지켜주세요
									</P>
									<!-- Hero-btn -->
									<div class="hero__btn">
										<a href="member/join" class="hero-btn mb-10"
											data-animation="fadeInUp" data-delay=".8s">함께하기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Single Slider -->
				<div
					class="single-slider hero-overly slider-height slider-bg2 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".2s">EARTH & US</h1>
									<P data-animation="fadeInUp" data-delay=".4s">
										삶의 터전을 잃어가는 북극곰을 도와주세요!
									</P>
									<!-- Hero-btn -->
									<div class="hero__btn">
										<a href="donation/ice" class="hero-btn mb-10"
											data-animation="fadeInUp" data-delay=".8s">북극곰 도와주기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Single Slider -->
				<div
					class="single-slider hero-overly slider-height slider-bg3 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".2s">EARTH & US</h1>
									<P data-animation="fadeInUp" data-delay=".4s">
										작은 것 부터 하나씩 시작하는 <br>
										EARTH & US 캠페인 활동
									</P>
									<!-- Hero-btn -->
									<div class="hero__btn">
										<a href="camBoard/list" class="hero-btn mb-10"
											data-animation="fadeInUp" data-delay=".8s">보러가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- slider Area End-->


		<!--? About Area Start -->
		<section class="support-company-area fix pt-10" style="margin-left: -100px;">
			<div class="support-wrapper align-items-center">
				<div class="left-content">
					<!-- section tittle -->
					<div class="section-tittle section-tittle2 mb-30">
						<span>당신의 후원이 변화를 만듭니다</span>
						<h2>우리의 지구를 <br> 함께 지켜주세요</h2>
					</div>
					<div class="support-caption" style="padding-right: 100px;">
						<p class="pera-top" style="font-size: 20px;">지구는 동시다발적인 환경문제로 심각한 위기에 처해있습니다. 하지만 우리에게는
							아직 기회가 있습니다. 지구를 지키는 가장 쉬운 방법 EARTH & US와 함께 하세요!
							EARTH & US는 기후변화, 해양 생태계 파괴와 산림 파괴, 유해
							화학물질로부터 우리의 소중한 지구를 지키기 위해 쉼없이 달려왔습니다. 환경문제 해결을 위해서는 한시라도 빨리 행동해야
							합니다. 여러분의 후원으로 EARTH & US는 환경 문제를 조사하고, 경각심을 불러 일으키는 보고서를 발표하고, 창의적인
							캠페인과 직접 행동을 펼칠 수 있습니다. 미래 세대가 깨끗한 세상에서 살 수 있도록, 지구를 위한 변화를 EARTH & US와
							함께 만들어주세요!</p>
						<a href="/donation/list" class="border-btn">후원하기</a>
					</div>
				</div>
				<div class="right-content">
					<!-- img -->
					<div class="right-img">
						<img src="resources/assets/img/gallery/safe_in.png" alt="지구를지키자" title="지구지키기포스터를들고있는소녀">
					</div>
					<div class="support-img-cap text-center d-flex">
						<div class="single-one">
							<span>${getTotal_pay}명</span>
							<p>총 후원자 수</p>
						</div>
						<div class="single-two">
							<span>${getEndCam}건</span>
							<p>완료된 캠페인 수</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- About Area End -->

		<!--? Our Cases Start -->
		<div class="our-cases-area section-padding30">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-10 col-lg-10 ">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-80">
							<h2>지구를 위한 우리의 손길</h2>
							<p class="pl-20 pr-20">전 세계 많은 사람들이 푸르른 지구와 우리의 미래를 위해 힘을 모으고 있습니다. 
							<br>여러분도 동참해 주세요!</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-cases mb-40">
							<div class="cases-img">
								<img src="/resources/donation/ocean.jpg"   title="바다가 힘들어요!" alt="해양오염 사진" >
							</div>
							<div class="cases-caption">
								<h3>
									<a href="/donation/ocean">바다가 힘들어요!</a>
								</h3>
								<p>70만 종 이상 생명체가 살고있는 바다가 큰 위험에 처해있습니다.
								우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.</p>
							
								<div class="prices">
									<p>
										<c:if test="${getTotal_o ne null}" >
										<span>지금까지 후원금액: ${getTotal_o}원</span>
										</c:if>
												<c:if test="${getTotal_o eq null}" >
										<span>지금까지 후원금액: 0원</span>
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-cases mb-40">
							<div class="cases-img">
								<img src="resources/donation/forest.jpg"  title="나무를 심어요!" alt="사막화가 진행되고있는 토양 사진">
							</div>
							<div class="cases-caption">
								<h3>
									<a href="/donation/forest">나무를 심어요!</a>
								</h3>
								<p>
									인간의 욕심으로 인해 숲이 줄어들고 있어요.
									숲을 터전으로 살아가고있는 생물들은 멸종위기에 처했으며, 온실가스는 흡수되지않고 대기로 방출 되고있어요.</p>
							
								<div class="prices">
									<p>
										<c:if test="${getTotal_f ne null}" >
										<span>지금까지 후원금액: ${getTotal_f}원</span>
										</c:if>
												<c:if test="${getTotal_f eq null}" >
										<span>지금까지 후원금액: 0원</span>
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-cases">
							<div class="cases-img">
								<img src="/resources/donation/plastic.jpg"  title="플라스틱이 넘쳐요!" alt="방대한 양의 플라스틱 사진" >
							</div>
							<div class="cases-caption">
								<h3>
									<a href="/donation/plastic">플라스틱이 넘쳐요!</a>
								</h3>
								<p>플라스틱은 미세 플라스틱으로 분해되어 생태계를 어지럽히고 있어요.
								플라스틱 사용을 줄여 지구를 지켜요.<br><br></p>
								
								<div class="prices">
									<p><c:if test="${getTotal_p ne null}" >
										<span>지금까지 후원금액: ${getTotal_p}원</span>
										</c:if>
												<c:if test="${getTotal_p eq null}" >
										<span>지금까지 후원금액: 0원</span>
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-cases">
							<div class="cases-img">
								<img  src="/resources/donation/ice.jpg"  title="북극곰을 도와줘요!" alt="삶의 터전을 잃어가는 북극곰 사진" >
							</div>
							<div class="cases-caption">
								<h3>
									<a href="/donation/ice">북극곰을 도와줘요!</a>
								</h3>
								<p>지구 온난화로 기온이 상승하여 빙하가 녹고있어요.
								북극곰과 친구들은 집을 잃어가고 있어요.<br>빠르게 녹고있는 북극을 지켜요.<br><br></p>
								<div class="prices">
									<p>
									<c:if test="${getTotal_i ne null}" >
										<span>지금까지 후원금액: ${getTotal_i}원</span>
										</c:if>
												<c:if test="${getTotal_i eq null}" >
										<span>지금까지 후원금액: 0원</span>
										</c:if>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--? Blog Area Start -->
		<section class="home-blog-area pb-padding">
			<div class="container">
				<!-- Section Tittle -->
				<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-9 col-md-11">
						<div class="section-tittle text-center mb-90">
							<h2>최근 캠페인 소식</h2>
							<p>많은 사람들이 푸르른 지구와 우리의 미래를 위해 힘을 모으고 있습니다. 
							<br>새로운 EARTH & US 캠페인 활동을 확인하시고 관심 가져 주세요!</p>
						</div>
					</div>
				</div>
			
    <div class="container">
        <div class="row">
            <c:forEach items="${getCb_list}" var="camBoard">
            <div class="col-md-6">
                <div class="card-content">
                    <div class="card-img">
                        <img src="${camBoard.CAMB_FILE}" height="400px" alt="최신캠페인이미지">
                    </div>
                    <div class="card-desc">
                        <h3>${camBoard.CAMB_SUBJECT}</h3>
                        <p>${camBoard.CAMB_NAME}</p>
                            <a href="/camBoard/detail?CAMB_NAME=${camBoard.CAMB_NAME}&CAMB_NUM=${camBoard.CAMB_NUM}" class="btn-card">자세히보기</a>   
                    </div>
                </div>
            </div>
            </c:forEach>
          </div>
    </div>

				<!-- <div class="row">
				<c:forEach items="${cb_list}" var="camBoard">
					<div class="col-xl-6 col-lg-6 col-md-6">
						<div class="home-blog-single mb-30">
							<div class="blog-img-cap">
								<div class="blog-img">
									<img src="${camBoard.CAMB_FILE}" height="400px" alt="최신캠페인이미지">
								</div>
								<div class="blog-cap">
									<h3>
										<a href="/camBoard/detail?CAMB_NAME=${camBoard.CAMB_NAME}&CAMB_NUM=${camBoard.CAMB_NUM}">${camBoard.CAMB_NAME} [${camBoard.CAMB_SUBJECT}]</a>
									</h3>
									
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<div class="col-xl-6 col-lg-6 col-md-6">
						<div class="home-blog-single mb-30">
							<div class="blog-img-cap">
								<div class="blog-img">
									<img src="resources/assets/img/gallery/home-blog2.png" alt="">
								</div>
								<div class="blog-cap">
									<h3>
										<a href="blog_details.html">${cbBean.CAMB_NAME}</a>
									</h3>
									<p>The automated process starts as soon as your clothes go
										into the machine. Duis cursus, mi quis viverra ornare.</p>
								</div>
							</div>
						</div>
					</div>-->
				</div>
		</section>
		





<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-9 col-md-11">
						<div class="section-tittle text-center mb-30" >
							<h2>최근 응원 릴레이</h2>
							<p>후원에 참여한 많은분들이 응원 메시지를 보내주고 있습니다. 
							<br>함께 응원해 주세요!</p>
						</div>
					</div>
				</div>
			<div class="container" style="padding-top:30px">	
	<div class="row">
        <c:forEach items="${getCh_list}" var="cheBoard">
        <div class="col-sm-6">
            <div id="tb-testimonial" class="testimonial testimonial-success">
               
                <div class="testimonial-section" id="chContent" style="cursor: pointer;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" onclick="location.href='/cheBoard/list'" >
                ${cheBoard.cheb_content}
                </div>
                <div class="testimonial-desc">
                    <c:if test="${cheBoard.cheb_dname eq '숲'}">
                    <img src="/resources/donation/forest04.png"  alt="숲" title="숲일러스트"/>
                    </c:if>
                     <c:if test="${cheBoard.cheb_dname eq '바다'}">
                    <img src="/resources/donation/ocean04.png"  alt="바다" title="바다일러스트"/>
                    </c:if>
                     <c:if test="${cheBoard.cheb_dname eq '북극곰'}">
                    <img src="/resources/donation/ice04.png"  alt="북극곰" title="북극곰일러스트"/>
                    </c:if>
                     <c:if test="${cheBoard.cheb_dname eq '친환경'}">
                    <img src="/resources/donation/plastic04.png"  alt="친환경" title="친환경일러스트"/>
                    </c:if>
                    <div class="testimonial-writer">
                    	<div class="testimonial-writer-name"> ${cheBoard.cheb_id}</div>
                    	<div class="testimonial-writer-designation" id="d_name"> ${cheBoard.cheb_dname} 후원</div>
                    	<div class="testimonial-writer-company">${cheBoard.cheb_date}</div>
                    </div>
                </div>
            </div>   
		</div>
		</c:forEach>
	</div> 
</div>






	</main>
	<jsp:include page="footer.jsp" />
	<!-- Footer End-->
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->

	<script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="resources/assets/js/wow.min.js"></script>
	<script src="resources/assets/js/animated.headline.js"></script>
	<script src="resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="resources/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="resources/assets/js/jquery.sticky.js"></script>
	<!-- Progress -->
	<script src="resources/assets/js/jquery.barfiller.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.countdown.min.js"></script>
	<script src="assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="resources/assets/js/contact.js"></script>
	<script src="resources/assets/js/jquery.form.js"></script>
	<script src="resources/assets/js/jquery.validate.min.js"></script>
	<script src="resources/assets/js/mail-script.js"></script>
	<script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

</body>
</html>