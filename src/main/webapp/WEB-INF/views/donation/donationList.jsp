<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>EARTH & US</title>

<style>
.d-grid {
  display: grid !important;
}
.img-fluid {
  max-width: 100%;
  height: auto;
}
.fit-cover {
  -o-object-fit: cover;
  object-fit: cover;
}
.rounded-top {
  border-top-left-radius: 0.5rem !important;
  border-top-right-radius: 0.5rem !important;
}
.rounded-md-top-0 {
  border-top-left-radius: 0 !important;
  border-top-right-radius: 0 !important;
}
.rounded-md-end {
  border-top-right-radius: 0.5rem !important;
  border-bottom-right-radius: 0.5rem !important;
}
.rounded-md-start {
  border-bottom-left-radius: 0.5rem !important;
  border-top-left-radius: 0.5rem !important;
}

</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" flush="true"/>
<br><br><br><br>

	<section class="py-0">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="card card-span mb-3 shadow-lg" style="border-radius: 0.5rem">
                <div class="card-body py-0 px-0">
                  <div class="row justify-content-center">
                    <div class="col-md-5 col-xl-7 col-xxl-8 gy-0 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="/resources/donation/ocean.jpg" title="바다가 힘들어요!" alt="해양오염 사진" /></div>
                    <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                      <h1 class="card-title mt-xl-5 mb-4 m-4">바다가 힘들어요!</h1>
                      	<p class="m-4">바다는 70만 종 이상 생명체가 살아가는 삶의 터전입니다.<br>
						                      그러나 지금 바다는 그 어느 때보다 큰 위험에 처해있습니다.<br>
						                      우리의 노력이 바다를 살리고 바다를 터전으로 살아가는 수많은 해양생물과 사람들을 지켜낼 수 있을거에요.</p><br>
                      <div class="d-grid bottom-0"><button type="button" class="btn btn-primary" onclick="location.href='/donation/ocean'">후원 바로가기&nbsp;&nbsp;>></button></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section><br><br>

	<section class="pb-5 pt-8">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="card card-span mb-3 shadow-lg" style="border-radius: 0.5rem">
                <div class="card-body py-0 px-0">
                  <div class="row justify-content-center">
                    <div class="col-md-5 col-xl-7 col-xxl-8 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="/resources/donation/forest.jpg" title="나무를 심어요!" alt="사막화가 진행되고있는 토양 사진" /></div>
                    <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                      <h1 class="card-title mt-xl-5 mb-4 m-4">나무를 심어요!</h1>
                      	<p class="m-4">숲은 육지에 서식하는 많은 동식물들의 집입니다.<br>
									인간의 욕심으로 인해 전 세계 산림의 절반이 사라졌습니다.<br>
									숲을 터전으로 살아가고있는 생물들은 멸종위기에 처했으며, 온실가스는 흡수되지않고 대기로 방출되고있습니다.</p><br>
                      <div class="d-grid bottom-0"><button type="button" class="btn btn-primary" onclick="location.href='/donation/forest'">후원 바로가기&nbsp;&nbsp;>></button></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section><br><br>
    
    <section class="py-0">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="card card-span mb-3 shadow-lg" style="border-radius: 0.5rem">
                <div class="card-body py-0 px-0">
                  <div class="row justify-content-center">
                    <div class="col-md-5 col-xl-7 col-xxl-8 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="/resources/donation/plastic.jpg" title="플라스틱이 넘쳐요!" alt="방대한 양의 플라스틱 사진"  /></div>
                    <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                      <h1 class="card-title mt-xl-5 mb-4 m-4">플라스틱이 넘쳐요!</h1>
                      	<p class="m-4">플라스틱은 미세 플라스틱으로 분해됩니다.<br>
									수많은 해양 동물들은 이를 먹이로 착각하고 섭취하여 폐사에 이르고 있으며, 결국 미세 플라스틱은 해양 먹이사슬을 타고 우리의 식탁으로 돌아옵니다.</p><br>
                      <div class="d-grid bottom-0"><button type="button" class="btn btn-primary" onclick="location.href='/donation/plastic'">후원 바로가기&nbsp;&nbsp;>></button></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section><br><br>

	<section class="pb-5 pt-8">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="card card-span mb-3 shadow-lg" style="border-radius: 0.5rem">
                <div class="card-body py-0 px-0">
                  <div class="row justify-content-center">
                    <div class="col-md-5 col-xl-7 col-xxl-8 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="/resources/donation/ice.jpg" title="북극곰을 도와줘요!" alt="삶의 터전을 잃어가는 북극곰 사진" /></div>
                    <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                      <h1 class="card-title mt-xl-5 mb-4 m-4">북극곰을 도와줘요!</h1>
                      	<p class="m-4">지구 온난화로 북극 기온이 상승하여 빙하가 녹고있습니다.<br>
									북극을 해양보호구역으로 만들어 파괴적인 어업과 석유 시추의 중단이 시급합니다.<br>
									빠르게 녹고있는 북극을 지켜요.</p><br>
                      <div class="d-grid bottom-0"><button type="button" class="btn btn-primary" onclick="location.href='/donation/ice'">후원 바로가기&nbsp;&nbsp;>></button></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/footer.jsp" flush="true"/>
<div id="back-top" >
	<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
</body>
</html>