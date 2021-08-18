<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	a {
	  text-decoration: none;
	}
	body {
	  background: -webkit-linear-gradient(bottom, #2dbd6e, #a6f77b);
	  background-repeat: no-repeat;
	}
	label {
	  font-family: "Raleway", sans-serif;
	  font-size: 11pt;
	}
	#forgot-pass {
	  color: #2dbd6e;
	  font-family: "Raleway", sans-serif;
	  font-size: 10pt;
	  margin-top: 3px;
	  text-align: right;
	}
	#card {
	  background: #fbfbfb;
	  border-radius: 8px;
	  box-shadow: 1px 2px 8px rgba(0, 0, 0, 0.65);
	  height: 410px;
	  margin: 6rem auto 8.1rem auto;
	  width: 329px;
	}
	#card-content {
	  padding: 12px 44px;
	}
	#card-title {
	  font-family: "Raleway Thin", sans-serif;
	  letter-spacing: 4px;
	  padding-bottom: 23px;
	  padding-top: 13px;
	  text-align: center;
	}
	#signup {
	  color: #2dbd6e;
	  font-family: "Raleway", sans-serif;
	  font-size: 10pt;
	  margin-top: 16px;
	  text-align: center;
	}
	#submit-btn {
	  background: -webkit-linear-gradient(right, #a6f77b, #2dbd6e);
	  border: none;
	  border-radius: 21px;
	  box-shadow: 0px 1px 8px #24c64f;
	  cursor: pointer;
	  color: white;
	  font-family: "Raleway SemiBold", sans-serif;
	  height: 42.3px;
	  margin: 0 auto;
	  margin-top: 50px;
	  transition: 0.25s;
	  width: 153px;
	}
	#submit-btn:hover {
	  box-shadow: 0px 1px 18px #24c64f;
	}
	.form {
	  align-items: left;
	  display: flex;
	  flex-direction: column;
	}
	.form-border {
	  background: -webkit-linear-gradient(right, #a6f77b, #2ec06f);
	  height: 1px;
	  width: 100%;
	}
	.form-content {
	  background: #fbfbfb;
	  border: none;
	  outline: none;
	  padding-top: 14px;
	}
	.underline-title {
	  background: -webkit-linear-gradient(right, #a6f77b, #2ec06f);
	  height: 2px;
	  margin: -1.1rem auto 0 auto;
	  width: 89px;
	}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container"><br>
	<div id="card">
		<div id="card-content">
			<div id="card-title">
				<h2>로그인</h2>
				<div class="underline-title"></div>
			</div>
			<form method="post" class="form" action="/adAuth/adLogin">
				<label for="auth_id" style="padding-top:13px">&nbsp;아이디</label>
				<input id="auth_id" class="form-content" type="text" name="auth_id" autocomplete="on" required />
				<div class="form-border"></div>
				<label for="auth_pw" style="padding-top:22px">&nbsp;비밀번호</label>
				<input id="auth_pw" class="form-content" type="password" name="auth_pw" required />
				<div class="form-border"></div>
				<input id="submit-btn" type="submit" name="submit" value="LOGIN" />
			</form>
		</div>
	</div>
</div>
</body>
</html>
