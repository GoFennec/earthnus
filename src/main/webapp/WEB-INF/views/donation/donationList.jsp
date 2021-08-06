<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

<div class="container">

	<div class="row">
		<div class="col-xs-12 col-md-6">
			<a title="바다가 힘들어요!" href="/donation/ocean"><img src="/resources/donation/testD.jpg" alt="" width=100%></a>
		</div>
		<div class="col-xs-12 col-md-6">
			<p>바다가 힘들어요 copy</p>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-md-6">
			<p>나무를 심어요 copy</p>
		</div>
		<div class="col-xs-12 col-md-6">
			<a title="나무를 심어요!" href="/donation/forest"><img src="/resources/donation/testB.jpg" alt="사막화가 진행되고있는 토양 사진" width=100%></a>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-md-6">
			<a title="플라스틱이 넘쳐요!"	href="/donation/plastic"><img src="/resources/donation/testC.jpg" alt="방대한 양의 플라스틱 사진" width=100%></a>
		</div>
		<div class="col-xs-12 col-md-6">
			<p>플라스틱이 넘쳐요 copy</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-md-6">
			<p>북극곰을 도와줘요 copy</p>
		</div>
		<div class="col-xs-12 col-md-6">
			<a title="북극곰을 도와줘요!"	href="/donation/ice"><img src="/resources/donation/testA.jpg" alt="삶의 터전을 잃어가는 북극곰 사진" width=100%></a>
		</div>
	</div>

</div>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>