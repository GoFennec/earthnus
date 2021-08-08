<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>EARTH & US</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

결제 성공
<br>
${pay.pay_num }<br>
${pay.pay_id }<br>
${pay.pay_name }<br>
${pay.pay_dnum }<br>
${pay.pay_price }<br>
${pay.pay_date }<br>
<br><br>

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>