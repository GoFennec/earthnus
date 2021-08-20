<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	table {margin: auto; vertical-align: middle;}
	thead th {padding: 5px; font-weight: bold; vertical-align: top; color: #696969; border-bottom: 3px solid #BEBEBE;}
	td {padding: 15px; border-bottom: 2px solid #ddd;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 300px; vertical-align: middle;}
	.sysBtn {text-align: center;}
	#ccSelect {width: 100px;}
	label {vertical-align: middle;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container">

	<div class="updateForm">
	<form action="/adExGoods/cancle" id="adExGoodsCancle" method="POST">
		<input type="hidden" name="exg_num" value="${exGoods.exg_num}">
		<input type="hidden" name="exg_id" value="${exGoods.exg_id}"/>
		<input type="hidden" name="exg_point" value="${exGoods.exg_point}"/>
		<input type="hidden" name="exg_cancle" id="exg_cancle"/>
	</form>
	<form action="/adExGoods/deliveryOk" method="POST" onsubmit="return checkDelivery();">
		<table class="insertFormTable">
			<thead>
				<tr><th scope="col" colspan="2">결제상세내역</th></tr>
			</thead>
			<tbody>
				<tr><td class="td_left">결&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;호&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_num}<input type="hidden" name="exg_num" value="${exGoods.exg_num}"></td></tr>
				<tr><td class="td_left">주 문 자 이 름&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_name}</td></tr>
				<tr><td class="td_left">상&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;보&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_gnum}(${exGoods.exg_gname})</td></tr>
				<tr><td class="td_left">사용한포인트&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_point}</td></tr>
				<tr><td class="td_left">주&nbsp;&nbsp;문&nbsp;&nbsp;&nbsp;상&nbsp;&nbsp;태&nbsp;&nbsp;&nbsp;</td>
					<td>${exGoods.exg_state}</td></tr>
				<tr><td class="td_left">주 문 자 주 소&nbsp;&nbsp;&nbsp;</td>
					<td id="addr"></td></tr>
				<tr><td class="td_left">교&nbsp;&nbsp;환&nbsp;&nbsp;&nbsp;날&nbsp;&nbsp;짜&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${exGoods.exg_pdate}"/></td></tr>
				<tr><td class="td_left">택&nbsp;&nbsp;배&nbsp;&nbsp;&nbsp;회&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;</td>
					<td class="td_right"><select name="exg_cc" id="selectBox">
					    <option value="">직접입력</option>
					    <option value="CJ대한통운">CJ대한통운</option>
					    <option value="롯데택배">롯데택배</option>
					    <option value="우체국택배">우체국택배</option>
					    <option value="로젠택배">로젠택배</option>
					    <option value="한진택배">한진택배</option>
					    <option value="CU편의점택배">CU편의점택배</option>
					    <option value="EMS택배">EMS택배</option>
					    <option value="경동택배">경동택배</option>
					    <option value="대신택배">대신택배</option>
					    <option value="DHL택배">DHL택배</option>
					    <option value="FedEx">FedEx</option></select>
					<!-- <input type="text" id="exg_cc" value="" required> -->
				<tr><td class="td_left"><label for="exg_waybill">운 송 장 번 호&nbsp;&nbsp;&nbsp;</label></td>
					<td class="td_right"><input type="text" name="exg_waybill" id="exg_waybill" value="" required></td>
			</tbody>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="배송처리"/>
			<input type="button" class="btn-dark" value="취소처리" onclick="cancle()"/>
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
	$('#addr').html(addArr[0] + "<br>" + addArr[1] + " " + addArr[3] + "<br>" + addArr[2]);
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
function checkDelivery() {
	if ($("#selectBox").val() == "") {
		alert("택배회사를 선택해주세요.");
		return false;
	} else {
		return true;
	}
}
function cancle() {
	if (confirm("정말 결제내역을 취소하시겠습니까?") == true) {
		var cancleReason = prompt("결제취소 사유를 적어주세요.");
		if (cancleReason != null) {
			$("#exg_cancle").val(cancleReason);
			$('#adExGoodsCancle').submit();
		} else {
			return false;
		}
	} else {
		return false;
	}
}
</script>
</body>
</html>