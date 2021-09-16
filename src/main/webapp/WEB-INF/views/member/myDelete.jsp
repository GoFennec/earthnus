<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>탈퇴하기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
body{
background:#f9f9fb;    
}
.view-account{
background:#FFFFFF; 
margin-top:20px;
}
.view-account .pro-label {
font-size: 13px;
padding: 4px 5px;
position: relative;
top: -5px;
margin-left: 10px;
display: inline-block
}

.view-account .side-bar {
padding-bottom: 30px
}

.view-account .side-bar .user-info {
text-align: center;
margin-bottom: 15px;
padding: 30px;
color: #616670;
border-bottom: 1px solid #f3f3f3
}

.view-account .side-bar .user-info .img-profile {
width: 120px;
height: 120px;
margin-bottom: 15px
}

.view-account .side-bar .user-info .meta li {
margin-bottom: 10px
}

.view-account .side-bar .user-info .meta li span {
display: inline-block;
width: 100px;
margin-right: 5px;
text-align: right
}

.view-account .side-bar .user-info .meta li a {
color: #616670
}

.view-account .side-bar .user-info .meta li.activity {
color: #a2a6af
}

.view-account .side-bar .side-menu {
text-align: center
}

.view-account .side-bar .side-menu .nav {
display: inline-block;
margin: 0 auto
}

.view-account .side-bar .side-menu .nav>li {
font-size: 14px;
margin-bottom: 0;
border-bottom: none;
display: inline-block;
float: left;
margin-right: 15px;
margin-bottom: 15px
}

.view-account .side-bar .side-menu .nav>li:last-child {
margin-right: 0
}

.view-account .side-bar .side-menu .nav>li>a {
display: inline-block;
color: #9499a3;
padding: 5px;
border-bottom: 2px solid transparent
}

.view-account .side-bar .side-menu .nav>li>a:hover {
color: #616670;
background: none
}

.view-account .side-bar .side-menu .nav>li.active a {
color: #388E3C;
border-bottom: 2px solid #388E3C;
background: none;
border-right: none
}

.theme-2 .view-account .side-bar .side-menu .nav>li.active a {
color: #6dbd63;
border-bottom-color: #6dbd63
}

.theme-3 .view-account .side-bar .side-menu .nav>li.active a {
color: #497cb1;
border-bottom-color: #497cb1
}

.theme-4 .view-account .side-bar .side-menu .nav>li.active a {
color: #ec6952;
border-bottom-color: #ec6952
}

.view-account .side-bar .side-menu .nav>li .icon {
display: block;
font-size: 24px;
margin-bottom: 5px
}

.view-account .content-panel {
padding: 30px
}

.view-account .content-panel .title {
margin-bottom: 15px;
margin-top: 0;
font-size: 18px
}

.view-account .content-panel .fieldset-title {
padding-bottom: 15px;
border-bottom: 1px solid #eaeaf1;
margin-bottom: 30px;
color: #616670;
font-size: 16px
}

.view-account .content-panel .avatar .figure img {
float: right;
width: 64px
}

.view-account .content-panel .content-header-wrapper {
position: relative;
margin-bottom: 30px
}

.view-account .content-panel .content-header-wrapper .actions {
position: absolute;
right: 0;
top: 0
}

.view-account .content-panel .content-utilities {
position: relative;
margin-bottom: 30px
}

.view-account .content-panel .content-utilities .btn-group {
margin-right: 5px;
margin-bottom: 15px
}

.view-account .content-panel .content-utilities .fa {
font-size: 16px;
margin-right: 0
}

.view-account .content-panel .content-utilities .page-nav {
position: absolute;
right: 0;
top: 0
}

.view-account .content-panel .content-utilities .page-nav .btn-group {
margin-bottom: 0
}

.view-account .content-panel .content-utilities .page-nav .indicator {
color: #a2a6af;
margin-right: 5px;
display: inline-block
}

.view-account .content-panel .mails-wrapper .mail-item {
position: relative;
padding: 10px;
border-bottom: 1px solid #f3f3f3;
color: #616670;
overflow: hidden
}

.view-account .content-panel .mails-wrapper .mail-item>div {
float: left
}

.view-account .content-panel .mails-wrapper .mail-item .icheck {
background-color: #fff
}

.view-account .content-panel .mails-wrapper .mail-item:hover {
background: #f9f9fb
}

.view-account .content-panel .mails-wrapper .mail-item:nth-child(even) {
background: #fcfcfd
}

