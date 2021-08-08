<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>Card</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

  <div id="card">
    <div id="card-content">
      <div id="card-title">
        <h2>로그인</h2>
        <div class="underline-title"></div>
      </div>
      <form method="post" class="form" action="/auth/login">
        <label for="user-email" style="padding-top:13px">
            &nbsp;아이디
          </label>
        <input id="auth_id" class="form-content" type="text" name="auth_id" autocomplete="on" required />
        <div class="form-border"></div>
        <label for="user-password" style="padding-top:22px">&nbsp;비밀번호
          </label>
        <input id="auth_pw" class="form-content" type="password" name="auth_pw" required />
        <div class="form-border"></div>
        <a href="#" title="비밀번호찾기">
          <legend id="forgot-pass">아이디 / 비밀번호찾기</legend></a>
          <a href="javascript:kakaoLogin();" title="카카오로그인"><img src=/resources/Auth/kakao_login_medium_narrow.png title="카카오로그인" alt="카카오톡으로 로그인"></a>
        <input id="submit-btn" type="submit" name="submit" value="LOGIN" />
        <a href="/member/join" id="signup" title="회원가입">회원가입</a>
       
      </form>
      
    </div>
  </div>



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
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  

</script>
</body>

</html>
