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
					<img src="resources/assets/img/logo/loder.png" alt="">
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
					class="single-slider hero-overly slider-height slider-bg1 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".2s">Environment</h1>
									<P data-animation="fadeInUp" data-delay=".4s">
										Provide us a green and healthy life<br> we need to
										protect
									</P>
									<!-- Hero-btn -->
									<div class="hero__btn">
										<a href="resources/industries.html" class="hero-btn mb-10"
											data-animation="fadeInUp" data-delay=".8s">Join Us Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Single Slider -->
				<div
					class="single-slider hero-overly slider-height slider-bg1 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
								<div class="hero__caption">
									<h1 data-animation="fadeInUp" data-delay=".2s">Environment</h1>
									<P data-animation="fadeInUp" data-delay=".4s">
										Provide us a green and healthy life<br> we need to
										protect
									</P>
									<!-- Hero-btn -->
									<div class="hero__btn">
										<a href="resources/industries.html" class="hero-btn mb-10"
											data-animation="fadeInUp" data-delay=".8s">Join Us Now</a>
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
		<section class="support-company-area fix pt-10">
			<div class="support-wrapper align-items-center">
				<div class="left-content">
					<!-- section tittle -->
					<div class="section-tittle section-tittle2 mb-30">
						<span>당신의 후원이 변화를 만듭니다</span>
						<h2>우리의 지구를 함께 지켜주세요</h2>
					</div>
					<div class="support-caption">
						<p class="pera-top">지구는 동시다발적인 환경문제로 심각한 위기에 처해있습니다. 하지만 우리에게는
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
						<img src="resources/assets/img/gallery/safe_in.png" alt="">
					</div>
					<div class="support-img-cap text-center d-flex">
						<div class="single-one">
							<span>${total_o}원</span>
							<p>총 후원 금액</p>
						</div>
						<div class="single-two">
							<span>230</span>
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
								<p>바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.
								그러나 지금 바다는 그 어느 때보다 큰 위험에 처해있습니다.
								우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.</p>
							
								<div class="prices">
									<p>
										<span>지금까지 후원금액: ${total_o}원</span>
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
								<p>숲은 육지에 서식하는 많은 동식물들의 집입니다.
									인간의 욕심으로 인해 전 세계 산림의 절반이 사라졌습니다.
									숲을 터전으로 살아가고있는 생물들은 멸종위기에 처했으며, 온실가스는 흡수되지않고 대기로 방출되고있습니다.</p>
							
								<div class="prices">
									<p>
										<span>지금까지 후원금액: ${total_f}원</span>
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
								<p>플라스틱은 미세 플라스틱으로 분해됩니다.
								수많은 해양 동물들은 이를 먹이로 착각하고 섭취하여 폐사에 이르고 있으며, 
								결국 미세 플라스틱은 해양 먹이사슬을 타고 우리의 식탁으로 돌아옵니다.<br><br></p>
								
								<div class="prices">
									<p>
										<span>지금까지 후원금액: ${total_p}원</span>
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
								<p>지구 온난화로 북극 기온이 상승하여 빙하가 녹고있습니다.
								북극을 해양보호구역으로 만들어 파괴적인 어업과 석유 시추의 중단이 시급합니다.
								빠르게 녹고있는 북극을 지켜요.<br><br></p>
								<div class="prices">
									<p>
										<span>지금까지 후원금액: ${total_i}원 </span>
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
			
				<div class="row">
				<c:forEach items="${cb_list}" var="camBoard">
					<div class="col-xl-6 col-lg-6 col-md-6">
						<div class="home-blog-single mb-30">
							<div class="blog-img-cap">
								<div class="blog-img">
									<img src="${camBoard.CAMB_FILE}" alt="최신캠페인이미지">
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
				<!-- 	<div class="col-xl-6 col-lg-6 col-md-6">
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
			</div>
		</section>
		<!-- Blog Area End -->
		<!-- Our Cases End -->
		<!--? Services Area Start -->
		<!--  <div class="service-area section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-11">
                        <div class="single-cat text-center mb-30">
                            <div class="cat-icon">
                                <img src="resources/assets/img/gallery/services1.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="#">Clean Water</a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-11">
                        <div class="single-cat text-center mb-30">
                            <div class="cat-icon">
                                <img src="resources/assets/img/gallery/services1.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="#">Clean Water</a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-11">
                        <div class="single-cat text-center mb-30">
                            <div class="cat-icon">
                                <img src="resources/assets/img/gallery/services2.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="#">Renewable energy</a></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-11">
                        <div class="single-cat text-center mb-30">
                            <div class="cat-icon">
                                <img src="resources/assets/img/gallery/services3.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="#">Protect animals</a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       Services Area End -->





	<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-9 col-md-11">
						<div class="section-tittle text-center mb-90">
							<h2>최근 응원 릴레이</h2>
							<p>후원에 참여한 많은분들이 응원 메시지를 보내주고 있습니다. 
							<br>함께 응원해 주세요!</p>
						</div>
					</div>
				</div>
			<div class="container" style="padding-top:30px">	
	<div class="row">
        <c:forEach items="${ch_list}" var="cheBoard">
        <div class="col-sm-6">
            <div id="tb-testimonial" class="testimonial testimonial-success">
                <div class="testimonial-section">
                ${cheBoard.cheb_content}
                </div>
                <div class="testimonial-desc">
                    <img src="/resources/donation/ice04.png"  alt="" />
                    <div class="testimonial-writer">
                    	<div class="testimonial-writer-name"> ${cheBoard.cheb_id}</div>
                    	<div class="testimonial-writer-designation" id="d_name"> ${cheBoard.cheb_dname}</div>
                    	<a href="/cheBoard/list" class="testimonial-writer-company"> <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${cheBoard.cheb_date}" /></a>
                    </div>
                </div>
            </div>   
		</div>
		</c:forEach>
	</div>
</div>












		<!--? Visit Our Tailor Start -->
	<!-- 	<div class="visit-tailor-area fix">
			<!--Right Contents  --/>
			<div class="tailor-offers"></div>
			<!-- left Contents --/>
			<div class="tailor-details">
				<span>Our Mission</span>
				<h2>Our main goal is to protect animals</h2>
				<p>The automated process starts as soon as your clothes go into
					the machine. Duis cursus, mi quis viverra ornare, eros dolor
					interdum nulla, ut commodo diam libero vitae erat. Aenean faucibus
					nibh et justo cursus id rutrum lorem imperdiet. Nunc ut sem vitae
					risus tristique posuere.</p>
				<p class="pera-bottom">Interdum nulla, ut commodo diam libero
					vitae erat. Aenean faucibus nibh et justo cursus id rutrum lorem
					imperdiet. Nunc ut sem vitae risus tristique posuere.</p>
				<div class="footer-tittles">
					<p>CEO, Consulto</p>
					<h2>Capcilena Hanry</h2>
				</div>
			</div>
		</div> 
		<!-- Visit Our Tailor End -->


	

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