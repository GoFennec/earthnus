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
<div class="container"><br>

	<table class="exGoodsTitle">
		<thead>
			<tr><th scope="col">지구마켓 교환내역관리</th>
			<td><form action="/adExGoods/update" method="POST" onsubmit="return checkUpdate();">
			<input type="hidden" id="exGoodsNumU" name="exGoodsNumU"/>
			<input type="hidden" id="exGoodsPoint" name="exGoodsPoint"/>
			<input type="hidden" id="exGoodsDate" name="exGoodsDate"/>
			<input class="btn-dark" type="submit" value="교환내역변경"/>
			</form>
			<form action="/adExGoods/delete" method="POST" onsubmit="return checkDelete();">
			<input type="hidden" id="exGoodsNumD" name="exGoodsNumD"/>
			<input class="btn-dark" type="submit" value="교환내역삭제"/>
			</form></td></tr>
		</thead>
	</table><br>
	<div class="row">
		<div class="col-sm-12">
			<table class="exGoodsTable">
			<tr>
				<th scope="col">교환번호</th>
				<th scope="col">주문자아이디</th>
				<th scope="col">주문자이름</th>
				<th scope="col" width="30%">주문자주소</th>
				<th scope="col">상품정보</th>
				<th scope="col">상품포인트</th>
				<th scope="col" width="13%">교환날짜</th>
			</tr>	
			<c:forEach items="${exGoodsList}" var="exGoods">
					<tr class="exGoodsInfo" id="${exGoods.exg_num}">
						<td>${exGoods.exg_num}</td>
						<td>${exGoods.exg_id}</td>
						<td>${exGoods.exg_name}</td>
						<td><c:forTokens  var="addr" items="${exGoods.exg_addr}" delims="&">${addr} </c:forTokens></td>
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
<script>
$(function() {
	$('.exGoodsInfo').click(function() {
		$('.exGoodsInfo').css("background-color", "transparent");
		selectTr = $(this);
		selectTd = selectTr.children();
		exGoodsNum = selectTd.eq(0).text();
		exGoodsPoint = selectTd.eq(5).text();
		exGoodsDate = selectTd.eq(6).text();
		$('#exGoodsNumU').val(exGoodsNum);
		$('#exGoodsNumD').val(exGoodsNum);
		$('#exGoodsPoint').val(exGoodsPoint);
		$('#exGoodsDate').val(exGoodsDate);
		$('#'+exGoodsNum).css("background-color", "#FFFFDE");
	});
});
function checkDelete() {
	if ($('#exGoodsNumD').val() == "") {
		alert("삭제할 항목을 선택해주세요.");
		return false;
	} else if($('#exGoodsNumD').val() != "") {
		if (confirm("정말 삭제하시겠습니까?") == true) {
		} else {
			return false;
 		}
	}
}
function checkUpdate() {
	if ($('#exGoodsNumU').val() == "") {
		alert("수정할 항목을 선택해주세요.");
		return false;
	}
}
</script>
</body>
</html>