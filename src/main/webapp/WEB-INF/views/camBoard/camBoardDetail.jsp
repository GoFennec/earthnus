<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<style>
	table {width: 100%; border-collapse: collapse; text-align: left; line-height: 1.5;}
	thead th {padding: 10px; font-weight: bold; vertical-align: top; color: #086121; border-bottom: 3px solid #0ed145;}
	tbody th {width: 150px; padding: 10px; font-weight: bold; vertical-align: center; border-bottom: 1px solid #ccc; background: #f3f6f7;}
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
	input {border: none;}
	textarea {border: none; min-width: 300px}
</style>

<script type="text/javascript">
	window.onload = function(){
		$.ajax({
			
			type:"POST",
			url:"/camBoard/list/search?search=&pagenum=",
			dataa:params,
			dataType:"json",
			success:function(args){
				var str = "";
			}
		})
	}
</script>

<meta charset="EUC-KR">
<title>Detail</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<div class="container col-sm-12 col-lg-4">
		<table class="goodsTable">
			<tr>
				<td colspan = "2">
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="600" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/>
					<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
				</td>
			</tr>
			<tr>
				<td>캠페인 이름&nbsp;&nbsp;&nbsp;</td><td><input type="text" id="" name="CAMB_NAME" value="${camBoard.CAMB_NAME}" readonly></td>
			</tr>	
			<tr>
				<td>캠페인 주제&nbsp;&nbsp;&nbsp;</td> 
				<td><input type="text" name="CAMB_SUBJECT" value="${camBoard.CAMB_SUBJECT}" readonly></td>
			</tr>
			<tr>
				<td>캠페인 내용&nbsp;&nbsp;&nbsp;</td><td><textarea name="CAMB_CONTENT" readonly>${camBoard.CAMB_CONTENT}</textarea></td>
			</tr>
		</table>
		<div class="sysBtn">
			<input type="button" class="btn-dark" value="목록" onclick="location.href='/camBoard/list'"/>
		</div>	
	</div>
	
	<div></div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>