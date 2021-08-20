<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {margin: auto;}
	thead th {padding: 5px; font-weight: bold; vertical-align: top; color: #696969; border-bottom: 3px solid #BEBEBE;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 400px;}
	.td_right2 .text {width: 199px;}
	.td_right2 .btnAdd {width: 80px;}
	.sysBtn {text-align: center;}
	
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br><br><br><br>
<div class="container">

	<div class="insertForm">
	<form action="/adGoods/insertOk" method="POST" enctype="multipart/form-data" onsubmit="return checkAdd();">
		<table class="insertFormTable">
			<thead><tr><th scope="col" colspan="2">지구마켓 상품추가</th></tr></thead>
			<tr><td class="td_left"><label for="goods_numV">상&nbsp;품&nbsp;&nbsp;번&nbsp;호&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" id="goods_numV" value="${newGoodsNum}" disabled required>
				<input type="hidden" name="goods_num" value="${newGoodsNum}"></td></tr>
			<tr><td class="td_left"><label for="goods_name">상&nbsp;품&nbsp;&nbsp;이&nbsp;름&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_name" id="goods_name" required></td></tr>
			<tr><td class="td_left"><label for="goods_point">상품포인트&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_point" id="goods_point" required></td></tr>
			<tr><td class="td_left"><label for="goods_desc">상&nbsp;품&nbsp;&nbsp;설&nbsp;명&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><textarea cols="43" rows="4" style="resize: none;" name="goods_desc" id="goods_desc" required></textarea></td></tr>
			<tr><td class="td_left"><label for="goods_uploadFile">상&nbsp;품&nbsp;&nbsp;사&nbsp;진&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="file" accept="image/*" name="goods_uploadFile" id="goods_uploadFile"></td></tr>
			<tr><td class="td_left"><label for="goods_info">상&nbsp;품&nbsp;&nbsp;정&nbsp;보&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right2">
					<input type="hidden" name="total" id="total" value="2">
					<input type="text" name="goods_info_1" id="goods_info_1" class="text" required placeholder="색상">
					<input type="text" name="goods_info_2" id="goods_info_2" class="text" required placeholder="레드">
					<input type="button" id="addInput" class="btn-dark btnAdd" value="정보추가"/></td></tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="상품추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="location.href='/adGoods/list'"/>
		</div>
	</form>
	</div><br>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
var i = 3;
$(function() {                
    $('#addInput').click (function () {
        $('.insertFormTable').append (
            "<tr><td></td><td class='td_right2'><input type='text' name='goods_info_"+i+"' id='goods_info_"+i+"' class='text' required> "
            +"<input type='text' name='goods_info_"+(i+1)+"' id='goods_info_"+(i+1)+"' class='text' required> "
            +"<input type='button' class='btnRemove btn-dark btnAdd' value='삭제'></td></tr>");
        $('.btnRemove').on('click', function () {
            $(this).prev().prev().remove();
            $(this).prev().remove();
            $(this).next().remove();
            $(this).remove();
        });
        i++; i++;
        $('#total').val(i-1);
    });
});
function checkAdd() {
	var o = 1;
	var dataInput = "";
	for (var num = 1; num <= $('#total').val(); num++) {
		if ($('#goods_info_'+num).val() == "" || $('#goods_info_'+num).val() == null) {
		} else {
			dataInput += num+",";
		}
	}
	$('#total').val(dataInput);
}
</script>
</body>
</html>