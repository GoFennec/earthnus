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
					<img src="${camBoard.CAMB_FILE}" id="IMG" width="600" alt="ķ����" title="${camBoard.CAMB_SUBJECT}"/>
					<input type="file" id="CAMB_FILE" name="CAMB_FILE" style="display:none;">
				</td>
			</tr>
			<tr>
				<td>ķ���� �̸�&nbsp;&nbsp;&nbsp;</td><td><input type="text" id="" name="CAMB_NAME" value="${camBoard.CAMB_NAME}" readonly></td>
			</tr>	
			<tr>
				<td>ķ���� ����&nbsp;&nbsp;&nbsp;</td> 
				<td><input type="text" name="CAMB_SUBJECT" value="${camBoard.CAMB_SUBJECT}" readonly></td>
			</tr>
			<tr>
				<td>ķ���� ����&nbsp;&nbsp;&nbsp;</td><td><textarea name="CAMB_CONTENT" readonly>${camBoard.CAMB_CONTENT}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="sysBtn" style="text-align: center;">
					<input type="button" class="btn-dark" value="���" onclick="location.href='/camBoard/list'"/>
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
		listHead += '<th scope="col">ķ���� ��ȣ</th>';
		listHead += '<th scope="col">ķ���� ����</th>';
		listHead += '<th scope="col">ķ���� ����</th>';
		listHead += '<th scope="col">ķ���� ����</th>';
		listHead += '</tr>';
		
		if(preUrl.indexOf("search") > -1){
			console.log("search" + preUrl.substring(42));
			
			$.ajax({
				
				url:"/getList" + preUrl.substring(42),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX��� ����");
					
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
					console.log("AJAX��� ����");
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
			
			console.log("����ε� ��� : " + preUrl.substring(37));
			
			$.ajax({
				
				url:preUrl.substring(21),
				type:"GET",
				dataType:"json",
				"success" : function(CamBoardList){
					console.log("AJAX��� ����");
				    
				},
				"error" : function(CamBoardList){
					console.log("AJAX��� ����");
			    }
			});
		}else{
			console.log("���� ���� ���" + preUrl.substring(21));
			
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