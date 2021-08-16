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
  		font-size:15px;
	   }
	   
	   .col-12{
	   	padding-lefh:0px;
	   	padding-right:0px;
	   }
	   
	  .modal {
        text-align: center;
	  }
 
		@media screen{ 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
		}
 
	.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
	}	   
	
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/resources/assets/css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="/WEB-INF/views/header.jsp"/>
    
<div class="container" style="max-width:450px">
  <main>
    <div class="py-5 text-center">
      <a href="/"><img class="d-block mx-auto mb-4" src="/resources/assets/img/logo/loder.png" alt="loder.png" title="EARTH & US 로고" ></a>
    </div>

    <div class="row g-5">
      <div class="">
        <form class="needs-validation" action="/member/join_kakao" method="post" novalidate>
          <div class="row g-3">
          
                <div class="col-12">
              <label for="username" class="form-label">아이디</label>
              <input type="text" name="mem_id"class="form-control" value=${auth_id }  readonly>
                </div>
          
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <input type="text" name="mem_name"class="form-control" value=${auth_name } readonly>
            </div>
                        <div class="col-12">
              <label for="username" class="form-label">비밀번호</label>
              <input type="password" name="mem_pw" class="form-control" id="Password" placeholder="" required>
              <div class="invalid-feedback" id="invalid-pw">
                	필수 입력사항입니다.
              </div>
              <div class="invalid-feedback" id="invalid-pw2">
                	8~20자의 영문 대문자, 소문자와 특수문자로 비밀번호를 설정할 수 있습니다.
              </div>
            </div>
            
            <script type="text/javascript">
				$(function(){
					$("#invalid-pw2").hide();
					
					$("input").keyup(function(){
						var match = /^[A-Za-z0-9.;\-]{8,20}$/;
						var pwd = $("#Password").val();
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
				});
            </script>
            
            
            
            
            
            
            <div class="col-12">
              <label for="username" class="form-label">생년월일 </label>
              <input type="date" name="mem_birth" class="form-control" id="birth"  required>
              <div class="invalid-feedback" id="invalid-birth">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
            <label for="username" class="form-label">성별 </label>
            </div>
            <div class="col-12">
            <input type="text" name="mem_gender"class="form-control" value=${userGender } readonly>
              </div>

              <div class="col-md-9" style="padding-right:0px"><label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="postcode" placeholder="우편번호"  onkeyup='call_addr()' style="margin-top:2px" required></div>
              <div class="col-md-3" style="margin-top:53px;"><button type="button" class="w-100 btn btn-primary btn-lg" onclick="execDaumPostcode()" style="padding-left:9px; font-size:13px">우편번호 찾기</button><br></div>
			  <div class="col-md-12"><input type="text" class="form-control" id="address" placeholder="주소" onkeyup='call_addr()' required></div>
			  <div class="col-md-12"><input type="text" class="form-control" id="detailAddress" placeholder="상세주소" onkeyup='call_addr()' required></div>
			  <div class="col-md-12"><input type="text" class="form-control" id="extraAddress" placeholder="참고항목" onkeyup='call_addr()'></div>
			  <input type="hidden" id="address_all" name="mem_addr">
              <div class="invalid-feedback">
               		 필수 입력사항입니다.
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
          
            <div class="col-md-9" style="padding-right:0px">
              <label for="cc-name" class="form-label">이메일</label>
              <input type="email" name="mem_email" class="form-control" id="mem_email" value=${auth_id } readonly>
            </div>
          
            <div class="col-md-12">
              <label for="cc-expiration" class="form-label">전화번호</label>
              <input type="text" name="mem_tel" class="form-control" id="mem_tel"  maxlength='11' required>
              <div class="invalid-feedback">
                	필수 입력사항입니다.
              </div>
              <div class="invalid-feedback" id="invalid-phone">
                	숫자만 입력해주세요.
              </div>
            </div>
            
            <script>
            	$(function(){
					$("#invalid-phone").hide();
					
					$("input").keyup(function(){
						var match = /[^0-9]/g;
						var tel = $("#mem_tel").val();
						if(tel != ""){
							if(match.test(tel)){
								$("#invalid-phone").show();
							}else{
								$("#invalid-phone").hide();
							}
						}else if(tel == ""){
							$("#invalid-phone").hide();
						}
						
					});
            	});
            </script>

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