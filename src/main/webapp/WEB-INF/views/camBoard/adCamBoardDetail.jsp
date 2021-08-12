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
	td {width: 350px; padding: 10px; vertical-align: center; border-bottom: 1px solid #ccc;}
	td .exGoodsImg {text-align: center; margin: auto; padding: 1px;}
	.exButton{text-align: center;}
</style>

<meta charset="EUC-KR">
<title>Detail</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

	<div class="col-sm-12 col-lg-4">
		<table class="goodsTable">
			<tr>
				<td class="tdImg"><img src="${camBoard.CAMB_FILE}" width="600" alt="캠페인" title="${camBoard.CAMB_SUBJECT}"/></td>
				<td>${camBoard.CAMB_NAME}</td>
				<td>${camBoard.CAMB_CONTENT}</td>
			</tr>
		</table>
	</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>