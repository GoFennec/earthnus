<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/resources/assets/css/form-validation.css" rel="stylesheet">

<style type="text/css">

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}

#outter{
	padding-bottom:150px;
}

#button{
	padding-top:30px;
}

</style>
<title>EARTH & US</title>
</head>
<body class="bg-light">

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="container">
	
	<div class="py-5 text-center">
      <a href="/"><img class="d-block mx-auto mb-4" src="/resources/assets/img/logo/loder.png" alt="" ></a>
    </div>
    
    	<div class="row" id="outter">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="/auth/find" id="login-form-link">아이디 찾기</a>
							</div>
							<div class="col-xs-6">
								<a href="" class="active" id="register-form-link">비밀번호 찾기</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="/auth/findPass" method="post" style="display: block;" novalidate>
									<div class="col-12" id="mem_id_div">
              							<label for="username" class="form-label">아이디</label>
              							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="" required>
              							<div class="invalid-feedback">
               								 필수 입력사항입니다.
              							</div>
            						</div>
									<div class="col-12" id="mail_customer_div">
              							<label for="username" class="form-label">이름</label>
              							<input type="text" class="form-control" id="mail_customer" name="mail_customer" placeholder="" required>
              							<div class="invalid-feedback">
               								 필수 입력사항입니다.
              							</div>
            						</div>
            						<div class="col-12" id="mail_receiver_div">
              							<label for="username" class="form-label">이메일 주소</label>
              							<input type="email" class="form-control" id="mail_receiver" name="mail_receiver" placeholder="" required>
              							<div class="invalid-feedback">
               								 필수 입력사항입니다.
              							</div>
            						</div>
            						<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" id="button">
												<button type="button" name="login-submit" id="login-submit" tabindex="4" onclick="findpw()" class="w-100 btn btn-primary btn-lg">인증번호 전송</button>
											</div>
										</div>
									</div>
									
									<script type="text/javascript">
									
									function findpw(){
										var mem_id = $("#mem_id").val();
										var mail_customer = $("#mail_customer").val();
										var mail_receiver = $("#mail_receiver").val();
										
										if(mail_customer == ""){
											alert("이름를 입력해주세요.");
											return;
										}else if(mail_receiver == ""){
											alert("인증번호를 전송할 이메일 주소를 입력해주세요.");
											return;
										}else if(mem_id == ""){
											alert("아이디를 입력해주세요.");
											return;
										}
										$.ajax({
								   			type: "POST", //요청 메소드 방식
								  			 url:"/auth/findpw",
								   			data: {"mem_id":mem_id, "findName":mail_customer, "findEmail":mail_receiver},
								   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
								   			success : function(result){
									   
								      			if(result.error === true){
								      				alert('입력하신 이메일로 회원가입 인증번호를 발송했습니다. \n인증번호가 오지 않으면 입력하신 이메일을 다시 확인해주세요.');
								      				$("#login-submit").hide();
								      				$("#emailCheck").show();
													$("#login-submit2").show();
								      			}else if(result.error === false){
								    	  			alert('입력하신 정보를 다시 확인해주세요.');
								      			}
								   			},
								   		 error:function(request,status,error){
								   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								   	        alert("통신 오류");
								      			//통신 실패시 발생하는 함수(콜백)
								   				}
											});
									}
									
									$(function(){
										$("#emailCheck").hide();
										$("#login-submit2").hide();
										$("#change").hide();
									});
    								</script>
									
            						<div class="col-12" id="emailCheck">
              							<label for="username" class="form-label">이메일 인증번호</label>
              							<input type="text" class="form-control" id="mail_pw" name="mail_pw" placeholder="" required>
              							<div class="invalid-feedback">
               								 필수 입력사항입니다.
              							</div>
            						</div>
            						<div class="form-group" id="findID">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" id="button">
												<button type="button" name="login-submit" id="login-submit2" onclick="findpwCheck()" tabindex="4" class="w-100 btn btn-primary btn-lg">인증번호 확인</button>
											</div>
										</div>
									</div>
									
									<script type="text/javascript">
									function findpwCheck(){
										var mem_id = $("#mem_id").val();
										var mail_customer = $("#mail_customer").val();
										var mail_receiver = $("#mail_receiver").val();
										var mail_pw = $("#mail_pw").val();
										
										if(mail_customer == ""){
											alert("이름를 입력해주세요.");
											return;
										}else if(mail_receiver == ""){
											alert("인증번호를 전송할 이메일 주소를 입력해주세요.");
											return;
										}else if(mem_id == ""){
											alert("아이디를 입력해주세요.");
											return;
										}else if(mail_pw == ""){
											alert("인증번호를 입력해주세요.");
											return;
										}
										$.ajax({
								   			type: "POST", //요청 메소드 방식
								  			 url:"/auth/findPass",
								   			data: {"mem_id":mem_id, "findName":mail_customer, "findEmail":mail_receiver, "mail_pw":mail_pw},
								   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
								   			success : function(result){
									   
								      			if(result.error === true){
								      				alert('인증번호 일치');
								      				$("#change").show();
								      				$("#emailCheck").hide();
													$("#login-submit2").hide();
													$("#login-form").hide();
								      			}else if(result.error === false){
								    	  			alert('입력하신 정보를 다시 확인해주세요.');
								      			}
								   			},
								   		 error:function(request,status,error){
								   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								   	        alert("통신 오류");
								      			//통신 실패시 발생하는 함수(콜백)
								   				}
											});
									}
    								</script>
								</form>
								<div id="change">
									<div class="col-12">
              							<label for="username" class="form-label">변경할 비밀번호</label>
              							<input type="password" class="form-control" id="changePW" name="mail_customer" placeholder="" required>
              							<div class="invalid-feedback" id="invalid-pw2">
                							8~20자의 영문 대문자, 소문자와 특수문자로 비밀번호를 설정할 수 있습니다.
              							</div>
            						</div>
            						<div class="col-12">
              							<label for="username" class="form-label">변경할 비밀번호 확인</label>
              							<input type="password" class="form-control" id="changePWCheck" name="mail_receiver" placeholder="" required>
              							<div class="invalid-feedback">
               								 필수 입력사항입니다.
              							</div>
            						</div>
            						<div class="col-12"><div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div></div>
									<div class="col-12"><div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div></div>
            						
            						<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" id="button">
												<button type="button" name="login-submit" id="" onclick="changePW()" tabindex="4" class="w-100 btn btn-primary btn-lg">비밀번호 변경</button>
											</div>
										</div>
									</div>
									
									<script type="text/javascript">
									function changePW(){
										var changePW = $("#changePW").val();
										var mem_id = $("#mem_id").val();
										var mail_customer = $("#mail_customer").val();
										
										if(changePW == ""){
											alert("이름를 입력해주세요.");
											return;
										}else if(changePWCheck == ""){
											alert("인증번호를 전송할 이메일 주소를 입력해주세요.");
											return;
										}
										$.ajax({
								   			type: "POST", //요청 메소드 방식
								  			 url:"/auth/changePW",
								   			data: {"changePW":changePW, "mem_id":mem_id, "mail_customer":mail_customer},
								   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
								   			success : function(result){
									   
								      			if(result.error === true){
								      				alert('비밀번호 변경 완료');
								      			}else if(result.error === false){
								    	  			alert('입력하신 정보를 다시 확인해주세요.');
								      			}
								   			},
								   		 error:function(request,status,error){
								   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								   	        alert("통신 오류");
								      			//통신 실패시 발생하는 함수(콜백)
								   				}
											});
									}
									
									$(function(){
										$("#invalid-pw2").hide();
										var pwd=$("#changePW").val();
										$("input").keyup(function(){
											var match = /^[A-Za-z0-9.;\-]{8,20}$/;
											if(pwd != ""){
												if(!match.test(pwd)){
													$("#invalid-pw2").show();
												}else{
													$("#invalid-pw2").hide();
												}
											}else{
												$("#invalid-pw2").hide();
											}
										});
										
										$("#alert-success").hide(); 
										$("#alert-danger").hide(); 
										$("input").keyup(function(){ 
											var pwd1=$("#changePW").val(); 
											var pwd2=$("#changePWCheck").val(); 
										if(pwd1 != "" && pwd2 != ""){ 
												if(pwd1 == pwd2){ 
													$("#alert-success").show(); 
													$("#alert-danger").hide(); 
													$("#submit").removeAttr("disabled"); 
												}else{ 
													$("#alert-success").hide(); 
													$("#alert-danger").show();
													$("#submit").attr("disabled", "disabled"); 
											}
						 	 			} 
						 	  			if(pwd1 == "" && pwd2 == ""){ 
												$("#alert-success").hide(); 
												$("#alert-danger").hide(); 
											} 
										});
						  			});
    								</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
</body>
</html>