.view-account .content-panel .mails-wrapper .mail-item:nth-child(even):hover {
background: #f9f9fb
}

.view-account .content-panel .mails-wrapper .mail-item a {
color: #616670
}

.view-account .content-panel .mails-wrapper .mail-item a:hover {
color: #494d55;
text-decoration: none
}

.view-account .content-panel .mails-wrapper .mail-item .checkbox-container,
.view-account .content-panel .mails-wrapper .mail-item .star-container {
display: inline-block;
margin-right: 5px
}

.view-account .content-panel .mails-wrapper .mail-item .star-container .fa {
color: #a2a6af;
font-size: 16px;
vertical-align: middle
}

.view-account .content-panel .mails-wrapper .mail-item .star-container .fa.fa-star {
color: #f2b542
}

.view-account .content-panel .mails-wrapper .mail-item .star-container .fa:hover {
color: #868c97
}

.view-account .content-panel .mails-wrapper .mail-item .mail-to {
display: inline-block;
margin-right: 5px;
min-width: 120px
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject {
display: inline-block;
margin-right: 5px
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label {
margin-right: 5px
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label:last-child {
margin-right: 10px
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a,
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a:hover {
color: #fff
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-1 {
background: #f77b6b
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-2 {
background: #58bbee
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-3 {
background: #f8a13f
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-4 {
background: #ea5395
}

.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-5 {
background: #8a40a7
}

.view-account .content-panel .mails-wrapper .mail-item .time-container {
display: inline-block;
position: absolute;
right: 10px;
top: 10px;
color: #a2a6af;
text-align: left
}

.view-account .content-panel .mails-wrapper .mail-item .time-container .attachment-container {
display: inline-block;
color: #a2a6af;
margin-right: 5px
}

.view-account .content-panel .mails-wrapper .mail-item .time-container .time {
display: inline-block;
text-align: right
}

.view-account .content-panel .mails-wrapper .mail-item .time-container .time.today {
font-weight: 700;
color: #494d55
}

.drive-wrapper {
padding: 15px;
background: #f5f5f5;
overflow: hidden
}

.drive-wrapper .drive-item {
width: 130px;
margin-right: 15px;
display: inline-block;
float: left
}

.drive-wrapper .drive-item:hover {
box-shadow: 0 1px 5px rgba(0, 0, 0, .1);
z-index: 1
}

.drive-wrapper .drive-item-inner {
padding: 15px
}

.drive-wrapper .drive-item-title {
margin-bottom: 15px;
max-width: 100px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis
}

.drive-wrapper .drive-item-title a {
color: #494d55
}

.drive-wrapper .drive-item-title a:hover {
color: #388E3C
}

.theme-2 .drive-wrapper .drive-item-title a:hover {
color: #6dbd63
}

.theme-3 .drive-wrapper .drive-item-title a:hover {
color: #497cb1
}

.theme-4 .drive-wrapper .drive-item-title a:hover {
color: #ec6952
}

.drive-wrapper .drive-item-thumb {
width: 100px;
height: 80px;
margin: 0 auto;
color: #616670
}

.drive-wrapper .drive-item-thumb a {
-webkit-opacity: .8;
-moz-opacity: .8;
opacity: .8
}

.drive-wrapper .drive-item-thumb a:hover {
-webkit-opacity: 1;
-moz-opacity: 1;
opacity: 1
}

.drive-wrapper .drive-item-thumb .fa {
display: inline-block;
font-size: 36px;
margin: 0 auto;
margin-top: 20px
}

.drive-wrapper .drive-item-footer .utilities {
margin-bottom: 0
}

.drive-wrapper .drive-item-footer .utilities li:last-child {
padding-right: 0
}

.drive-list-view .name {
width: 60%
}

.drive-list-view .name.truncate {
max-width: 100px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis
}

.drive-list-view .type {
width: 15px
}

.drive-list-view .date,
.drive-list-view .size {
max-width: 60px;
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis
}

.drive-list-view a {
color: #494d55
}

.drive-list-view a:hover {
color: #388E3C
}

.theme-2 .drive-list-view a:hover {
color: #6dbd63
}

.theme-3 .drive-list-view a:hover {
color: #497cb1
}

.theme-4 .drive-list-view a:hover {
color: #ec6952
}

.drive-list-view td.date,
.drive-list-view td.size {
color: #a2a6af
}

@media (max-width:767px) {
.view-account .content-panel .title {
    text-align: center
}
.view-account .side-bar .user-info {
    padding: 0
}
.view-account .side-bar .user-info .img-profile {
    width: 60px;
    height: 60px
}
.view-account .side-bar .user-info .meta li {
    margin-bottom: 5px
}
.view-account .content-panel .content-header-wrapper .actions {
    position: static;
    margin-bottom: 30px
}
.view-account .content-panel {
    padding: 0
}
.view-account .content-panel .content-utilities .page-nav {
    position: static;
    margin-bottom: 15px
}
.drive-wrapper .drive-item {
    width: 100px;
    margin-right: 5px;
    float: none
}
.drive-wrapper .drive-item-thumb {
    width: auto;
    height: 54px
}
.drive-wrapper .drive-item-thumb .fa {
    font-size: 24px;
    padding-top: 0
}
.view-account .content-panel .avatar .figure img {
    float: none;
    margin-bottom: 15px
}
.view-account .file-uploader {
    margin-bottom: 15px
}
.view-account .mail-subject {
    max-width: 100px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
.view-account .content-panel .mails-wrapper .mail-item .time-container {
    position: static
}
.view-account .content-panel .mails-wrapper .mail-item .time-container .time {
    width: auto;
    text-align: left
}
}

@media (min-width:768px) {
.view-account .side-bar .user-info {
    padding: 0;
    padding-bottom: 15px
}
.view-account .mail-subject .subject {
    max-width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
}

@media (min-width:992px) {
.view-account .content-panel {
    min-height: 800px;
    border-left: 1px solid #f3f3f7;
    margin-left: 200px
}
.view-account .mail-subject .subject {
    max-width: 280px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis
}
.view-account .side-bar {
    position: absolute;
    width: 200px;
    min-height: 600px
}
.view-account .side-bar .user-info {
    margin-bottom: 0;
    border-bottom: none;
    padding: 30px
}
.view-account .side-bar .user-info .img-profile {
    width: 120px;
    height: 120px
}
.view-account .side-bar .side-menu {
    text-align: left
}
.view-account .side-bar .side-menu .nav {
    display: block
}
.view-account .side-bar .side-menu .nav>li {
    display: block;
    float: none;
    font-size: 14px;
    border-bottom: 1px solid #f3f3f7;
    margin-right: 0;
    margin-bottom: 0
}
.view-account .side-bar .side-menu .nav>li>a {
    display: block;
    color: #9499a3;
    padding: 10px 15px;
    padding-left: 30px
}
.view-account .side-bar .side-menu .nav>li>a:hover {
    background: #f9f9fb
}
.view-account .side-bar .side-menu .nav>li.active a {
    background: #f9f9fb;
    border-right: 4px solid #388E3C;
    border-bottom: none
}
.theme-2 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #6dbd63
}
.theme-3 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #497cb1
}
.theme-4 .view-account .side-bar .side-menu .nav>li.active a {
    border-right-color: #ec6952
}
.view-account .side-bar .side-menu .nav>li .icon {
    font-size: 24px;
    vertical-align: middle;
    text-align: center;
    width: 40px;
    display: inline-block
}
col-md-6 col-sm-8 col-xs-12 pwlabel{
    padding-top: 7px;
    margin-bottom: 0;
    text-align: right;
margin-top: 13px;}
#p1{
font-family: "Montserrat",sans-serif;
    color: #425140;
    font-size: 16px;
    line-height: 30px;
    margin-bottom: 15px;
    font-weight: normal;
}

#p2{
font-family: "Montserrat",sans-serif;
    color: #388E3C;
    font-size: 16px;
    line-height: 30px;
    margin-bottom: 15px;
    font-weight: bold;
}

#s1{
font-family: "Montserrat",sans-serif;
    color: #425140;
    font-size: 20px;
    line-height: 30px;
    margin-bottom: 15px;
    font-weight: bold;
}

</style>

</head>
<jsp:include page="/WEB-INF/views/header.jsp"/> 
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false' >
<br>
<div class="container">
    <div class="view-account">
        <section class="module">
            <div class="module-inner">
                <div class="side-bar">
                    <div class="user-info">
							<img class="img-profile img-circle img-responsive center-block"
								src="/resources/Auth/account_1.png"
								title="기본계정사진" alt="아바타모형사진">
							<ul class="meta list list-unstyled">
								<li class="name">${auth.auth_name}님</li>
							</ul>
						</div>
            		<nav class="side-menu">
        				<ul class="nav">
        					<li><a href="/member/myPage"><span class="fa fa-user"></span> 마이페이지</a></li>
        					<li><a href="/member/myInfo"><span class="fa fa-cog"></span> 내 정보</a></li>
        					<li><a href="/member/myOrder"><span class="fa fa-credit-card"></span>내 주문 내역</a></li>
        					<li><a href="/member/myMessage"><span class="fa fa-envelope"></span>내가 작성한 글</a></li>
        					
        					<li class="active"><a href="/member/myDelete"><span class="fa fa-th"></span> 탈퇴하기</a></li>
        				</ul>
        			</nav>
                </div>
                <div class="content-panel">
                    <h2 class="title">탈퇴하기</h2>
                    <hr>
              <div class="panel-body">
                <form id="form" class="form-horizontal" method="post" action="/pwCheck" >
                        
    <div class="row">
        <div class="col-lg-12">
            <h4>회원가입 탈퇴 안내</h4>
            <div class="panel-body" style="border: 1px solid #ccc">
            <p id="p1">회원탈퇴에 앞서 유의사항 및 안내를 반드시 읽고 진행해주세요!</p>
        </div>
        <br>
        <h4>개인정보</h4>
        <div class="panel-body" style="border: 1px solid #ccc">
        
			<p id="p1">
			<span id="s1"> [EARTH & US 아이디 재사용 및 복구 불가 안내] </span><br>
			회원 탈퇴 진행시 본인을 포함한 타인 모두 아이디 재사용이나 복구가 불가능합니다.
			신중히 선택하신 후 결정해주세요.
			<br></p>
			<br>        
            <p id="p1">
            <span id="s1">[사용자 개인정보 처리 안내]</span><br>결제 정보를 포함한 개인 정보(이름, 주소, 전화번호, 이메일)는 기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
           	이외 사용자에 의해 발생된 기부내역 및 나이, 성별 정보는 서비스 통계·제공 및 향상, 안전한 인터넷 이용환경 구축 등 의 목적으로만 이용됩니다.
            
            <br></p>
            <br>
            <p id="p1"><span id="s1">[게시판형 서비스에 등록한 게시글 삭제 불가 안내]</span><br>
            	삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
            	탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br>
			</p><br>
			<p id="p2"><span id="s1">[포인트 사용 및 복구 불가 안내]</span><br>
			포인트의 경우 회원 탈퇴 후 사용 또는 갱신이 불가능 합니다. 포인트를 이용하고 싶으 신 경우 탈퇴 전 사용 부탁드리며, 탈퇴 후 포인트 소멸에 대한 책임은 지지 않으니 신중한 선택 부탁드립니다. 
			<br><br>
			<p id="p2"><span id="s1">[지구마켓 상품 배송완료 전 탈퇴 불가 안내]</span><br>
			배송이 진행중인 지구마켓 상품이 있는 경우 탈퇴가 불가능 합니다.  
			
			
        </div>
        <br/>
       
            <div class="form-group"> 
                <label class="checkbox-inline">
                    <input type="checkbox" name="agreement" value="true">동의합니다.
                   
                </label>
            </div>
            <c:if test="${getMyInfo.mem_api eq null}" >
           <label class="col-md-6 col-sm-8 col-xs-12 control-label" >비밀번호</label>
              <div class="col-md-4 col-sm-4 col-xs-12">
              <input id="Password" type="password" class="form-control" name ="mem_pw" required>
              </div>
            <button type="button" class="btn btn-default" onclick="agree();">탈퇴하기</button>
</c:if>

 <c:if test="${getMyInfo.mem_api ne null}" >
            <button type="button" class="btn btn-default" onclick="agree2();">탈퇴하기</button>
</c:if>
    </div>
</div>
  </form>

                        
                        </div>
                  
                </div>
            </div>
            </section>
    </div>
</div>
<script type="text/javascript">
function agree(){
	if($("input:checkbox[name=agreement]").is(":checked") == true) {
		if(Password.value ==""){
			alert("비밀번호를 입력하세요");
		}else{
			$("#form").submit();
		}
	}else{
		alert("동의하기를 체크해주세요");
	}
	
	
}

</script>
<script>
function agree2(){
	if($("input:checkbox[name=agreement]").is(":checked") == true) {
	location.href="/deleteMember_api";
	//	location.href="/deleteMember";
	}else{
		alert("동의하기를 체크해주세요");
	}
	
	
}

</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>