<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
table {
  width: 100%;
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;
}
th {
  padding: 10px;
  font-weight: bold;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
td {
  padding: 9px;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
}
.paging {text-align: center;}
</style>

<title>EARTH & US</title>
</head>

<body>

<div class="container">
	
		<div class="row">
			<div class="col-sm-12">
			<table class="donationList">
				<thead>
				<tr>
					<th>No.</th>
					<th>결제 번호</th>
					<th>후원자</th>
					<th>아이디</th>
					<th>결제 상품</th>
					<th>후원 금액</th>
					<th>적립 포인트</th>
					<th>후원 일자</th>
				</tr>
				</thead>
				
				<c:forEach items="${adDonationList}" var="donation">
				<tbody>
				<tr>
					<td>${donation.pay_no}</td>
					<td>${donation.pay_num}</td>
					<td>${donation.pay_name}</td>
					<td>${donation.pay_id}</td>
					<td>${donation.pay_dnum}</td>
					<td>${donation.pay_price}</td>
					<td>${donation.pay_point}</td>
					<td>${donation.pay_date}</td>
				</tr>
				</tbody>
				</c:forEach>
			</table>
			</div>
		</div><br>
		
		<div class="row">
		<div class="col-sm-12">
		<table class="paging">
			<tr>
				<td style="background-color: #0ed145;">
					<c:if test="${page.prev}">
						<a href="?pagenum=${page.getStartPage()-1}">&lt;</a>
					</c:if>&nbsp;
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<a href="?pagenum=${idx}">${idx}&nbsp;</a>
					</c:forEach>
					<c:if test="${page.next}">
						<a href="?pagenum=${page.getEndPage()+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table><br/>
	</div>
	</div>
</div>


</body>
</html>