<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<br><br><br><br>
<div class="container">

<form action="/goods/exGoodsOk" method="POST" onsubmit="return exCheck()">
	<c:if test="${empty auth}">
		<table class="exGoods">
			<thead>
				<tr><th scope="col" colspan="3">교환 정보</th></tr>
			</thead>
			<tbody>
				<tr><td colspan="3"><p class="exGoodsImg"><img src="${goods.goods_img}" width="250" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></p></td></tr>
				<tr><th scope="col">선택 상품</th><td colspan="2">${goods.goods_name}</td></tr>
				<tr><th scope="col">상품 정보</th><td colspan="2">${goods.goods_desc}</td></tr>
				<tr><th scope="col">필요 포인트</th><td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
				<tr><td colspan="3" align="center"><strong>교환은 로그인 후 가능합니다.</strong></td></tr>
			</tbody>
		</table><br>
	</c:if>
	
	<c:if test="${!empty auth}">
		<table class="exGoods">
			<thead>
				<tr><th scope="col" colspan="3">교환 정보</th></tr>
			</thead>
			<tbody>
				<tr><td colspan="3"><p class="exGoodsImg"><img src="${goods.goods_img}" width="250" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></p></td></tr>
				<tr><th scope="col">선택 상품</th><td colspan="2">${goods.goods_name}</td></tr>
				<tr><th scope="col">상품 정보</th><td colspan="2">${goods.goods_desc}</td></tr>
				<tr><th scope="col">필요 포인트</th><td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
			</tbody>
		</table><br>
		<table class="exGoods">
			<thead>
				<tr><th scope="col" colspan="3">배송지 정보</th></tr>
			</thead>
			<tbody>
				<tr><th scope="col">주문자</th><td colspan="2">${member.mem_name}</td></tr>
				<tr><th scope="col">전화번호</th><td colspan="2">${member.mem_tel}</td></tr>
				<tr><th scope="col">배송지 정보</th>
				<td colspan="2"><input type="text" id="postcode" required placeholder="우편번호" style="width:160px;" maxlength="5" pattern="^[0-9]+$">
				<input type="button" onclick="execDaumPostcode()" value="주소수정"><br>
				<input type="text" id="address" required placeholder="주소" style="width:604px; margin:5px 0px" maxlength="50"><br>
				<input type="text" id="detailAddress" required placeholder="상세주소" style="width:300px;" maxlength="30">
				<input type="text" id="extraAddress" placeholder="참고항목" style="width:300px;" maxlength="20"></td></tr>
				<tr><th scope="col">요청사항</th><td colspan="2"><textarea id="message" rows="2" cols="66" placeholder="요청사항이 있으시면 입력해주세요."></textarea></td></tr>
				<tr><th scope="col">보유 포인트</th><td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.mem_point}"/> point</td></tr>
				<tr><th scope="col">필요 포인트</th><td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
				<tr><th scope="col">잔여 포인트</th><td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.mem_point - goods.goods_point}"/> point</td></tr>
			</tbody>
		</table><br>
		<table class="goodsInfo">
			<thead>
				<tr><th scope="col" colspan="3">상품 정보</th></tr>
			</thead>
			<tbody>
				<c:set var = "num" value="0"/>
				<c:forEach items="${goodsInfo}" var="i" step="2">
					<tr>
						<th scope="col"><c:forEach items="${goodsInfo}" var="info" begin="${num}" end="${num}"><c:set var="num" value="${num+1}"/>${info}</c:forEach></th>
						<td colspan="2"><c:forEach items="${goodsInfo}" var="info" begin="${num}" end="${num}"><c:set var="num" value="${num+1}"/>${info}</c:forEach></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<br>
	
	<input type="hidden" name="goods_name" value="${goods.goods_name}">
	<input type="hidden" name="goods_img" value="${goods.goods_img}">
	<input type="hidden" name="exg_id" value="${member.mem_id}">
	<input type="hidden" name="exg_name" value="${member.mem_name}">
	<input type="hidden" name="exg_addr" id="exg_addr">
	<input type="hidden" name="exg_message" id="exg_message">
	<input type="hidden" name="exg_gnum" value="${goods.goods_num}">
	<input type="hidden" name="exg_gname" value="${goods.goods_name}">
	<input type="hidden" name="exg_point" value="${goods.goods_point}">
	<input type="hidden" name="exg_img" value="${goods.goods_img}">
	<div class="exButton"><button type="button" class="btn" onclick="location.href='/goods/list'">목록보기</button>&nbsp;&nbsp;&nbsp;
	<c:if test="${empty auth}">
		<button type="button" class="btn" onclick="location.href='/goods/exGoodsOk'">교환하기</button>
	</c:if>	
	<c:if test="${!empty auth}">
		<input type="submit" class="btn" value="교환하기 "/>
	</c:if>
	</div>
	</form><br/>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>

<script>
$(function() {
	var addrStr = "${member.mem_addr}";
	var addArr = addrStr.split("&");
	$('#postcode').val(addArr[0]);
	$('#address').val(addArr[1]);
	$('#detailAddress').val(addArr[2]);
	$('#extraAddress').val(addArr[3]);
});

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
                    extraAddr = '(' + extraAddr + ')';
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

function exCheck() {
	var addAddressStr = $('#postcode').val() + "&" + $('#address').val() + "&" + $('#detailAddress').val() + "&" + $('#extraAddress').val()
	$('#exg_addr').val(addAddressStr);
	$('#exg_message').val($('#message').val());
	if ("${member.mem_point}" - "${goods.goods_point}" < 0) {
		alert("보유 포인트가 부족합니다.");
		return false;
	}
	if(confirm("${goods.goods_name}(으)로 교환하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}
</script>
</body>
</html>