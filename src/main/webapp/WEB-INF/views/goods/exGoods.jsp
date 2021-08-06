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
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container"><br>
<form action="/goods/exGoodsOk" method="POST" onsubmit="return exCheck()">
	<table class="exGoods">
		<thead>
			<tr><th scope="col" colspan="3">교환 정보</th></tr>
		</thead>
	</table>
	<c:if test="${empty auth}">
		<table class="exGoods">
			<tr><td colspan="3" width="25%"><p class="exGoodsImg"><img src="${goods.goods_img}" width="250" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></p></td></tr>
			<tr><td colspan="3" align="center"><strong>교환은 로그인 후 가능합니다.</strong></td></tr>
			<tr><th scope="col">선택 상품</th><td>${goods.goods_name}</td></tr>
			<tr><th scope="col">상품 정보</th><td>${goods.goods_info}</td></tr>
			<tr><th scope="col">필요 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
		</table>
	</c:if>
			
	<c:if test="${!empty auth}">
		<table class="exGoods">
			<tr><td rowspan="3"><p class="exGoodsImg"><img src="${goods.goods_img}" width="250" alt="환경을 생각하는 친환경 제품" title="지구마켓 상품"/></p></td>
			<th scope="col" colspan="2">선택 상품</th><td colspan="3">${goods.goods_name}</td></tr>
			<tr><th scope="col" colspan="2">상품 정보</th><td colspan="3">${goods.goods_info}</td></tr>
			<tr><th scope="col" colspan="2">필요 포인트</th><td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
			<tr><td colspan="6"></td></tr>
		</table>
		<table class="exGoods">
			<tr><th scope="col">주문자</th><td>${member.mem_name}</td></tr>
			<tr><th scope="col">전화번호</th><td>${member.mem_tel}</td></tr>
			<tr><th scope="col">배송지 정보</th>
			<td><input type="text" id="postcode" required placeholder="우편번호" style="width:160px;">
			<input type="button" onclick="execDaumPostcode()" value="주소수정"><br>
			<input type="text" id="address" required placeholder="주소" style="width:610px; margin:5px 0px"><br>
			<input type="text" id="detailAddress" required placeholder="상세주소" style="width:301px;">
			<input type="text" id="extraAddress" placeholder="참고항목" style="width:300px;"></td></tr>
			<tr><th scope="col">보유 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.mem_point}"/> point</td></tr>
			<tr><th scope="col">필요 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${goods.goods_point}"/> point</td></tr>
			<tr><th scope="col">잔여 포인트</th><td><fmt:formatNumber type="number" maxFractionDigits="3" value="${member.mem_point - goods.goods_point}"/> point</td></tr>
		</table>
	</c:if>
	<br>
	
	<input type="hidden" name="goods_name" value="${goods.goods_name}">
	<input type="hidden" name="goods_img" value="${goods.goods_img}">
	<input type="hidden" name="exg_id" value="${member.mem_id}">
	<input type="hidden" name="exg_name" value="${member.mem_name}">
	<input type="hidden" name="exg_gnum" value="${goods.goods_num}">
	<input type="hidden" name="exg_point" value="${goods.goods_point}">
	<input type="hidden" name="exg_addr" id="exg_addr">
	<div class="exButton"><button type="button" onclick="location.href='/goods/list'">목록보기</button>
	<c:if test="${empty auth}">
		<button type="button" onclick="alert('로그인 페이지로 이동합니다.'); location.href='/auth/login'">교환하기</button>
	</c:if>	
	<c:if test="${!empty auth}">
		<input type="submit" value="교환하기 "/>
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

function exCheck() {
	var addAddressStr = $('#postcode').val() + "&" + $('#address').val() + "&" + $('#detailAddress').val() + "&" + $('#extraAddress').val()
	$('#exg_addr').val(addAddressStr);
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