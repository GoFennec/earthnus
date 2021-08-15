<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	tr {max-width: 700px}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none;}
	textarea {border: none; min-width: 300px}
	.sysBtn {text-align: center;}
	#max{max-width: 600px}
</style>

<meta charset="EUC-KR">
<title>Detail</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

	<div class="container col-sm-12 col-lg-4">
		<form action="/adCamBoard/updateOk" method="POST" enctype="multipart/form-data">
			<table class="goodsTable">
				<tr>
					<td colspan = "2">
						<h1 style="text-align: center"><b>ķ���� ����</b></h1>
					</td>
				</tr>
				<tr>
					<td colspan = "2">
						<div id="max" class="file-wrapper flie-wrapper-area">
								<input type="file" name="CAMB_UPLOADFILE" id="file" class="upload-box upload-plus" accept="image/*" style="display: none;">
									<div id="preview"></div>
									<input type="hidden" name="goods_img" value="${goods.goods_img}">
								<div style="text-align: center;" class="file-edit-icon">
									<a href="#" class="preview-edit">����</a>
									<a href="#" class="preview-de">����</a>
								</div>
						</div>
											
						<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
					</td>
				</tr>
				
				<tr>
					<td>ķ���� �̸�&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="CAMB_NAME" value="${camBoard.CAMB_NAME}" onchange="showUpdateButton()" required></td>
				</tr>	
				<tr>
					<td>ķ���� ����</td><!-- <input type="text" name="CAMB_SUBJECT" value="${camBoard.CAMB_SUBJECT}"> --> 
					<td>
						<select id="CAMB_SUBJECT" name="CAMB_SUBJECT" onchange="showUpdateButton()" required>
						<option value="�ؾ�">�ؾ�</option>
						<option value="�ö�ƽ">�ö�ƽ</option>
						<option value="�긲">�긲</option>
						<option value="������">������</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>ķ���� ����&nbsp;&nbsp;&nbsp;</td><td><textarea name="CAMB_CONTENT" onchange="showUpdateButton()" required>${camBoard.CAMB_CONTENT}</textarea></td>
				</tr>
			</table>
			<div class="sysBtn">
				<input type="submit" class="btn-dark" value="����">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" class="btn-dark" value="����" 
				onclick="location.href='/adCamBoard/delete?CAMB_NUM=${camBoard.CAMB_NUM}'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" class="btn-dark" value="���" 
				onclick="location.href='/adCamBoard/list'"/>
			</div>
		</form>
			
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

<script type="text/javascript">
	window.onload = function(){

		$("#preview").html(['<img src="${camBoard.CAMB_FILE}" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="ķ����" onchange="showUpdateButton()" title="${camBoard.CAMB_SUBJECT}"/>'].join(''))
		
		$('#CAMB_SUBJECT').val('�ö�ƽ').prop("selected", true);
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
	            $("#preview").html(['<img src="', e.target.result, '" id="CAMB_UPLOADFILE" name="CAMB_UPLOADFILE" width="600" alt="ķ����" onchange="showUpdateButton()" title="', escape(e.name), '"/>'].join(''))
	        });
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#file').change(handleFileSelect);
	$('.file-edit-icon').on('click', '.preview-de', function () {
	    //$("#preview").html(['<img src="/resorces/camBoard/imgDefault.png" id="IMG" width="600" alt="ķ����" title="', escape(e.name), '"/>'].join(''))
	    $("#file").val("");
	});
	$('.preview-edit').click( function() {
	  $("#file").click();
	} );
</script>
</body>
</html>