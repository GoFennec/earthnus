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
			<tr>
				<td colspan="2" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="목록" onclick="location.href='/camBoard/list'"/>
				</td>
			</tr>
		</table>
		
		<div id="camBoardList"></div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript">
	$(document).ready(function(){
		var preUrl = document.referrer;
		var listHead = '<table>';
		listHead += '<tr>';
		listHead += '<th scope="col">캠페인 번호</th>';
		listHead += '<th scope="col">캠페인 제목</th>';
		listHead += '<th scope="col">캠페인 주제</th>';
		listHead += '<th scope="col">캠페인 내용</th>';
		listHead += '</tr>';
		
		if(preUrl.indexOf("search") > -1){
			console.log("search" + preUrl.substring(42));
			
			$.ajax({
				
				url:"/getList" + preUrl.substring(42),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX통신 성공");
					
					$.each(CamBoardList, function(index, item){
						listHead += '<tr>';
						listHead += '<td>' + item.CAMB_NUM + '</td>';
						listHead += '<td>' + item.CAMB_NAME + '</td>';
						listHead += '<td>' + item.CAMB_SUBJECT + '</td>';
						listHead += '<td>' + item.CAMB_CONTENT + '</td>';
						listHead += '</tr>';
					})
					
					$('#camBoardList').html(listHead);
				},
				"error" : function(CamBoardList){
					console.log("AJAX통신 실패");
			    }
			});
		} 
		if(preUrl.indexOf("search") === -1){
			if(preUrl.indexOf("/camBoard/list") > -1){
				console.log("list");
			}else if(preUrl.indexOf("/camBoard/list") === -1){
				console.log("nothing");
			}			
		} 
		
		if(preUrl.substring(21,36) === "/camBoard/list"){
			
			console.log("제대로된 경로 : " + preUrl.substring(37));
			
			$.ajax({
				
				url:preUrl.substring(21),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX통신 성공");
				    
				},
				"error" : function(CamBoardList){
					console.log("AJAX통신 실패");
			    }
			});
		}else{
			console.log("옳지 않은 경로" + preUrl.substring(21));
			
			$.ajax({
				
				url:"/camBoard/list",
				type:"GET",
				dataType:"json",
				success:function(args){
					var str = "";
				}
			});
		}
		listHead += '';
	})
</script>
</body>
</html>