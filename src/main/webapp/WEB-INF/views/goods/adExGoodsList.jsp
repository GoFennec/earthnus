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
	tbody th {padding: 10px; font-weight: bold; text-align: center; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; text-align: center; border-bottom: 1px solid #ccc;}
	td .goodsImg {text-align: center; margin: auto; padding: 1px;}
	.paging {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container"><br>

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">지구마켓 상품교환내역관리</th></tr>
		</thead>
	</table><br>
	<div class="row">
		<div class="col-sm-12">
			<table class="goodsTable">
			<tr>
				<th scope="col">교환번호</th>
				<th scope="col">주문자아이디</th>
				<th scope="col">주문자이름</th>
				<th scope="col">주문자주소</th>
				<th scope="col">상품정보</th>
				<th scope="col">상품포인트</th>
				<th scope="col">교환날짜</th>
			</tr>	
			<c:forEach items="${exGoodsList}" var="exGoods">
					<tr>
						<td>${exGoods.exg_num}</td>
						<td>${exGoods.exg_id}</td>
						<td>${exGoods.exg_name}</td>
						<td>${exGoods.exg_addr}</td>
						<td>${exGoods.exg_gnum}(${exGoods.exg_gname})</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${exGoods.exg_point}"/> point</td>
						<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_date}"/></td>
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
</body>
</html>