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
<link rel="shortcut icon" href="/resources/assets/img/favicon.ico">
<link rel="icon" href="/resources/assets/img/favicon.ico">
<script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script><!-- basic, standard, standard-all, full, full-all -->
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container"><br>

	<div class="insertForm">
	<form action="/adCamBoard/insertOk" method="POST" enctype="multipart/form-data">
		<table class="insertFormTable" style="text-align: center">
			<tr><td colspan="4" class="td_left"><label for="CAMB_FILE"><b>캠페인 사진</b></label></td></tr>
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
			
			<tr><td colspan="2" class="td_left"><label for="CAMB_NAME"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;제&nbsp;목&nbsp;</b></label></td>
				<td colspan="2" class="td_right"><input type="text" id="CAMB_NAME" name="CAMB_NAME" required></td></tr>
			<tr><td colspan="2" class="td_left"><label for="CAMB_SUBJECT"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;주&nbsp;제&nbsp;</b></label></td>
				<td colspan="2" class="td_right">
					<select name="CAMB_SUBJECT" id="CAMB_SUBJECT" required>
						<option selected>해양</option>
						<option>플라스틱</option>
						<option>산림</option>
						<option>극지방</option>
					</select>
				</td></tr>
			<tr><td colspan="4"><b>캠페인 기간</b></td></tr>
			<tr><td class="td_left"><label for="CAMB_NAME"><b>시작날짜</b></label></td>
				<td class="td_right"><input type="date" id="CAMB_STARTDATE" name="CAMB_STARTDATE" required></td>
				<td class="td_left"><label for="CAMB_NAME"><b>종료날짜</b></label></td>
				<td class="td_right"><input type="date" id="CAMB_FINDATE" name="CAMB_FINDATE" required></td></tr>
			<tr><td colspan="4" class="td_center"><label for="CAMB_CONTENT"><b>캠&nbsp;페&nbsp;인&nbsp;&nbsp;내&nbsp;용&nbsp;</b></label></td></tr>
			<tr class="update" style="text-align: center;">
				<td colspan="4">
					<textarea id = "CAMB_CONTENT" name = "CAMB_CONTENT" cols="80" rows="10">
						This is my textarea to be replaced with CKEditor 4.
					</textarea> 
					<script>
						CKEDITOR.replace('CAMB_CONTENT',{filebrowserUploadUrl:'/ckupload/imgUpload'});
					</script>
				</td>
			</tr>
		</table><br>
		<div class="sysBtn">
			<input type="submit" class="btn-dark" value="캠페인 추가"/>&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn-dark" value="뒤로가기" onclick="window.history.back();"/>
		</div>
	</form>
	</div><br>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function(){		
		$("#preview").html(['<img src="/resources/camBoard/imgDefault.png" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="기본 이미지" onchange="showUpdateButton()" title="기본 이미지"/>'].join(''))
		
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		
		var input = document.getElementById("CAMB_STARTDATE");
		input.setAttribute("min", "year-month-date");
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
	
	document.getElementById("CAMB_STARTDATE").onchange = function () {
	    var input = document.getElementById("CAMB_FINDATE");
	    input.setAttribute("min", this.value);
	}
</script>
</body>
</html>