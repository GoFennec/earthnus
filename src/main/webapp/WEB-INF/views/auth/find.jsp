<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
.login-container {
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.login-logo img {
	position: absolute;
	width: 20%;
	margin-top: 19%;
	background: #282726;
	border-radius: 4.5rem;
	padding: 5%;
}

.login-form-1 {
	padding: 9%;
	background: #282726;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.login-form-2 {
	padding: 9%;
	background: #f05837;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-2 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.btnSubmit {
	font-weight: 600;
	width: 50%;
	color: #282726;
	background-color: #fff;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
}

.btnForgetPwd {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.btnForgetPwd:hover {
	text-decoration: none;
	color: #fff;
}
</style>
<title>EARTH & US</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container login-container">

		<div class="py-5 text-center" style="margin-bottom: 5rem">
			<a href="/"><img class="d-block mx-auto mb-4"
				src="/resources/assets/img/logo/loder.png" alt=""></a>
		</div>
		<div class="row">
			<div class="col-md-6 login-form-1">
				<h3>아이디 찾기</h3>
				<form action="">
				<div class="row g-3">
					<div class="col-md-9" style="padding-right: 0px">
						<input type="text" name="mem_id" class="form-control" id="find_id" placeholder="아이디">
						<div class="invalid-feedback">필수 입력사항입니다.</div>
					</div>
					<div class="col-md-9" style="padding-right: 0px">
						<input type="text" name="mem_id" class="form-control" id="find_id" placeholder="이메일">
						<div class="invalid-feedback">필수 입력사항입니다.</div>
					</div>
					<div class="col-md-3" style="margin-top:5px;">
              			<button type="button" class="w-100 btn btn-primary btn-lg" style="padding-left:18px; font-size:13px" id="testBtn2">인증번호 받기</button>
            		</div>
					<div class="col-md-9" style="padding-right: 0px">
						<input type="text" name="mem_id" class="form-control" id="find_id" placeholder="인증번호">
						<div class="invalid-feedback">필수 입력사항입니다.</div>
					</div>
					</div>
					<div class="form-group"
						style="text-align: center; margin-top: 2rem">
						<input type="submit" class="btnSubmit" value="아이디 찾기" />
					</div>
					
				</form>
			</div>
			<div class="col-md-6 login-form-2">
				<h3>비밀번호 찾기</h3>
				<form action="">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Your Email *"
							value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Your Password *" value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Your Password *" value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Your Password *" value="" />
					</div>
					<div class="form-group"
						style="text-align: center; margin-top: 2rem">
						<input type="submit" class="btnSubmit" value="Login" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>