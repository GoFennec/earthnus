<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% String pagenum = request.getParameter("pagenum");%>
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
	.goodsInfo {cursor: pointer;}
	.btn-dark {float: right; margin-left: 10px;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container">

	<table class="goodsTitle">
		<thead>
			<tr><th scope="col">지구마켓 상품관리</th>
			<td><button class="btn-dark" type="button" onClick="location.href='/adGoods/insert'">상품추가</button>
			<form action="/adGoods/update" method="POST" onsubmit="return checkUpdate();">
			<input type="hidden" id="goodsNumU" name="goodsNumU"/>
			<input class="btn-dark" type="submit" value="상품변경"/>
			</form>
			<form action="/adGoods/delete" method="POST" onsubmit="return checkDelete();">
			<input type="hidden" id="goodsNumD" name="goodsNumD"/>
			<input class="btn-dark" type="submit" value="상품삭제"/>
			</form></td></tr>
		</thead>
	</table><br>
	<div class="row">
		<div class="col-sm-12">
			<table class="goodsTable">
			<tr>
				<th scope="col">상품번호</th>
				<th scope="col">상품사진</th>
				<th scope="col">상품이름</th>
				<th scope="col">상품포인트</th>
				<th scope="col">상품정보</th>
				<th scope="col" width="30%">상품설명</th>
			</tr>	
			<c:forEach items="${goodsList}" var="goods">
					<tr class="goodsInfo" id="${goods.goods_num}">
						<td>${goods.goods_num}</td>
						<td class="goodsImg"><img src="<spring:url value='${goods.goods_img}'/>" height="120" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></td>
						<td>${goods.goods_name}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point<br/></td>
						<td><c:set var = "num" value="0"/>
						<c:forTokens  var="info" items="${goods.goods_info}" delims=",">
							${info}<c:if test="${num % 2 eq 0}"> : </c:if>
							<c:if test="${num % 2 eq 1}"><br></c:if>
							<c:set var="num" value="${num+1}"/>
						</c:forTokens></td>
						<td>${goods.goods_desc}</td>
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
	$('.goodsInfo').click(function() {
		$('.goodsInfo').css("background-color", "transparent");
		selectTr = $(this);
		selectTd = selectTr.children();
		goodsNum = selectTd.eq(0).text();
		$('#goodsNumU').val(goodsNum);
		$('#goodsNumD').val(goodsNum);
		$('#'+goodsNum).css("background-color", "#FFFFDE");
	});
});
function checkDelete() {
	if ($('#goodsNumD').val() == "") {
		alert("삭제할 항목을 선택해주세요.");
		return false;
	} else if($('#goodsNumD').val() != "") {
		if (confirm("정말 삭제하시겠습니까?") == true) {
		} else {
			return false;
 		}
	}
}
function checkUpdate() {
	if ($('#goodsNumU').val() == "") {
		alert("수정할 항목을 선택해주세요.");
		return false;
	}
}
</script>
</body>
</html>