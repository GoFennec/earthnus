<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>EARTH & US</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">

    

    <!-- Bootstrap core CSS -->
	<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      main{
      	padding-bottom:100px;
      }
      
       .form-control{
  		height:50px;
  		font-size:30px;
	   }
      
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/resources/assets/css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="/WEB-INF/views/header.jsp"/>
    
<div class="container" style="max-width:400px">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/resources/assets/img/logo/loder.png" alt="" >
      <h1>회원가입</h1>
    </div>

    <div class="row g-5">
      <div class="">
        <form class="needs-validation" action="/member/join" method="post">
          <div class="row g-3">
          
            <div class="col-12">
              <label for="firstName" class="form-label">아이디</label>
              <input type="text" name="mem_id" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
               	 필수 입력사항입니다.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">비밀번호</label>
              <input type="password" name="mem_pw" class="form-control" id="Password" placeholder="" required>
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
              <label for="username" class="form-label">비밀번호 확인</label>
              <input type="password" class="form-control" id="PasswordCheck" placeholder="" required>
              <div class="invalid-feedback" >
                	필수 입력사항입니다.
              </div>
            </div>
            
           <script type="text/javascript">
				$(function(){ 
					$("#alert-success").hide(); 
					$("#alert-danger").hide(); 
					$("input").keyup(function(){ 
						var pwd1=$("#Password").val(); 
						var pwd2=$("#PasswordCheck").val(); 
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
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
            

            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <input type="text" name="mem_name"class="form-control" id="username" placeholder="" required>
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
              <label for="username" class="form-label">생년월일 </label>
              <input type="date" name="mem_birth" class="form-control" id="birth" placeholder="" required>
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
            <label for="username" class="form-label">성별 </label>
            <select name="mem_gender">
    			<option value="male">남자</option>
    			<option value="female">여자</option>
    			<option value="non">선택 안함</option>
			</select>
			<div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
			</div>
			 
			
            <div class="col-12">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="postcode" placeholder="우편번호" required onkeyup='call_addr()'>
              <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			  <input type="text" class="form-control" id="address" placeholder="주소" onkeyup='call_addr()'>
			  <input type="text" class="form-control" id="detailAddress" placeholder="상세주소" onkeyup='call_addr()'>
			  <input type="text" class="form-control" id="extraAddress" placeholder="참고항목" onkeyup='call_addr()'>
			  <input type="hidden" id="address_all" name="mem_addr">
              <div class="invalid-feedback">
               		 필수 입력사항입니다.
              </div>
            </div>
            
            <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>
			
			<script>
				function call_addr(){
 					if(document.getElementById("postcode").value && document.getElementById("address").value && document.getElementById("detailAddress").value){
  					document.getElementById('address_all').value = document.getElementById('postcode').value + '&' + document.getElementById('address').value + '&' + document.getElementById('detailAddress').value;
 					}
				}
			</script>
          </div>

          <div class="row gy-3">
            <div class="col-md-6">
              <label for="cc-name" class="form-label">이메일</label>
              <input type="text" name="mem_email" class="form-control" id="cc-name" placeholder="" required>
              <div class="invalid-feedback">
               	 필수 입력사항입니다.
              </div>
            </div>
			<span>@</span>
            <div class="col-md-4">
              <label for="cc-number" class="form-label"></label>
              <input type="text" class="form-control" id="cc-number" placeholder="">
              <div class="invalid-feedback">
               	 필수 입력사항입니다.
              </div>
            </div>

            <div class="col-md-4">
              <label for="cc-expiration" class="form-label">전화번호</label>
              <input type="text" name="mem_tel" class="form-control" id="cc-expiration" placeholder="" required>
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>
 
            <div class="col-md-4">
              <label for="cc-cvv" class="form-label"></label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="">
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-md-4">
              <label for="cc-cvv" class="form-label"></label>
              <input type="text" class="form-control" id="cc-cvv" placeholder="">
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
            </div>

          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
        </form>
      </div>
    </div>
  </main>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>

<script>
$(function() {
	var addrStr = "${member.MEM_ADDR}";
	var addArr = addrStr.split("&");
	$('#postcode').val(addArr[0]);
	$('#address').val(addArr[1]);
	$('#detailAddress').val(addArr[2]);
	$('#extraAddress').val(addArr[3]);
});
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").value = '';
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>


    <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>

      <script src="/resources/assets/js/form-validation.js"></script>
  </body>
</html>
