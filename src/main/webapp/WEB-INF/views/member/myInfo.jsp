<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>내 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
   href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
   rel="stylesheet">
<link href="/resources/assets/css/form-validation.css" rel="stylesheet">

<!-- 모달창 관련 -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
body {
   background: #f9f9fb;
   
}
.view-account {
   background: #FFFFFF;
   margin-top: 20px;
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
   overflow: hidden;

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
.view-account .content-panel .mails-wrapper .mail-item:nth-child(even):hover
   {
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
   .view-account .content-panel .mails-wrapper .mail-item .star-container
   {
   display: inline-block;
   margin-right: 5px
}
.view-account .content-panel .mails-wrapper .mail-item .star-container .fa
   {
   color: #a2a6af;
   font-size: 16px;
   vertical-align: middle
}
.view-account .content-panel .mails-wrapper .mail-item .star-container .fa.fa-star
   {
   color: #f2b542
}
.view-account .content-panel .mails-wrapper .mail-item .star-container .fa:hover
   {
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
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label
   {
   margin-right: 5px
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label:last-child
   {
   margin-right: 10px
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a,
   .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a:hover
   {
   color: #fff
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-1
   {
   background: #f77b6b
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-2
   {
   background: #58bbee
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-3
   {
   background: #f8a13f
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-4
   {
   background: #ea5395
}
.view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-5
   {
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
.view-account .content-panel .mails-wrapper .mail-item .time-container .attachment-container
   {
   display: inline-block;
   color: #a2a6af;
   margin-right: 5px
}
.view-account .content-panel .mails-wrapper .mail-item .time-container .time
   {
   display: inline-block;
   text-align: right
}
.view-account .content-panel .mails-wrapper .mail-item .time-container .time.today
   {
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
.drive-list-view .date, .drive-list-view .size {
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
.drive-list-view td.date, .drive-list-view td.size {
   color: #a2a6af
}
@media ( max-width :767px) {
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
   .view-account .content-panel .mails-wrapper .mail-item .time-container .time
      {
      width: auto;
      text-align: left
   }
}
@media ( min-width :768px) {
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
@media ( min-width :992px) {
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
.modal-login {
   color: #636363;
   width: 350px;
}
.modal-login .modal-content {
   padding: 20px;
   border-radius: 5px;
   border: none;
}
.modal-login .modal-header {
   border-bottom: none;
   position: relative;
   justify-content: center;
}
.modal-login h4 {
   text-align: center;
   font-size: 26px;
}
.modal-login  .form-group {
   position: relative;
   width: 80%;
   margin-left: 45px;
    margin-top: 10px;
    margin-bottom: 5px;
}
.modal-login i {
   position: absolute;
   left: 13px;
   top: 11px;
   font-size: 18px;
}
.modal-login .form-control {
   padding-left: 40px;
       font-size: 1.5rem;
}
.modal-login .form-control:focus {
   border-color: #00ce81;
   width: 100%;
    margin: auto;
}
.modal-login .form-control, .modal-login .btn {
   min-height: 40px;
   border-radius: 3px; 
}
.modal-login .hint-text {
   text-align: center;
   padding-top: 10px;
}
.modal-login .close {
   position: absolute;
   top: -5px;
   right: -5px;
}
.modal-login .btn, .modal-login .btn:active {   
   margin-left: 45px;
   border: none;
   background-image: linear-gradient(to left, #46C0BE, #6DD56F, #46C0BE) !important;
   display: block;
   width: 80%;
   line-height: normal;
}
.modal-login .btn:hover, .modal-login .btn:focus {
   background: #00bf78 !important;
}
.modal-login .modal-footer {
   background: #ecf0f1;
   border-color: #dee4e7;
   text-align: center;
   margin: 0 -20px -20px;
   border-radius: 5px;
   font-size: 13px;
   justify-content: center;
}
.modal-login .modal-footer a {
   color: #999;
}
.trigger-btn {
   display: inline-block;
   margin: 100px auto;
}

</style>

</head>
<jsp:include page="/WEB-INF/views/header.jsp" />
<body oncontextmenu='return false' onselectstart='return false'
   ondragstart='return false'>
   <br>
   
   <div class="container" style="max-width: 1200px;">
      <div class="view-account">
         <section class="module">
            <div class="module-inner">
               <div class="side-bar">
                  <div class="user-info">
                     <img class="img-profile img-circle img-responsive center-block"
                        src="/resources/Auth/account_1.png"
                        title="기본계정사진" alt="아바타모형사진">
                     <ul class="meta list list-unstyled">
                        <!-- <li class="id"><a>${auth.auth_id}</a></li> -->
                        <li class="name">${auth.auth_name}님</li>
                     </ul>
                  </div>
                  <nav class="side-menu">
                     <ul class="nav">
                        <li><a href="/member/myPage"><span class="fa fa-user"></span>
                              마이페이지</a></li>
                        <li class="active"><a href="/member/myInfo"><span
                              class="fa fa-cog"></span> 내 정보</a></li>
                        <li><a href="/member/myOrder"><span
                              class="fa fa-credit-card"></span>내 주문 내역</a></li>
                        <li><a href="/member/myMessage"><span
                              class="fa fa-envelope"></span>내가 작성한 글</a></li>

                        <li><a href="/member/myDelete"><span class="fa fa-th"></span>
                              탈퇴하기</a></li>
                     </ul>
                  </nav>
               </div>
               <div class="content-panel">
                  <h2 class="title" style="color: #388E3C;">내 정보</h2>
                  <form class="form-horizontal" id="form" method="post"  action="/updateMyInfo">
                     <fieldset class="fieldset">
         <div class="form-group">
          				<c:if test="${MemberBean.mem_api eq \"NULL\" || MemberBean.mem_api eq NULL}" >
                        <div class="col-12">
                           <label for="username" class="form-label">아이디</label> <input
                              type="text" name="mem_id" class="form-control" id="mem_id"
                              value="${MemberBean.mem_id }" readonly>
                        </div>
                        </c:if>
                         <c:if test="${MemberBean.mem_api eq 'KAKAO'}" >
                        <div class="col-12">
                           <label for="username" class="form-label">아이디</label> <input
                              type="text" name="mem_id" class="form-control" id="mem_id"
                              value="카카오 간편 로그인 회원" readonly>
                        </div>
                        </c:if>
                         <c:if test="${MemberBean.mem_api eq 'NAVER'}" >
                        <div class="col-12">
                           <label for="username" class="form-label">아이디</label> <input
                              type="text" name="mem_id" class="form-control" id="mem_id"
                              value="네이버 간편 로그인 회원" readonly>
                        </div>
                        </c:if>
                        
                        <div class="col-12">
                           <label for="username" class="form-label">이름</label> <input
                              type="text" name="mem_name" class="form-control" id="mem_name"
                              value="${MemberBean.mem_name  }" readonly>
                        </div>
                        
                           <c:if test="${MemberBean.mem_api eq \"NULL\" || MemberBean.mem_api eq NULL}" >
                        <div class="col-12">
                           <label for="username" class="form-label">비밀번호</label>
                        </div>
                        
                        <div class="col-md-3">
                           <button class="w-100 btn btn-primary btn-lg" id=pwbutton
                              data-toggle="modal" data-target="#myModal" >비밀번호 변경</button>
                              
                        </div>
                        <br><br> <br>
                     </c:if>

    <script>
            $('#pwbutton').click(function(){
               $('#mem_cpw1').hide();
               $('#mem_cpw2').hide();
               $('#pwch').hide();
            });
         </script>
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
   <div class="modal-dialog modal-login">
      <div class="modal-content">
         <div class="modal-header">            
            <h4 class="modal-title">비밀번호 변경</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         </div>
         <div class="modal-body">
               <div class="form-group">
               <input type="password" class="form-control"
            placeholder="현재 비밀번호"  id="mem_pw">
               </div>
              <button type="button" class="btn btn-primary btn-block btn-lg" onclick="pwCheck()">현재비밀번호 확인</button>
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="변경할 비밀번호" required  id="mem_cpw1" >               
                  
            <div class="invalid-feedback" id="invalid-pw2">
                   8~20자의 영문 대문자, 소문자와 특수문자로 비밀번호를 설정할 수 있습니다.
              </div>
               </div> 
               
              <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호 확인" required id="mem_cpw2">               
               </div>
                
                  <button type="button" id="pwch" class="btn btn-primary btn-block btn-lg" onclick="updatePw()">비밀번호 변경</button>
               
         
         </div>
      
      </div>
   </div>
</div>   
 <script type="text/javascript">
            $(function(){
               $("#invalid-pw2").hide();
               
               $("input").keyup(function(){
                  var match = /^[A-Za-z0-9.;\-]{8,20}$/;
                  var pwd = $("#mem_cpw1").val();
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
               
 <script type="text/javascript">
            function pwCheck(){
               
               var mem_pw = $("#mem_pw").val();
               if(mem_pw === ""){
                  alert("비밀번호를 입력해주세요.");
               }else{
               $.ajax({
                     type: "POST", //요청 메소드 방식
                     url:"/cpwCheck",
                     data: {"mem_pw":mem_pw},
                     dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
                     
                     success : function(result){
                        if (result.error === true) {
                        alert("비밀번호 확인이 완료되었습니다. 변경할 비밀번호를 입력해주세요.");
                         $("#mem_pw").attr("readonly",true);
                         $('#mem_cpw1').show();
                           $('#mem_cpw2').show();
                           $('#pwch').show();
                     } else if(result.error === false){
                           alert('비밀번호가 일치하지 않습니다.');
                        }
                  },
                  error : function(
                        request,
                        status, error) {
                     alert("code = "
                           + request.status
                           + " message = "
                           + request.responseText
                           + " error = "
                           + error);
                     //통신 실패시 발생하는 함수(콜백)
                  }
               });
   } }
               </script>

                        <script type="text/javascript">
                           function updatePw() {
                              
                              var cpw1 = $("#mem_cpw1").val();
                              var cpw2 = $("#mem_cpw2").val();
                              if($('#invalid-pw2').is(':visible')){
                                 alert('입력하신 정보를 다시 확인해주세요.');
                                    return;
                                    }else{
                              if (cpw1 == cpw2) {
                                 $.ajax({
                                          type : "POST", //요청 메소드 방식
                                          url : "/updatePw",
                                          data : {
                                             "mem_pw" : cpw1
                                          },
                                          dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
                                          success : function(result) {
                                             if (result.error) {
                                                alert("비밀번호 변경이 완료되었습니다.");
                                                              $(".modal-backdrop").remove();
                                                              $("#myModal").modal("hide");
                                             } else {
                                                location.href = result.url;
                                             }
                                          },
                                          error : function(
                                                request,
                                                status, error) {
                                             alert("code = "
                                                   + request.status
                                                   + " message = "
                                                   + request.responseText
                                                   + " error = "
                                                   + error);
                                             //통신 실패시 발생하는 함수(콜백)
                                          }
                                       });
                              } else {
                                 alert("비밀번호가 일치하지 않습니다.")
                              }}
                           }
                        </script>
                           <c:if test="${MemberBean.mem_birth eq null}" >
                        <div class="col-12">
                           <label for="username" class="form-label">생년월일 </label> 
                           <input
                              type="date" name="mem_birth" class="form-control" id="birth"
                               required>
                           <div class="invalid-feedback" id="invalid-birth" >필수
                              입력사항입니다.</div>
                        </div>
                        </c:if>
                  <script>
                           $(function() {
                              var valueDate = document.getElementById('birth').value;
                              var date = $("#mem_birth").val();
                              $("#invalid-birth").show();
                              $("#birth").on("propertychange change keyup paste input", function() {
                                 date = $("#birth").val();
                              if (!valueDate) {
                                    $("#invalid-birth").hide();
                                 }
                              });
                           });
                        </script>
               
                        
                           <c:if test="${MemberBean.mem_birth ne null}" >
                        <div class="col-12">
                           <label for="username" class="form-label">생년월일 </label> 
                           <input
                              type="date" name="mem_birth" class="form-control" id="birth"
                              value="${MemberBean.mem_birth }" readonly>
                           </div>
                           </c:if>
                           
                        <div class="col-12">
                           <label for="username" class="form-label">성별 </label>
                        </div>
                        <div class="col-12">
                           <input type="text" class="form-control" name="mem_gender"
                              value="${MemberBean.mem_gender}" readonly>
                        </div>

                        <div class="col-12">
                           <label for="username" class="form-label">전화번호</label> <input
                              type="text" name="mem_tel" class="form-control" id="mem_tel"
                              value="${MemberBean.mem_tel}" maxlength='11' >
                           <div class="invalid-feedback" id="invalid-phone1">필수 입력사항입니다.</div>
                           <div class="invalid-feedback" id="invalid-phone">숫자만
                              입력해주세요.</div>
                        </div>


                     <script>
                           $(function() {
                              var tel = $("#mem_tel").val();
                              $("#invalid-phone").hide();
                              if (tel == "") {
                                 $("#invalid-phone1").show();
                              }
                              $("#mem_tel").keyup(function() {
                                 $("#invalid-phone1").hide();
                                 var match = /[^0-9]/g;
                                 tel = $("#mem_tel").val();
                                 if (tel != "") {
                                    if (match.test(tel)) {
                                       $("#invalid-phone").show();
                                    } else {
                                       $("#invalid-phone").hide();
                                    }
                                 } else if (tel == "") {
                                    $("#invalid-phone1").show();
                                 }
                              });
                           });
                        </script>
                        
                        
                        
                        

                        <div class="col-md-9" style="padding-right: 0px">
                           <label for="address" class="form-label">주소</label> <input
                              type="text" class="form-control" id="postcode" required 
                              placeholder="우편번호" onkeyup='call_addr()'
                              style="margin-top: 2px" >
                        </div>
                        <div class="col-md-3" style="margin-top: 53px;">
                           <button type="button" class="w-100 btn btn-primary btn-lg"
                              onclick="execDaumPostcode()" id="findPC"
                              style="text-align: center; margin-bottom: 10px;">우편번호 찾기</button>
                        </div>
                        <div class="col-md-12">
                           <input type="text" class="form-control" id="address" required 
                              placeholder="주소" onkeyup='call_addr()' style="margin-bottom: 10px;" >
                        </div>
                        <div class="col-md-12">
                           <input type="text" class="form-control" id="detailAddress" required 
                              placeholder="상세주소" onkeyup='call_addr()'  style="margin-bottom: 10px;" >
                        </div>
                        <div class="col-md-12">
                           <input type="text" class="form-control" id="extraAddress" 
                              placeholder="참고항목" onkeyup='call_addr()'>
                              <div class="invalid-feedback" id="invalid-addr">필수 입력사항입니다.</div>
                        </div>
                        <input type="hidden" id="address_all" name="mem_addr" value="${MemberBean.mem_addr}" >
                        

                        <div id="wrap"
                           style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
                           <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                              id="btnFoldWrap"
                              style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
                              onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>

                        
                     
                        <script>
                           function call_addr() {
                              if (document.getElementById("postcode").value
                                    && document
                                          .getElementById("address").value
                                    && document
                                          .getElementById("detailAddress").value) {
                                 document
                                       .getElementById('address_all').value = document
                                       .getElementById('postcode').value
                                       + '&'
                                       + document
                                             .getElementById('address').value
                                       + '&'
                                       + document
                                             .getElementById('detailAddress').value;
                              }
                           }
                        </script>


                        <div class="col-md-12">
                           <label for="username" class="form-label">포인트 </label>
                        </div>
                        <div class="col-md-12">
                           <input type="text" class="form-control" name="mem_point"
                              value="${MemberBean.mem_point}" readonly>
                        </div>







                        <div class="col-md-9" style="padding-right: 0px">
                           <label for="address" class="form-label">이메일</label> <input
                              type="text" class="form-control" id="mem_email"
                              value="${MemberBean.mem_email}" readonly>
                        </div>
                        <div class="col-md-2" style="margin-top: 53px;">
                           <button class="btn btn-sm btn-default-alt pull-left"
                              data-toggle="modal" data-target="#myModal2">이메일 변경</button>

                        </div>



                        <!-- Modal HTML -->
                        <div id="myModal2" class="modal fade" tabindex="-1"
                           role="dialog" aria-labelledby="exampleModalLabel"
                           aria-hidden="true">
                           <div class="modal-dialog modal-login" role="document">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h4 class="modal-title">이메일 변경</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                 </div>
                                 <div class="modal-body">

                                    <div class="col-md-12">
                                       <input type="email" class="form-control"
                                          id="mem_email2" placeholder="변경할 이메일" >
                                    </div>

                                    <div class="col-md-12">
                                       <button type="button" class="w-100 btn btn-primary btn-lg"
                                          style=" font-size: 13px; margin-left: 0px; margin-top: 10px; margin-bottom: 10px;"
                                          onclick="mail()" id="testBtn1">인증번호 받기</button>
                                    </div>

                                    <div class="col-md-12">
                                       <input type="text"  class="form-control"
                                          id="mailCheck" placeholder="이메일 인증번호"><br>
                                       <div class="invalid-feedback" id="invalid-emailCheck">필수
                                          입력사항입니다.</div>
                                    </div>
                                    <div class="col-md-12">
                                       <button type="button" class="w-100 btn btn-primary btn-lg"
                                          style="padding-left: 9px; font-size: 13px"
                                          onclick="mailCheck()" id="testBtn2">인증번호 확인</button>
                                    </div>
                                    <div class="col-md-12">
                                       <button type="button" class="w-100 btn btn-primary btn-lg"
                                          style="padding-left: 9px; font-size: 13px"
                                          onclick="updateEmail()" id="testBtn3">이메일 변경</button>
                                    </div>

                                    <script type="text/javascript">
                                       $(function() {
                                          $('#testBtn2').hide();
                                          $('#testBtn3').hide();
                                       });
                                       function mail() {
                                          var mail = $(
                                                "#mem_email2")
                                                .val();
                                          var name = $(
                                                "#mem_name")
                                                .val();
                                          if (mail === "") {
                                             alert("이메일을 입력해주세요.");
                                             return;
                                          } else if (!mail
                                                .includes('@')) {
                                             alert("올바르지 않은 이메일 형식입니다.");
                                             return;
                                          } else if (name === "") {
                                             alert("이름을 먼저 입력해주세요.");
                                             return;
                                          } else {
                                             $
                                                   .ajax({
                                                      type : "POST", //요청 메소드 방식
                                                      url : "/member/mail",
                                                      data : {
                                                         "mem_email" : mail,
                                                         "mem_name" : name
                                                      },
                                                      dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
                                                      success : function(
                                                            result) {
                                                         if (result.error == true) {
                                                            alert('입력하신 이메일로 인증번호를 발송했습니다. \n 인증번호가 오지 않으면 입력하신 이메일을 다시 확인해주세요.');
                                                            $(
                                                                  '#testBtn1')
                                                                  .hide();
                                                            $(
                                                                  '#testBtn2')
                                                                  .show();
                                                         } else if (result.error == false) {
                                                            alert('인증번호 발송에 실패했습니다.');
                                                         }
                                                      },
                                                      error : function(
                                                            request,
                                                            status,
                                                            error) {
                                                         alert("code = "
                                                               + request.status
                                                               + " message = "
                                                               + request.responseText
                                                               + " error = "
                                                               + error);
                                                         //통신 실패시 발생하는 함수(콜백)
                                                      }
                                                   });
                                          }
                                       }
                                    </script>

                                    <script type="text/javascript">
                                       $('#testBtn2')
                                             .click(
                                                   function() {
                                                      var mailCheck = $(
                                                            "#mailCheck")
                                                            .val();
                                                      var name = $(
                                                            '#mem_name')
                                                            .val();
                                                      var email0 = $(
                                                            '#mem_email')
                                                            .val();
                                                      var email = $(
                                                            '#mem_email2')
                                                            .val();
                                                      if (mailCheck === "") {
                                                         alert("이메일 인증번호를 입력해주세요.");
                                                         return;
                                                      }
                                                      $
                                                            .ajax({
                                                               type : "POST", //요청 메소드 방식
                                                               url : "/member/mailCheck",
                                                               data : {
                                                                  "mailCheck" : mailCheck,
                                                                  "name" : name,
                                                                  "email" : email
                                                               },
                                                               dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
                                                               success : function(
                                                                     result) {
                                                                  if (result.error == true) {
                                                                     alert('이메일 인증이 완료되었습니다.');
                                                                     $(
                                                                           "#mem_email")
                                                                           .val(
                                                                                 email);
                                                                     $(
                                                                           '#testBtn3')
                                                                           .show();
                                                                     $(
                                                                           '#testBtn2')
                                                                           .hide();
                                                                  } else if (result.error == false) {
                                                                     alert('이메일 인증번호가 일치하지 않습니다. \n 이메일을 다시 한 번 확인해주세요.');
                                                                  }
                                                               },
                                                               error : function(
                                                                     request,
                                                                     status,
                                                                     error) {
                                                                  alert("code = "
                                                                        + request.status
                                                                        + " message = "
                                                                        + request.responseText
                                                                        + " error = "
                                                                        + error);
                                                                  //통신 실패시 발생하는 함수(콜백)
                                                               }
                                                            });
                                                   });
                                    </script>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <script type="text/javascript">
                           $('#testBtn3')
                                 .click(
                                       function() {
                                          var email0 = $(
                                                '#mem_email')
                                                .val();
                                          var email = $(
                                                '#mem_email2')
                                                .val();
                                          $
                                                .ajax({
                                                   type : "POST", //요청 메소드 방식
                                                   url : "/updateEmail",
                                                   data : {
                                                      "mem_email" : email
                                                   },
                                                   dataType : 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
                                                   success : function(
                                                         result) {
                                                      if (result.error) {
                                                         alert("이메일 변경이 완료되었습니다.")
                                                          $("#myModal2").removeClass("in");
                                                                       $(".modal-backdrop").remove();
                                                                       $("#myModal2").hide();
                                                      } else {
                                                         location.href = result.url;
                                                      }
                                                   },
                                                   error : function(
                                                         request,
                                                         status,
                                                         error) {
                                                      alert("code = "
                                                            + request.status
                                                            + " message = "
                                                            + request.responseText
                                                            + " error = "
                                                            + error);
                                                      //통신 실패시 발생하는 함수(콜백)
                                                   }
                                                });
                                       });
                        </script>

                        <div class="col-6">
                           <input type="button" class="btn btn-sm btn-default-alt pull-left"
                            style="margin-top: 10px" onclick="check()" id="modify" value="회원정보수정">

                        </div>
                     </div>
                     </fieldset>
                  </form>
               </div>
            </div>
         </section>
      </div>
   </div>
    <jsp:include page="/WEB-INF/views/footer.jsp"/>

<script>   
      $(function() {
         
         var addrStr = "${MemberBean.mem_addr}";
         var addArr = addrStr.split("&");
         $('#postcode').val(addArr[0]);
         $('#address').val(addArr[1]);
         $('#detailAddress').val(addArr[2]);
         $('#extraAddress').val(addArr[3]);
      });
      </script>
       <script type="text/javascript">
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
<script>
         $(document).keypress(function(e) { 
            if (e.keyCode == 13) e.preventDefault(); 
         });
      </script>
          <script>
          function check(){
             
              if($('#invalid-phone1').is(':visible')){
            alert('전화번호를 입력해주세요');
               return false;
            } else if($('#invalid-phone').is(':visible')){
            alert('입력하신 전화번호를 다시 확인해주세요.');
            return false;
            } else if($('#invalid-birth').is(':visible')){
            alert('생년월일을 입력해주세요');
             return false;
           } else if($('#invalid-pw2').is(':visible')){
            alert('입력하신 비밀번호를 다시 확인해주세요.');
             return false;
           }else if($('#postcode').val() == "" || $('#address').val() == "" || $('#detailAddress').val() == ""){
              alert('주소를 입력해주세요. ');
              return false;
           }
              
         document.getElementById('form').submit();
          }
      </script>
  
  
      
      <script src="/resources/assets/js/form-validation.js"></script>
</body>
</html>