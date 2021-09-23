<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #388E3C; border-bottom: 3px solid #388E3C;}
	tbody th {width: 200px; padding: 10px; font-weight: bold; text-align: center; 
			vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br>
<div class="container">

	<table class="exGoods">
		<thead>
			<tr><th scope="col" colspan="3">교환 상세 정보</th></tr>
		</thead>
		<tbody>
			<tr><td colspan="2"><p class="exGoodsImg"><img src="${goods.goods_img}" width="250" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></p></td></tr>
			<tr><th scope="col">교환 날짜</th><td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_pdate}"/></td></tr>
			<tr><th scope="col">선택 상품</th><td>${goods.goods_name}</td></tr>
		</tbody>
	</table><br/><br>
	<table class="exGoods">
		<thead>
			<tr><th scope="col" colspan="3">교환 포인트 정보</th></tr>
		</thead>
		</tbody>
			<tr><th scope="col">사용한 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${exGoods.exg_point}"/> point</td></tr>
			<tr><th scope="col">잔여 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.mem_point}"/> point</td></tr>
		</tbody>
	</table><br/><br>
	<table class="exGoods">
		<thead>
			<tr><th scope="col" colspan="3">배송지 정보</th></tr>
		</thead>
		</tbody>
			<tr><th scope="col">수취인</th><td>${exGoods.exg_recipient}</td></tr>
			<tr><th scope="col">연락처</th><td>${exGoods.exg_tel}</td></tr>
			<tr><th scope="col">배송지</th><td id="addr"></td></tr>
			<tr><th scope="col">요청사항</th><td>${exGoods.exg_message}</td></tr>
		</tbody>
	</table><br/><br>
	
	<div class="exButton">
	<button type="button" class="btn" onclick="location.href='/'">메인으로</button>&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn" onclick="location.href='/member/myOrder'">교환정보확인</button></div><br/>
	
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>
$(function() {
	var addrStr = "${exGoods.exg_addr}";
	var addArr = addrStr.split("&");
	$('#addr').html(addArr[0] + "<br>" + addArr[1] + " " + addArr[3] + "<br>" + addArr[2]);
});
</script>
</body>
</html>