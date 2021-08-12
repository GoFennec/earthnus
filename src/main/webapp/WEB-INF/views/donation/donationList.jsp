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

<div class="container">

	<div class="row">
		<div class="col-12 col-md-6">
			<img src="/resources/donation/oceanMain.jpg" title="바다가 힘들어요!" alt="해양오염 사진" width=100% />
		</div>
		<div class="col-12 col-md-6">
			<h3>바다가 힘들어요!</h3><br>
			<p>바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.<br>
				그러나 지금 바다는 그 어느 때보다 큰 위험에 처해있습니다.<br>
				우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.</p><br>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='/donation/ocean'">후원 바로가기</button>
			</div>
		</div>
	</div><br><hr><br>

	<div class="row">
		<div class="col-12 col-md-6 order-2 order-md-1">
			<h3>나무를 심어요!</h3><br>
			<p>숲은 육지에 서식하는 많은 동물과 식물의 집입니다.<br>
				인간의 욕심으로 인해 전 세계 산림의 절반이 사라졌습니다.<br>
				숲을 터전으로 살아가고있는 생물들은 멸종위기에 처했으며,<br>
				온실가스가 흡수되지않고 대기로 방출됩니다.<br>
				더 심각한 재앙을 피하기 위해 우리는 숲을 지켜나가야 합니다.</p><br>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='/donation/forest'">후원 바로가기</button>
			</div>
		</div>
		<div class="col-12 col-md-6 order-1 order-md-2">
			<img src="/resources/donation/forestMain.jpg" title="나무를 심어요!" alt="사막화가 진행되고있는 토양 사진" width=100% />
		</div>
	</div><br><hr><br>
	
	<div class="row">
		<div class="col-12 col-md-6">
			<img src="/resources/donation/plasticMain.jpg" title="플라스틱이 넘쳐요!" alt="방대한 양의 플라스틱 사진" width=100%>
		</div>
		<div class="col-12 col-md-6">
			<h3>플라스틱이 넘쳐요!</h3><br>
			<p>플라스틱은 미세 플라스틱으로 불리는 작은 조각으로 분해됩니다.<br>
				수많은 해양 동물들이 미세 플라스틱 조각을 먹이로 착각하고 섭취하여 폐사에 이르고 있습니다.<br>
				결국 미세 플라스틱은 해양 먹이사슬을 타고 이동해 우리의 식탁으로 돌아옵니다.</p><br>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='/donation/plastic'">후원 바로가기</button>
			</div>
		</div>
	</div><br><hr><br>
	
	<div class="row">
		<div class="col-12 col-md-6 order-2 order-md-1">
			<h3>북극곰을 도와줘요!</h3><br>
			<p>빠르게 녹고있는 북극을 지켜요.<br>
				지구 온난화로 북극 기온이 상승하고있으며, 높은 기온으로 빙하가 녹고있습니다.<br>
				북극을 해양보호구역으로 만들어 파괴적인 어업과 석유 시추의 중단이 시급합니다.</p><br>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='/donation/ice'">후원 바로가기</button>
			</div>
		</div>
		<div class="col-12 col-md-6 order-1 order-md-2">
			<img src="/resources/donation/iceMain.jpg" title="북극곰을 도와줘요!" alt="삶의 터전을 잃어가는 북극곰 사진" width=100%>
		</div>
	</div>

</div>

<br><br>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
</body>
</html>