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
      <a href="/"><img class="d-block mx-auto mb-4" src="/resources/assets/img/logo/loder.png" alt="" ></a>
    </div>

    <div class="row g-5">
      <div class="">
        <form class="needs-validation" action="/member/join" method="post" onsubmit="return check()" novalidate>
          <div class="row g-3">
          
            <div class="col-md-9" style="padding-right:0px">
              <label for="firstName" class="form-label">아이디</label>
              <input type="text" name="mem_id" class="form-control" id="mem_id" placeholder="중복확인 버튼을 누르세요." disabled required>
              <div class="invalid-feedback" id="invalid-id">
               	 필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-md-3" style="margin-top:50px;">
              <button type="button" class="w-100 btn btn-primary btn-lg" style="padding-left:20px" id="testBtn">중복확인</button>
            </div>
            
            <script>
				$('#testBtn').click(function(e){
				e.preventDefault();
				$('#testModal').modal("show");
				});
			</script>
			
			<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title" id="exampleModalLabel">아이디 중복확인</h3>
						</div>
						<br>
						<input type="text" name="mem_id" class="form-control" id="mem_idcheck" placeholder="아이디를 입력하세요." >
						<br>
						<div class="modal-footer">
							<button type="button" class="w-100 btn btn-primary btn-lg" id="modalY" onclick="idcheck()">중복확인</button>
							<button type="button" class="w-100 btn btn-primary btn-lg" type="button" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
            
            <script type="text/javascript">
				function idcheck(){
					var idcheck = $("#mem_idcheck").val();
					var match = /^[A-Za-z0-9_-]{5,15}$/;
					if(idcheck === ""){
						alert("아이디를 입력해주세요.");
					}else if(!match.test(idcheck)){
						alert("5~15자의 영문 대문자, 소문자와 특수문자[ _ ],[ - ]로 회원가입 할 수 있습니다.");
						return;
					}
		
					$.ajax({
			   			type: "POST", //요청 메소드 방식
			  			 url:"/member/idcheck",
			   			data: {"mem_id":idcheck},
			   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
			   			success : function(result){
				   
			      			if(result.error === true && idcheck != ""){
			    	  			var yesno = confirm('사용 가능한 아이디입니다. \n 사용하시겠습니까?');
			    	  			if(yesno){
			    	  				$("#mem_id").val(idcheck);
			    	  				$("#mem_id").attr("disabled",true);
			    	  				$("#testModal").modal("hide");
			    	  				
			    	  			}
			      			}else if(result.error === false){
			    	  			alert('이미 존재하는 아이디입니다.');
			      			}
			   			},
			   		 error:function(request,status,error){
			   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			      			//통신 실패시 발생하는 함수(콜백)
			   				}
						});
				}
			</script>

            <div class="col-12">
              <label for="username" class="form-label">비밀번호</label>
              <input type="password" name="mem_pw" class="form-control" id="Password" placeholder="" required>
              <div class="invalid-feedback" id="invalid-pw">
                	필수 입력사항입니다.
              </div>
              <div class="invalid-feedback" id="invalid-pw2">
                	8~20자의 영문 대문자, 소문자와 특수문자[ _ ],[ - ]로 비밀번호를 설정할 수 있습니다.
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
					$("#invalid-pw2").hide();
					var match = /^[A-Za-z0-9_-]{5,15}$/;
					var pwd = $("#Password").val();
					$("input").keyup(function(){
						if(!match.test(pwd)){
							$("#invalid-pw2").show();
						}else{
							$("#invalid-pw2").hide();
						}
					});
					
					
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
			<div class="col-12"><div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div></div>
			<div class="col-12"><div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div></div>
            

            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <input type="text" name="mem_name"class="form-control" id="mem_name" placeholder="" required>
              <div class="invalid-feedback" id="invalid-name">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
              <label for="username" class="form-label">생년월일 </label>
              <input type="date" name="mem_birth" class="form-control" id="birth" placeholder="" required>
              <div class="invalid-feedback" id="invalid-birth">
                	필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-12">
            <label for="username" class="form-label">성별 </label>
            </div>
            <div class="col-12">
            <select name="mem_gender" required>
    			<option value="male">남자</option>
    			<option value="female">여자</option>
    			<option value="non">선택 안함</option>
			</select>
			</div>
			<div class="invalid-feedback" id="invalid-gender">
                	필수 입력사항입니다.
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
              <input type="email" name="mem_email" class="form-control" id="mem_email" placeholder="ex)EARTHNUS@email.com">
              <div class="invalid-feedback" id="invalid-email">
               	 필수 입력사항입니다.
              </div>
            </div>
            
            <div class="col-md-3" style="margin-top:53px;">
              <button type="button" class="w-100 btn btn-primary btn-lg" style="padding-left:9px; font-size:13px" onclick="mail()" id="testBtn1">인증번호 받기</button>
            </div>
            
            <script type="text/javascript">
            	$(function(){ 
            		$('#testBtn2').hide();
            	});
				function mail(){
					var mail = $("#mem_email").val();
					var id = $("#mem_id").val();
					if(mail === ""){
						alert("이메일을 입력해주세요.");
						return;
					}else if(!mail.includes('@')){
						alert("올바르지 않은 이메일 형식입니다.");
						return;
					}else if(id === ""){
						alert("아이디를 먼저 입력해주세요.");
						return;
					}else{
					$.ajax({
			   			type: "POST", //요청 메소드 방식
			  			 url:"/member/mail",
			   			data: {"mem_email":mail, "mem_id":id},
			   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
			   			success : function(result){
				   
			      			if(result.error == true){
			    	  			alert('입력하신 이메일로 회원가입 인증번호를 발송했습니다. \n 인증번호가 오지 않으면 입력하신 이메일을 다시 확인해주세요.');
			    	  			$('#testBtn1').hide();
			    	  			$('#testBtn2').show();
			      			}else if(result.error == false){
			    	  			alert('인증번호 발송에 실패했습니다.');
			      			}
			   			},
			   		 error:function(request,status,error){
			   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			      			//통신 실패시 발생하는 함수(콜백)
			   				}
						});
					}
				}
			</script>
            
            <div class="col-md-9" style="padding-right:0px">
              <input type="text" name="mailCheck" class="form-control" id="mailCheck" placeholder="이메일 인증번호">
              <div class="invalid-feedback" id="invalid-emailCheck">
                	필수 입력사항입니다.
              </div>
            </div>
            <div class="col-md-3" style="margin-top:5px;">
              <button type="button" class="w-100 btn btn-primary btn-lg" style="padding-left:9px; font-size:13px" onclick="mailCheck()" id="testBtn2">인증번호 확인</button>
            </div>
            
            <script type="text/javascript">
			$('#testBtn2').click(function(){
				var mailCheck = $("#mailCheck").val();
				var id = $('#mem_id').val();
				if(mailCheck === ""){
					alert("이메일 인증번호를 입력해주세요.");
					return;
				}
				$.ajax({
		   			type: "POST", //요청 메소드 방식
		  			 url:"/member/mailCheck",
		   			data: {"mailCheck":mailCheck, "id":id},
		   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
		   			success : function(result){
			   
		      			if(result.error == true){
		    	  			alert('회원가입 이메일 인증이 완료되었습니다.');
		    	  			$("#mem_email").attr("disabled",true);
		    	  			$("#mailCheck").attr("disabled",true);
		      			}else if(result.error == false){
		    	  			alert('이메일 인증번호가 일치하지 않습니다. \n 이메일을 다시 한 번 확인해주세요.');
		      			}
		   			},
		   		 error:function(request,status,error){
		   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		      			//통신 실패시 발생하는 함수(콜백)
		   				}
					});
			});
			</script>
			 
            <div class="col-md-12">
              <label for="cc-expiration" class="form-label">전화번호</label>
              <input type="text" name="mem_tel" class="form-control" id="mem_tel" placeholder="" required>
              <div class="invalid-feedback" id="invalid-phone">
                	필수 입력사항입니다.
              </div>
            </div>

          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
          <div style="text-align:center; padding-top:20px"><a href="/auth/login"><span>로그인</span></a></div>
          
          <script type="text/javascript">
				function check(){
					var id = $("#mem_id").val();
					
					if(id == ""){
						$('#invalid-id').show();
						return false;
					}
				}
			</script>
          
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
