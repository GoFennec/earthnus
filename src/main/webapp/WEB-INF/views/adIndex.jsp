<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>EARTH & US</title>
</head>
<body>

<div class="container"><br>
	<h2>관리자페이지</h2>
	
	<div>
		<nav>
			<ul>
				<li><a href="/adMember/list">회원관리</a></li>
				<li><a href="/adCamBoard/list">캠페인관리</a></li>
				<li><a href="/adDonation/list">기부관리</a></li>
				<li><a href="/adGoods/list">지구마켓상품관리</a></li>
				<li><a href="/adExGoods/list">지구마켓내역관리</a></li>
			</ul>
		</nav>
	</div>								
</div>

<script>
$(function() {
	if ("${auth.auth_id}" != "admin") {
		alert("접근권한이 없습니다.");
		location.href="/adAuth/login/123test123";
	}
});
</script>
</body>
</html>