<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="kr.co.earthnus.user.auth.AuthBean" %>
<% 
	int nowPageN = 0;
	if (request.getParameter("pagenum") != null ) {
		nowPageN = Integer.parseInt(request.getParameter("pagenum"));	
	}
%>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton {text-align: center;}
	.paging {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container"><br>
	<table class="exGoods">
		<thead>
			<tr><th scope="col">지구 마켓</th></tr>
		</thead>
	</table><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="0" end="2">
			<div class="col-sm-12 col-lg-4">
			<form action="/goods/exGoods" name="${goods.goods_num}" method="POST">
			<table class="goodsTable">
				<tr>
					<td class="tdImg"><img src="${goods.goods_img}" width="150" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></td>
					<td>
						<input type="hidden" name="goods_num" value="${goods.goods_num}">
						${goods.goods_name}<br/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point<br/>
						${goods.goods_info}<br/>
						<input type="submit" value="교환하기"/>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</c:forEach>
	</div>
	<div class="clearfix"></div><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="3" end="5">
			<div class="col-sm-12 col-lg-4">
			<form action="/goods/exGoods" name="${goods.goods_num}" method="POST">
			<table class="goodsTable">
				<tr>
					<td class="tdImg"><img src="${goods.goods_img}" width="150" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></td>
					<td>
						<input type="hidden" name="goods_num" value="${goods.goods_num}">
						${goods.goods_name}<br/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point<br/>
						${goods.goods_info}<br/>
						<input type="submit" value="교환하기"/>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</c:forEach>
	</div><br/>
	
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