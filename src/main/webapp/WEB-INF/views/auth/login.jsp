<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!doctype html>
<html>
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merienda+One">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<style>
body {
	color: #999;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
}
.form-control {
	box-shadow: none;
	border-color: #ddd;
}
.form-control:focus {
	border-color: #4aba70; 
}
.login-form {
	width: 350px;
	margin: 0 auto;
	padding: 30px 0;
}
.login-form form {
	color: #434343;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.login-form h4 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 20px;
}
.login-form .avatar {
	color: #fff;
	margin: 0 auto 30px;
	text-align: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	z-index: 9;
	background: #4aba70;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}
.login-form .avatar i {
	font-size: 62px;
}
.login-form .form-group {
	margin-bottom: 20px;
}
.login-form .form-control, .login-form .btn {
	min-height: 40px;
	border-radius: 2px; 
	transition: all 0.5s;
}
.login-form .close {
	position: absolute;
	top: 15px;
	right: 15px;
}
.login-form .btn, .login-form .btn:active {
	background: #4aba70 !important;
	border: none;
	line-height: normal;
}
.login-form .btn:hover, .login-form .btn:focus {
	background: #42ae68 !important;
}
.login-form .checkbox-inline {
	float: left;
}
.login-form input[type="checkbox"] {
	position: relative;
	top: 2px;
}
.login-form .forgot-link {
	float: right;
}
.login-form .small {
	font-size: 13px;
}
.login-form a {
	color: #4aba70;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="login-form">    
    <form method="post" class="form" action="/auth/login">
		<!-- <div class="avatar"><i class="material-icons">&#xE7FF;</i></div> -->
    	<h4 class="modal-title">로그인</h4>
        <div class="form-group">
            <input type="text" class="form-control" id="auth_id" name="auth_id" placeholder="아이디" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="auth_pw" name="auth_pw" placeholder="비밀번호" required="required">
       
             </div> 
             <div>
            <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=1f09c57d8241952a7a44833618d75b13&redirect_uri=http://localhost:8090/kakaoLogin&response_type=code">
            <img src="/resources/Auth/kakao_login_medium_narrow.png" width=50%>
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
        </div><br>
         <%
    String clientId = "vDkmCgxDt2L_BtosPOoP";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8090/auth/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
         
      
       <input type="submit" class="btn btn-primary btn-block btn-lg" value="로그인"> 
         
        <a href="/member/join" class="forgot-link" title="회원가입">회원가입</a>             
         <a href="/auth/find" class="forgot-link" title="아이디/비밀번호찾기">아이디/비밀번호찾기&nbsp;&nbsp;</a> 
				
    </form>			
</div>
</body>
</html>