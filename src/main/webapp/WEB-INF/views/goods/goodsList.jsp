<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-size: 1.5em; font-weight: bold; vertical-align: middle; color: #388E3C; border-bottom: 3px solid #388E3C;}
	thead td {padding: 3px; vertical-align: middle; color: #444; border-bottom: 3px solid #388E3C;}
	#selectTd {width: 30%}
	.goodsBox {padding: 10px;}
	.goodsImg {text-align: center; margin: auto; padding: 1px; width: 100%;}
	.goodsImg img {width: 200px; height: 200px; background-size: contain;}
	.goodsNPInfo {width: 200px; margin: 5px auto;}
	.goodsNP {font-weight: 700; color: #444; margin: 10px auto; line-height: 1.3em;}
	.goodsInfo {display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: auto;
				white-space: normal; line-height: 1.42; height: 4.26em; text-align: left; word-wrap: break-word; display: -webkit-box;
				-webkit-line-clamp: 3; -webkit-box-orient: vertical;}
	.paging {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container"><br>
	<form action="/goods/list" id="kindsSearch" method="post">
	<table class="goodsTitle">
		<thead>
			<tr>
				<th scope="col">지구마켓</th>
				<td id="selectTd"><select name="goodsKinds" id="selectBox" onchange="goodsChange(this);">
					<option value="">전체보기</option>
					<c:forEach var="category" items="${goodsCategory}">
						<c:if test="${goodsKinds eq category.goods_category}">
							<option value="${category.goods_category}" selected>${category.goods_category}</option>
						</c:if>
						<c:if test="${goodsKinds ne category.goods_category}">
							<option value="${category.goods_category}">${category.goods_category}</option>
						</c:if>	
					</c:forEach>
				</select></td>
			</tr>
		</thead>
	</table>
	</form><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="0" end="3">
			<div class="col-12 col-sm-6 col-lg-3 goodsBox">
				<form action="/goods/exGoods" method="POST" id="GF_${goods.goods_num}">
					<div class="selectGoods" style="cursor: pointer;" id="${goods.goods_num}">
						<input type="hidden" name="goods_num" value="${goods.goods_num}" />
						<div class="goodsImg">
							<img src="${goods.goods_img}" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품" />
						</div>
						<div class="goodsNPInfo">
							<p class="goodsNP">${goods.goods_name}<br>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</p>
						</div>
						<div class="goodsInfo">${goods.goods_desc}</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
	<div class="clearfix"></div><br>
	<div class="row">
		<c:forEach items="${goodsList}" var="goods" begin="4" end="7">
			<div class="col-12 col-sm-6 col-lg-3 goodsBox">
				<form action="/goods/exGoods" method="POST" id="GF_${goods.goods_num}">
					<div class="selectGoods" style="cursor: pointer;" id="${goods.goods_num}">
						<input type="hidden" name="goods_num" value="${goods.goods_num}" />
						<div class="goodsImg">
							<img src="${goods.goods_img}" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품" />
						</div>
						<div class="goodsNPInfo">
							<p class="goodsNP">${goods.goods_name}<br>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</p>
						</div>
						<div class="goodsInfo">${goods.goods_desc}</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
	
	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${page.prev}">
	    		<li class="page-item">
					<a href="?pagenum=${page.getStartPage()-1}" class="page-link" aria-label="Previous">
						<i class="ti-angle-left"></i>
					</a>
				</li>
			</c:if>
			<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">	
				<li class="page-item">
					<a href="?pagenum=${idx}" class="page-link">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${page.next}">
				<li class="page-item">
					<a href="?pagenum=${page.getEndPage()+1}" class="page-link" aria-label="Next">
						<i class="ti-angle-right"></i>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
$(function() {
	$('.selectGoods').click(function() {
		var formName = "GF_" + $(this).attr('id');
		document.getElementById(formName).submit();
	});
});
function goodsChange(obj) {
	$('#kindsSearch').submit();
}
</script>
</body>
</html>