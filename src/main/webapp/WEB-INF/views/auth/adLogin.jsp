<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/logo.png" rel="icon">
  <title>Admin - Login</title>
  <link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/ruang-admin.min.css" rel="stylesheet">
	
	<style type="text/css">
		#loginDiv{
			padding-top:150px;
		}
		#font{
			font-size:3rem;
		}
		#logo{
			text-align:center;
		}
		img{
			width:300px;
			height:76;
		}
	</style>

</head>

<body class="bg-gradient-login">
  <!-- Login Content -->
  <div class="container-login">
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9" id="loginDiv">
      <div id="logo"><img src="/resources/assets/img/logo/logo.png"  onclick="location.href='/adLogout2'" style="cursor:pointer;" alt="로고이미지"><a onclick="location.href='/'"></a></div>
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h4 class="text-gray-900 mb-4" id="font">ADMIN</h4>
                  </div>
                  <form class="user" method="post"  action="/auth/adLogin">
                    <div class="form-group">
                      <input id="auth_id" class="form-control" type="text" name="auth_id" autocomplete="on" placeholder="아이디" required />
                    </div>
                    <div class="form-group">
                   <input id="auth_pw" class="form-control" type="password" name="auth_pw" placeholder="비밀번호" required />
                    </div>
                    <div class="form-group">
                      <input type="submit" class="btn btn-primary btn-block" value="로그인">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Login Content -->
  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.min.js"></script>
  <script src="/resources/assets/js/ruang-admin.min.js"></script>
</body>

</html>
