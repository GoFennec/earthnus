<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	
	.goodsBox {padding: 10px;}
	.goodsImg {text-align: center; margin: auto; padding: 1px; width: 100%;}
	.goodsImg img {width: 200px; height: 200px; background-size: contain;}
	.goodsInfo {width: 70%; margin: 5px auto;}
	.goodsNP {font-weight: 700; color: #444; margin: 10px auto; line-height: 1.5em;}
	.goodsDesc {margin: 0px auto; line-height: 1.5em;}
	.paging {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container"><br>

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">지구 마켓</th></tr>
		</thead>
	</table><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="0" end="3">
			<div class="col-12 col-sm-6 col-md-3 goodsBox">
				<form action="/goods/exGoods" method="POST" id="GF_${goods.goods_num}">
					<div class="selectGoods" style="cursor: pointer;" id="${goods.goods_num}">
						<input type="hidden" name="goods_num" value="${goods.goods_num}" />
						<div class="goodsImg">
							<img src="${goods.goods_img}" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품" />
						</div>
						<div class="goodsInfo">
							<p class="goodsNP">${goods.goods_name}<br>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</p>
							<p class="goodsDesc">${goods.goods_desc}</p>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
	<div class="clearfix"></div><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="4" end="7">
			<div class="col-12 col-sm-6 col-md-3 goodsBox">
				<form action="/goods/exGoods" method="POST" id="GF_${goods.goods_num}">
					<div class="selectGoods" style="cursor: pointer;" id="${goods.goods_num}">
						<input type="hidden" name="goods_num" value="${goods.goods_num}" />
						<div class="goodsImg">
							<img src="${goods.goods_img}" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품" />
						</div>
						<div class="goodsInfo">
							<p class="goodsNP">${goods.goods_name}<br>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</p>
							<p class="goodsDesc">${goods.goods_desc}</p>
						</div>
					</div>
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
<script type="text/javascript">
$(function() {
	$('.selectGoods').click(function() {
		var formName = "GF_" + $(this).attr('id');
		document.getElementById(formName).submit();
	});
});
</script>
</body>
</html>