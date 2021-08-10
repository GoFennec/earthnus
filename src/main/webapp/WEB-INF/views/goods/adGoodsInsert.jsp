<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	table {margin: auto;}
	.td_left {text-align: center; vertical-align: middle;}
	.td_right input {width: 251px;}
	.sysBtn {text-align: center;}
</style>
<title>EARTH & US</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container"><br>

	<div class="insertForm">
	<form action="/adGoods/insertOk" method="POST" enctype="multipart/form-data">
		<table class="insertFormTable">
			<tr><td class="td_left"><label for="goods_numV">상&nbsp;품&nbsp;&nbsp;번&nbsp;호&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" id="goods_numV" value="${newGoodsNum}" disabled required>
				<input type="hidden" name="goods_num" value="${newGoodsNum}"></td></tr>
			<tr><td class="td_left"><label for="goods_name">상&nbsp;품&nbsp;&nbsp;이&nbsp;름&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_name" id="goods_name" required></td></tr>
			<tr><td class="td_left"><label for="goods_point">상품포인트&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_point" id="goods_point" required></td></tr>
			<tr><td class="td_left"><label for="goods_info">상&nbsp;품&nbsp;&nbsp;정&nbsp;보&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="text" name="goods_info" id="goods_info" required></td></tr>
			<tr><td class="td_left"><label for="goods_desc">상&nbsp;품&nbsp;&nbsp;설&nbsp;명&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><textarea cols="26" rows="6" style="resize: none;" name="goods_desc" id="goods_desc" required></textarea></td></tr>
			<tr><td class="td_left"><label for="goods_uploadFile">상&nbsp;품&nbsp;&nbsp;사&nbsp;진&nbsp;&nbsp;&nbsp;</label></td>
				<td class="td_right"><input type="file" name="goods_uploadFile" id="goods_uploadFile"></td></tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="상품추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="location.href='/adGoods/list'"/>
		</div>
	</form>
	</div><br>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>