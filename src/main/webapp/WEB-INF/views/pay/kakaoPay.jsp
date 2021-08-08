<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>EARTH & US</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br>

<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp38606976'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '후원 상품(${pay.pay_dnum}) 결제',
            amount : '${pay.pay_price}',
            buyer_email : '${member.mem_email}',
            buyer_name : '${member.mem_name}',
            buyer_tel : '${member.mem_tel}',
            buyer_addr : '${member.mem_addr}',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete/" + rsp.imp_uid, //cross-domain error가 발생하지 않도록 주의해주세요
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    data: JSON.stringify ({
                        pay_num : rsp.imp_uid,
                        pay_id : '${member.mem_id}',
                        pay_name : '${member.mem_name}',
						pay_dnum : '${pay.pay_dnum}',
                        pay_price : '${pay.pay_price}',
                        pay_date : rsp.paid_at
                        //기타 필요한 데이터가 있으면 추가 전달
                    })
                }).done(function(data) {
                	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                	if(rsp.paid_amount == data.response.amount) {
	                	var imp_id = rsp.imp_uid;
		                var msg = '결제가 완료되었습니다.';
		                /* msg += '\n고유ID : ' + rsp.imp_uid;
		                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                msg += '\n결제 금액 : ' + rsp.paid_amount;
		                msg += '\n카드 승인번호 : ' + rsp.apply_num; */
		                alert(msg);
		 	            location.href='/pay/payOk/'+imp_id;
		            } else {
		            	var msg = '결제에 실패하였습니다.';
		                msg += '\n실패 사유 : ' + rsp.error_msg;
		            	alert(msg);
		            //	document.referrer; 뒤로가기 추가해야 함
		            }
                })
            }
        });
    });
</script>
 
 
<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>