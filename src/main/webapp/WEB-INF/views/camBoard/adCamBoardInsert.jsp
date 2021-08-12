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
	<form action="/adCamBoard/insertOk" method="POST" enctype="multipart/form-data">
		<table class="insertFormTable">
			<tr><td class="td_left"><label for="CAMB_NAME">캠&nbsp;페&nbsp;인&nbsp;&nbsp;제&nbsp;목&nbsp;</label></td>
				<td class="td_right"><input type="text" id="CAMB_NAME" name="CAMB_NAME" required></td></tr>
			<tr><td class="td_left"><label for="CAMB_SUBJECT">캠&nbsp;페&nbsp;인&nbsp;&nbsp;주&nbsp;제&nbsp;</label></td>
				<td class="td_right">
					<select name="CAMB_SUBJECT" id="CAMB_SUBJECT" required>
						<option selected>해양</option>
						<option>플라스틱</option>
						<option>산림</option>
						<option>극지방</option>
					</select>
				</td></tr>
			<tr><td class="td_left"><label for="CAMB_CONTENT">캠&nbsp;페&nbsp;인&nbsp;&nbsp;내&nbsp;용&nbsp;</label></td>
				<td class="td_right"><textarea cols="26" rows="6" style="resize: none;" name="CAMB_CONTENT" id="CAMB_CONTENT" required></textarea></td></tr>
			<tr><td class="td_left"><label for="CAMB_FILE">캠&nbsp;페&nbsp;인&nbsp;&nbsp;사&nbsp;진&nbsp;</label></td>
				<td class="td_right"><input type="file" name="CAMB_UPLOADFILE" id="CAMB_UPLOADFILE" required></td></tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="캠페인 추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="window.history.back();"/>
		</div>
	</form>
	</div><br>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>