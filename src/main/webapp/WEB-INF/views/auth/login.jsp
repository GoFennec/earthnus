
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>로그인</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sign-in/">



<!-- Bootstrap core CSS -->
<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<main class="form-signin">
		<form method="post" class="form" action="/auth/login">
			<img class="mb-4" src="/resources/assets/img/logo/loder.png" alt="EARTH&US로고" title="loader.png"
				width="80" height="65">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>

			<div class="form-floating">
				<label for="floatingInput">&nbsp;&nbsp;아이디&nbsp;&nbsp;</label>
					<input id="auth_id" class="form-content" type="text" name="auth_id"
					autocomplete="on" placeholder="아이디를입력해주세요" required /> 
			</div>
			<div class="form-floating">
			 <label for="floatingPassword">비밀번호</label>
				<input id="auth_pw" class="form-content" type="password"
					name="auth_pw" placeholder="비밀번호를입력해주세요" required />
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					아이디 기억하기
				</label>
			</div>
			<a href="javascript:kakaoLogin();" title="카카오로그인"><img
				src=/resources/Auth/kakao_login_medium_narrow.png title="카카오로그인"
				alt="카카오톡으로 로그인"></a>

			  <div class="col-md-3" vertical-align="middle;" style="margin-top:30px;" >
				<button class="w-100 btn btn-lg btn-primary" text-align="center" type="submit" >로그인</button>
			</div>
			<div>
				<a href="/auth/find" title="아이디/비밀번호찾기">아이디/비밀번호찾기</a> 
				<a href="#" title="회원가입">회원가입</a>
			</div>
		</form>
	</main>

	<!-- 카카오 스크립트 -->

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		$(function() {
			if ("${id}" != null && "${id}" != "") {
				$('#auth_id').val("${id}");
			}
		});
		Kakao.init('79da4f129a3ce2a46dfcf9f744940353'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API
							.request({
								/* url: '/v1/user/unlink', */
								url : '/v2/user/me',
								success : function(response) {
									console.log(response);
									console.log("property_keys:"
											+ response.properties.nickname);

									location.href = "/member/join?nickname="
											+ nickname;

								},
								fail : function(error) {
									console.log(error);
								},
							})
				},
				fail : function(error) {
					console.log(error);
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>

</body>
</html>
