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
      <a href="/" title="???????????? ????????????"><img class="d-block mx-auto mb-4" src="/resources/assets/img/logo/loder.png" alt="???????????? ????????????" ></a>
    </div>
    
    	<div class="row" id="outter">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="/auth/find" id="login-form-link">????????? ??????</a>
							</div>
							<div class="col-xs-6">
								<a href="" class="active" id="register-form-link">???????????? ??????</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="/auth/findPass" method="post" style="display: block;" novalidate>
									<br>
									<div class="col-12" id="mem_id_div">
              							<label for="username" class="form-label">?????????</label>
              							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="" required>
              							<div class="invalid-feedback">
               								 ?????? ?????????????????????.
              							</div>
            						</div>
            						<br>
									<div class="col-12" id="mail_customer_div">
              							<label for="username" class="form-label">??????</label>
              							<input type="text" class="form-control" id="mail_customer" name="mail_customer" placeholder="" required>
              							<div class="invalid-feedback">
               								 ?????? ?????????????????????.
              							</div>
            						</div>
            						<br>
            						<div class="col-12" id="mail_receiver_div">
              							<label for="username" class="form-label">????????? ??????</label>
              							<input type="email" class="form-control" id="mail_receiver" name="mail_receiver" placeholder="" required>
              							<div class="invalid-feedback">
               								 ?????? ?????????????????????.
              							</div>
            						</div>
            						<br>
            						<div class="form-group" id="login-submit-div">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" id="button">
												<button type="button" name="login-submit" id="login-submit" tabindex="4" onclick="findpw()" class="w-100 btn btn-primary btn-lg">?????? ???????????? ??????</button>
											</div>
										</div>
									</div>
									<div class="form-group" id="login-div">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3" id="button">
												<button type="button" name="login-submit" id="login" onclick="location.href='/auth/login'" tabindex="4" class="w-100 btn btn-primary btn-lg">?????????</button>
											</div>
										</div>
									</div>
									
									<script type="text/javascript">
									function findpw(){
										var mem_id = $("#mem_id").val();
										var mail_customer = $("#mail_customer").val();
										var mail_receiver = $("#mail_receiver").val();
										
										if(mail_customer == ""){
											alert("????????? ??????????????????.");
											return;
										}else if(mail_receiver == ""){
											alert("??????????????? ????????? ????????? ????????? ??????????????????.");
											return;
										}else if(mem_id == ""){
											alert("???????????? ??????????????????.");
											return;
										}
										$.ajax({
								   			type: "POST", //?????? ????????? ??????
								  			 url:"/auth/findpw",
								   			data: {"mem_id":mem_id, "findName":mail_customer, "findEmail":mail_receiver},
								   			dataType: 'json', //????????? ?????? URL??? ????????? ???????????? ????????? ??????
								   			success : function(result){
									   
								      			if(result.error === true){
								      				alert('???????????? ???????????? ???????????? ?????? ??????????????? ??????????????????. \n?????? ??????????????? ???????????? ?????? ??? ??????????????? ????????? ?????????. \n?????? ??????????????? ?????? ????????? ???????????? ???????????? ?????? ??????????????????.');
								      				$("#login-submit-div").hide();
								      				$("#login-div").show();
								      			}else if(result.error === false){
								    	  			alert('???????????? ????????? ?????? ??????????????????.');
								      			}
								   			},
								   		 error:function(request,status,error){
								   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								   	        alert("?????? ??????");
								      			//?????? ????????? ???????????? ??????(??????)
								   				}
											});
									}
									
									$(function(){
										$("#emailCheck").hide();
										$("#login-submit2").hide();
										$("#change").hide();
										$("#login-div").hide();
									});
    								</script>
								</form>
								<br>
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