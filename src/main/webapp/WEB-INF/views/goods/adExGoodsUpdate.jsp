<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	table {margin: auto;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 300px;}
	.sysBtn {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container"><br>

	<div class="updateForm">
	<form action="/adExGoods/updateOk" method="POST" onsubmit="return exCheck()">
		<table class="insertFormTable">
			<tr><td class="td_left"><label for="exg_numV">교&nbsp;&nbsp;환&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" id="exg_numV" value="${exGoods.exg_num}" disabled>
				<input type="hidden" name="exg_num" value="${exGoods.exg_num}"></td></tr>
			<tr><td class="td_left"><label for="exg_idV">주문자아이디&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="exg_idV" id="exg_idV" value="${exGoods.exg_id}" disabled></td></tr>
			<tr><td class="td_left"><label for="exg_nameV">주 문 자 이 름&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="exg_nameV" id="exg_nameV" value="${exGoods.exg_name}" disabled></td></tr>
			<tr><td class="td_left"><label for="exg_gInfo">상&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;보&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="exg_gInfo" id="exg_gInfo" value="${exGoods.exg_gnum}(${exGoods.exg_gname})" disabled></td></tr>
			<tr><td class="td_left"><label for="exg_pointV">상 품 포 인 트&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="exg_pointV" id="exg_pointV" value="${exGoodsPoint}" disabled></td></tr>
			<tr><td class="td_left"><label for="exg_dateV">교&nbsp;&nbsp;환&nbsp;&nbsp;&nbsp;날&nbsp;&nbsp;짜&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="exg_dateV" id="exg_dateV" value="${exGoodsDate}" disabled></td></tr>
			<tr><td class="td_left"><label for="updateAddress">주 문 자 주 소&nbsp;&nbsp;&nbsp;</label></td>
				<td><input type="text" id="postcode" required placeholder="우편번호" style="width:160px;">
				<input type="button" id="updateAddress" onclick="execDaumPostcode()" value="주소수정"><br>
				<input type="text" id="address" required placeholder="주소" style="width:500px; margin:5px 0px"><br>
				<input type="text" id="detailAddress" required placeholder="상세주소" style="width:250px;">
				<input type="text" id="extraAddress" placeholder="참고항목" style="width:245px;">
				<input type="hidden" name="exg_addr" id="exg_addr"></td></tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="내역변경"/>
			<input type="button" class="btn-dark" value="뒤로가기" onclick="location.href='/adExGoods/list'"/>
		</div>	
	</form>
	</div><br>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>
$(function() {
	var addrStr = "${exGoods.exg_addr}";
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
}
</script>
</body>
</html>