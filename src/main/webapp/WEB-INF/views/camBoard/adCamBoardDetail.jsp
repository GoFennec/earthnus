<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	tr {max-width: 900px}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none; background: transparent;}
	textarea {border: none; width: 100%; background: transparent;}
	select {border: none; background: transparent;}
	.sysBtn {text-align: center;}
	#max{max-width: 600px}
	.update{background-color: #FFFAFA;}
	input[type=date]::-webkit-calendar-picker-indicator {margin-left: 100px; background: none;}
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Detail</title>
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

	<div class="container col-sm-12 col-lg-4">
		<form action="/adCamBoard/updateOk" method="POST" enctype="multipart/form-data">
			<table class="goodsTable">
				<tr>
					<td colspan = "4">
						<h1 style="text-align: center"><b>캠페인 정보</b>&nbsp;&nbsp;&nbsp;<b>#${camBoard.CAMB_NUM}</b></h1>
						<input type="hidden" name="CAMB_NUM" value="${camBoard.CAMB_NUM}">
					</td>
				</tr>
				<tr>
					<td colspan = "4">
						<div id="max" class="file-wrapper flie-wrapper-area">
								<input type="file" name="CAMB_UPLOADFILE" id="file" class="upload-box upload-plus" accept="image/*" style="display: none;">
									<div id="preview"></div>
									<input type="hidden" name="goods_img" value="${goods.goods_img}">
								<div style="text-align: center;" class="file-edit-icon">
									<a href="#" class="preview-edit">수정</a>
									<a href="#" class="preview-de">삭제</a>
								</div>
						</div>
											
						<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
					</td>
				</tr>
				
				<tr>
					<td><b>제목</b></td>
					<td class="update"><input type="text" name="CAMB_NAME" value="${camBoard.CAMB_NAME}" onchange="showUpdateButton()" required></td>
					<td><b>주제</b></td><!-- <input type="text" name="CAMB_SUBJECT" value="${camBoard.CAMB_SUBJECT}"> --> 
					<td class="update">
						<select id="CAMB_SUBJECT" name="CAMB_SUBJECT" onchange="showUpdateButton()" required>
						<option value="해양">해양</option>
						<option value="플라스틱">플라스틱</option>
						<option value="산림">산림</option>
						<option value="극지방">극지방</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td><b>시작일</b></td>
					<td class="update">
					<input type="date" id="CAMB_STARTDATE" name="CAMB_STARTDATE">
					</td>
					<td><b>종료일</b></td>
					<td class="update">
						<input type="date" id="CAMB_FINDATE" name="CAMB_FINDATE">
					</td>
				</tr>
				
				<tr style="text-align: center;">
					<td colspan="4"><b>캠페인 내용</b></td>
				</tr>
				<tr class="update" style="text-align: center;">
					<td colspan="4"><textarea id="CAMB_CONTENT" name="CAMB_CONTENT" onchange="showUpdateButton()" required>${camBoard.CAMB_CONTENT}</textarea></td>
				</tr>
			</table>
			<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
			
			<div class="sysBtn">
				<input type="submit" class="btn-dark" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" class="btn-dark" value="삭제" 
				onclick="location.href='/adCamBoard/delete?CAMB_NUM=${camBoard.CAMB_NUM}'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" class="btn-dark" value="목록" 
				onclick="location.href='/adCamBoard/list'"/>
			</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

<script type="text/javascript">
	window.onload = function(){
		
		$("#preview").html(['<img src="${camBoard.CAMB_FILE}" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="캠페인" onchange="showUpdateButton()" title="${camBoard.CAMB_SUBJECT}"/>'].join(''))
		
		var startdate = <fmt:formatDate pattern="yyyy-MM-dd" value="${camBoard.CAMB_STARTDATE}" />;
		var findate = <fmt:formatDate pattern="yyyy-MM-dd" value="${camBoard.CAMB_FINDATE}" />;
		
		document.getElementById("CAMB_STARTDATE").value=startdate;
		document.getElementById("CAMB_FINDATE").value=findate;
		
		$('#CAMB_SUBJECT').val('플라스틱').prop("selected", true);
	}
	
	function showUpdateButton(){
	}

	function handleFileSelect(event) {
	    var input = this;
	    console.log(input.files)
	    if (input.files && input.files.length) {
	        var reader = new FileReader();
	        this.enabled = false
	        reader.onload = (function (e) {
	            $("#preview").html(['<img src="', e.target.result, '" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="캠페인" onchange="showUpdateButton()" title="', escape(e.name), '"/>'].join(''))
	        });
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#file').change(handleFileSelect);
	$('.file-edit-icon').on('click', '.preview-de', function () {
	    //$("#preview").html(['<img src="/resorces/camBoard/imgDefault.png" id="IMG" width="600" alt="캠페인" title="', escape(e.name), '"/>'].join(''))
	    $("#file").val("");
	});
	$('.preview-edit').click( function() {
	  $("#file").click();
	} );
</script>
</body>
</html>