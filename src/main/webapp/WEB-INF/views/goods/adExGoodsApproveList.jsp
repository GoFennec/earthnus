<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	thead td {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {padding: 10px; font-weight: bold; text-align: center; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; text-align: center; border-bottom: 1px solid #ccc;}
	td .goodsImg {text-align: center; margin: auto; padding: 1px;}
	.paging {text-align: center;}
	.exGoodsInfo {cursor: pointer;}
	.btn-dark {float: right; margin-left: 10px;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container">

	<table class="exGoodsTitle">
		<thead>
			<tr><th scope="col">지구마켓 주문승인내역</th>
			<td><form action="/adExGoods/detail" id="detail" method="POST">
			<input type="hidden" id="exGoodsNum" name="exGoodsNum"/>
			</form></tr>
		</thead>
	</table><br>
	<div class="row">
		<div class="col-sm-12">
			<table class="exGoodsTable">
			<tr>
				<th scope="col">교환번호</th>
				<th scope="col">아이디</th>
				<th scope="col">주문상태</th>
				<th scope="col">상품정보</th>
				<th scope="col">사용한포인트</th>
				<th scope="col" width="13%">교환날짜</th>
				<th scope="col">배송메세지</th>
			</tr>	
			<c:forEach items="${exGoodsList}" var="exGoods">
					<tr class="exGoodsInfo" id="${exGoods.exg_num}">
						<td>${exGoods.exg_num}</td>
						<td>${exGoods.exg_id}</td>
						<td>${exGoods.exg_state}</td>
						<td>${exGoods.exg_gnum}(${exGoods.exg_gname})</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${exGoods.exg_point}"/> point</td>
						<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_date}"/></td>
						<td>${exGoods.exg_message}</td>
					</tr>
			</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="row">
	<div class="col-sm-12">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;">
					<c:if test="${page.prev}">
						<a href="?pagenum=${page.getStartPage()-1}">&lt;</a>
					</c:if>&nbsp;
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a href="?pagenum=${idx}">${idx}&nbsp;</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a href="?pagenum=${page.getEndPage()+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table><br/>
	</div>
	</div>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>
$(function() {
	$('.exGoodsInfo').click(function() {
		selectTr = $(this);
		selectTd = selectTr.children();
		exGoodsNum = selectTd.eq(0).text();
		$('#exGoodsNum').val(exGoodsNum);
		$('#detail').submit();
	});
});
</script>
</body>
</html>