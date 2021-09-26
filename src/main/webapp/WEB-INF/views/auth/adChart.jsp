<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>EARTH & US ADMIN</title>
  <link href="/resources/assets/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="/resources/assets/css/ruang-admin.min.css" rel="stylesheet">
  <link href="/resources/assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
  <style type="text/css">
  	label{
  		margin-top:1rem;
  	}
  	
  	th,td{
  		text-align:center;
  	}
  	.btn btn-sm btn-primary{
  		font-color:#6777EF;
  	}
  	h6,h5{
  		text-align:center;
  	}
  	input{
  		text-align:center;
  	}
  	#visitorArea,#visitorArea2{
  		width:200px;
  		text-align:center;
  	}
  	#cButton{
  		display: flex;
  		align-items: center;
  		justify-content: center;
  		padding-bottom:25px;
  	}
  	#select_div{
  		margin-left:10px;
  	}
  	h6{
  		margin-top:10px;
  	}
  </style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adLogout2" title="관리자 메인화면 바로가기">
        <div class="sidebar-brand-icon">
          <img src="/resources/assets/img/logo/logo2_footer.png" alt="회원 메인화면 바로가기">
        </div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item">
        <a class="nav-link" href="/adIndex">
        <i class="fas fa-desktop"></i>
          <span>관리자 메인</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adMember/list">
        <i class="fas fa-user"></i>
          <span>회원 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adCamBoard/list">
        <i class="fas fa-peace"></i>
          <span>캠페인 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adDonation/list">
        <i class="fas fa-hand-holding-heart"></i>
          <span>후원 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adCheBoard/list">
        <i class="fas fa-comments"></i>
          <span>응원릴레이 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/adGoods/list">
        <i class="fas fa-gift"></i>
          <span>지구마켓 상품 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseForm" aria-expanded="true"
          aria-controls="collapseForm">
          <i class="fas fa-shopping-cart"></i>
          <span>지구마켓 주문 관리</span>
        </a>
        <div id="collapseForm" class="collapse" aria-labelledby="headingForm" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/adExGoods/oList">주문 목록</a>
            <a class="collapse-item" href="/adExGoods/dList">배송 처리 목록</a>
            <a class="collapse-item" href="/adExGoods/aList">주문 승인 내역</a>
            <a class="collapse-item" href="/adExGoods/cList">주문취소내역</a>
          </div>
        </div>
      </li>
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="/adChart">
        <i class="fas fa-fw fa-chart-area"></i>
          <span>통계</span>
        </a>
      </li>
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
			<jsp:include page="/WEB-INF/views/adHeader.jsp"/>
        <!-- Topbar -->
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">통계</h1>
          </div>

          <!-- Row -->
          <div class="row">
          
          	<!-- Donut Chart -->
            <div class="col-lg-4">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">카테고리 별 후원</h6>
                </div>
                <div class="card-body">
                  <div class="chart-pie pt-4">
                    <canvas id="donationPieChart"></canvas>
                  </div>
                  <hr>
                </div>
              </div>
            </div>
            <!-- Donut Chart -->
            <div class="col-lg-4">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">카테고리 별 캠페인</h6>
                </div>
                <div class="card-body">
                  <div class="chart-pie pt-4">
                    <canvas id="camPieChart"></canvas>
                  </div>
                  <hr>
                </div>
              </div>
            </div>
            <!-- Donut Chart -->
            <div class="col-lg-4">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">카테고리 별 응원 릴레이</h6>
                </div>
                <div class="card-body">
                  <div class="chart-pie pt-4">
                    <canvas id="chePieChart"></canvas>
                  </div>
                  <hr>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12" id="cButton">
            		<button class="btn btn-sm btn-primary" id="dayButton">일주일 데이터 보기</button>&nbsp;&nbsp;
            		<div id="input_date">
            			<input type="text" id="select_lastDate" readonly> ~ <input type="date" id="select_startDate" onchange="change_date(this)">&nbsp;
            			<button onclick="getSevenData()">조회</button>&nbsp;&nbsp;
            		</div>
            		<button class="btn btn-sm btn-primary" id="monthButton">월별 데이터 보기</button>
            	<div id="select_div">
            		<select id="select_year" onchange="onchangeItem()">
            			<option value="2021">2021</option>
            			<option value="2020">2020</option>
            		</select>
            		<select id="select_month">
            		</select>
            		<button onclick="getMonthData()">조회</button>
            	</div>
            </div>
            
            <div class="col-lg-12" id="buttonInfo">
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold">조회 버튼을 누르세요.</h5>
                </div>
              </div>
            </div>
            
            <div id="sevenDay" class="col-lg-12">
            <!-- Area Chart -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold">방문자 수</h5>
                  <h6 class="font-weight-bold" id="getCountVisitorSeven"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pie Chart -->

            <!-- Bar Chart -->
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold">카테고리 별 최근 후원 금액</h5>
                  <h6 class="font-weight-bold" id="getCountDonationSeven"></h6>
                  <h6 class="font-weight-bold" id="getCountPlasticSeven"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold">가입자 수</h5>
                  <h6 class="font-weight-bold" id="getCountMemberSeven"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myMemberChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold">지구마켓 주문</h5>
                  <h6 class="font-weight-bold" id="getCountExgoodsSeven"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myExgoodsChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            </div>
            
            
            
            <div id="month" class="col-lg-12">
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold" id="visitorMonthly"></h5>
                  <h6 class="font-weight-bold" id="getCountVisitorMonth"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myVisitorMonthChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold" id="donationMonthly"></h5>
                  <h6 class="font-weight-bold" id="getCountDonationMonth"></h6>
                  <h6 class="font-weight-bold" id="getCountPlasticMonth"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myDonationMonthChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold" id="memberMonthly"></h5>
                  <h6 class="font-weight-bold" id="getCountMemberMonth"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myMemberMonthChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h5 class="m-0 font-weight-bold" id="exgoodsMonthly"></h5>
                  <h6 class="font-weight-bold" id="getCountExgoodsMonth"></h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myExgoodsMonthChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="/resources/assets/js/jquery.min.js"></script>
  <script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/js/jquery.easing.min.js"></script>
  <script src="/resources/assets/js/ruang-admin.min.js"></script>
  <!-- Page level plugins -->
  <script src="/resources/assets/js/jquery.dataTables.min.js"></script>
  <script src="/resources/assets/js/dataTables.bootstrap4.min.js"></script>
      <script src="/resources/assets/js/Chart.min.js"></script>

  <script type="text/javascript">

  //Pie Chart Example
  var donationPieForest = ${donationPieForest};
  var donationPieIce = ${donationPieIce};
  var donationPiePlastic = ${donationPiePlastic};
  var donationPieOcean = ${donationPieOcean};
  
  var ctx = document.getElementById("donationPieChart");
  var donationPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["숲", "얼음", "플라스틱", "바다"],
      datasets: [{
        data: [donationPieForest, donationPieIce, donationPiePlastic, donationPieOcean],
        backgroundColor: ['#4e73df', '#ffa426', '#1cc88a', '#fc544b'],
        hoverBackgroundColor: ['#2e59d9', '#FF8200', '#17a673', '#B9062F'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#282828",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: true
      },
      cutoutPercentage: 80,
    },
  });
  
  
  var camPiePlastic = ${camPiePlastic};
  var camPieOcean = ${camPieOcean};
  var camPieIce = ${camPieIce};
  var camPieForest = ${camPieForest};
  
  var ctx = document.getElementById("camPieChart");
  var camPieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["숲", "얼음", "플라스틱", "바다"],
      datasets: [{
        data: [camPieForest, camPieIce, camPiePlastic, camPieOcean],
        backgroundColor: ['#4e73df', '#ffa426', '#1cc88a', '#fc544b'],
        hoverBackgroundColor: ['#2e59d9', '#FF8200', '#17a673', '#B9062F'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#282828",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: true
      },
      cutoutPercentage: 80,
    },
  });
  
  
  var chePiePlastic = ${chePiePlastic};
  var chePieOcean = ${chePieOcean};
  var chePieIce = ${chePieIce};
  var chePieForest = ${chePieForest};
  
  var ctx = document.getElementById("chePieChart");
  var chePieChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["숲", "얼음", "플라스틱", "바다"],
      datasets: [{
        data: [chePieForest, chePieIce, chePiePlastic, chePieOcean],
        backgroundColor: ['#4e73df', '#ffa426', '#1cc88a', '#fc544b'],
        hoverBackgroundColor: ['#2e59d9', '#FF8200', '#17a673', '#B9062F'],
        hoverBorderColor: "rgba(234, 236, 244, 1)",
      }],
    },
    options: {
      maintainAspectRatio: false,
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#282828",
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        caretPadding: 10,
      },
      legend: {
        display: true
      },
      cutoutPercentage: 80,
    },
  });
  </script>
  
  
  
<script type="text/javascript">
  function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
	}

  
  var select_startDate;
  var date_arr;
  var day = new Array;
  var dateString = [];
  
  $("#sevenDay").hide();
  
  //7일 그래프
  function change_date(e){
	  select_startDate = $("#select_startDate").val();
	  date_arr = select_startDate.split('-');
	  for(var i = 0; i < 7; i++){
		  var today = new Date(date_arr[0], (parseInt(date_arr[1])-1), date_arr[2]);
		  today.setDate(today.getDate()-i);
		  var year = today.getFullYear();
		  var month = ('0' + (today.getMonth()+1)).slice(-2);
		  var date = ('0' + (today.getDate())).slice(-2);
		  dateString[i] = year + '-' + month  + '-' + date;
	  }
	  $("#select_lastDate").val(dateString[6]);
	  dateString = dateString.reverse();
  }
  
  for(var i = 0; i < 7; i++){
	  var today = document.getElementById('select_startDate').valueAsDate = new Date();
	  today.setDate(today.getDate()-i);
	  var year = today.getFullYear();
	  var month = ('0' + (today.getMonth() + 1)).slice(-2);
	  var date = ('0' + (today.getDate())).slice(-2);
	  dateString[i] = year + '-' + month  + '-' + date;
  }
  $("#select_lastDate").val(dateString[6]);
  dateString = dateString.reverse();
  
  var myAreaChart;
  var myBarChart;
  var myMemberChart;
  var myExgoodsChart;
  
	
  function getSevenData(){
	  $("#sevenDay").show();
	  $("#buttonInfo").hide();
	  $("#month").hide();
	  
	  var startDate = $("#select_startDate").val();
	  var day_arr = startDate.split('-');
	  var select_year = day_arr[0];
	  var select_month = day_arr[1];
	  var select_date = day_arr[2];
	  
		$.ajax({
   			type: "POST", //요청 메소드 방식
  			 url:"/adchart/getSevenData",
   			data: {"select_year":select_year,"select_month":select_month,"select_date":select_date},
   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
   			
   			success : function(result){
   				
   			 $("#getCountVisitorSeven").text("총 : " + result.error.getCountVisitorSeven + "명");
       	  	 $("#getCountMemberSeven").text("가입 회원 : " + result.error.getCountMemberSeven + "명 / 탈퇴 회원 : " + result.error.getCountDelMemberSeven + "명");
       	  	 $("#getCountExgoodsSeven").text("총 : " + result.error.getCountExgoodsSeven + "건");
       	  	 $("#getCountDonationSeven").text("총 : ￦" + number_format(result.error.getCountPlasticSeven+result.error.getCountOceanSeven+result.error.getCountIceSeven+result.error.getCountForestSeven));
       	  	 $("#getCountPlasticSeven").text("플라스틱 : ￦" + number_format(result.error.getCountPlasticSeven) + " / 바다 : ￦" + number_format(result.error.getCountOceanSeven) + " / 얼음 : ￦" + number_format(result.error.getCountIceSeven) + " / 숲 : ￦" + number_format(result.error.getCountForestSeven));
   				
      			if(result.error.getVisitorSeven != null){
      				//7일 방문자
      				getVisitorSeven = result.error.getVisitorSeven;
      				getVisitorSeven = getVisitorSeven.reverse();
      				
      			  var ctx = document.getElementById("myAreaChart");
      			if(window.myCharts != undefined)
  	      			window.myCharts.destroy();
  	      			window.myCharts = new Chart(ctx, {
      			    type: 'line',
      			    data: {
      			    	 
      			      labels: dateString,
      			    	 
      			      datasets: [{
      			        label: "",
      			        lineTension: 0.3,
      			        backgroundColor: "#AAEBAA",
      			        borderColor: "#388E3C",
      			        pointRadius: 3,
      			        pointBackgroundColor: "#66bb6a",
      			        pointBorderColor: "#388E3C",
      			        pointHoverRadius: 3,
      			        pointHoverBackgroundColor: "#388E3C",
      			        pointHoverBorderColor: "#388E3C",
      			        pointHitRadius: 10,
      			        pointBorderWidth: 2,
      			        data: getVisitorSeven,
      			      }],
      			    },
      			    options: {
      			      maintainAspectRatio: false,
      			      layout: {
      			        padding: {
      			          left: 10,
      			          right: 25,
      			          top: 25,
      			          bottom: 0
      			        }
      			      },
      			      scales: {
      			        xAxes: [{
      			          time: {
      			            unit: 'date'
      			          },
      			          gridLines: {
      			            display: false,
      			            drawBorder: false
      			          },
      			          ticks: {
      			            maxTicksLimit: 7
      			          }
      			        }],
      			        yAxes: [{
      			          ticks: {
      			            maxTicksLimit: 5,
      			            padding: 10,
      			            // Include a dollar sign in the ticks
      			            callback: function(value, index, values) {
      			              return number_format(value) + "명";
      			            }
      			          },
      			          gridLines: {
      			            color: "rgb(234, 236, 244)",
      			            zeroLineColor: "rgb(234, 236, 244)",
      			            drawBorder: false,
      			            borderDash: [2],
      			            zeroLineBorderDash: [2]
      			          }
      			        }],
      			      },
      			      legend: {
      			        display: false
      			      },
      			      tooltips: {
      			        backgroundColor: "rgb(255,255,255)",
      			        bodyFontColor: "#858796",
      			        titleMarginBottom: 10,
      			        titleFontColor: '#6e707e',
      			        titleFontSize: 14,
      			        borderColor: '#dddfeb',
      			        borderWidth: 1,
      			        xPadding: 15,
      			        yPadding: 15,
      			        displayColors: false,
      			        intersect: false,
      			        mode: 'index',
      			        caretPadding: 10,
      			        callbacks: {
      			          label: function(tooltipItem, chart) {
      			            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
      			            return datasetLabel + number_format(tooltipItem.yLabel) + "명";
      			          }
      			        }
      			      }
      			    }
      			  });
      			}
      			if(result.error.sumPlastic != null){
      				
      			  var sumPlastic = result.error.sumPlastic;
      			  var sumOcean = result.error.sumOcean;
      			  var sumIce = result.error.sumIce;
      			  var sumForest = result.error.sumForest;


      				sumPlastic = sumPlastic.reverse();
      				sumOcean = sumOcean.reverse();
      				sumIce = sumIce.reverse();
      				sumForest = sumForest.reverse();
      				
      				
      				//7일 후원금액
      				var ctx = document.getElementById("myBarChart");
      				if(window.myCharts1 != undefined)
      	      			window.myCharts1.destroy();
      	      			window.myCharts1 = new Chart(ctx, {
      				  type: 'bar',
      				  data: {
      				    labels: dateString,
      				    datasets: [
      				    	{	  
      				    		  type: 'bar',
      				    		  label: "숲",
      				    		  lineTension: 0,
      				    		  backgroundColor: "#4e73df",
      				    		  hoverBackgroundColor: "#2e59d9",
      				    		  borderColor: "#4e73df",
      				    		  fill: false,
      				    		  data: sumForest,
      				    		},
      				    	{
      				    		  type: 'bar',
      				    	      label: "얼음",
      				    	      lineTension: 0,
      				    	      backgroundColor: "#ffa426",
      				    	      hoverBackgroundColor: "#FF8200",
      				    	      borderColor: "#ffa426",
      				    	      fill: false,
      				    	      data: sumIce,
      				    	    },
      				    	{
      				    	      type: 'bar',
      				    	      label: "플라스틱",
      				    	      lineTension: 0,
      				    	      backgroundColor: "#1cc88a",
      				    	      hoverBackgroundColor: "#17a673",
      				    	      borderColor: "#1cc88a",
      				    	      fill: false,
      				    	      data: sumPlastic,
      				    	    },
      				        {
      				    	      type: 'bar',
      				      	      label: "바다",
      				      	      lineTension: 0,
      				      	      backgroundColor: "#fc544b",
      				      	      hoverBackgroundColor: "#B9062F",
      				      	      borderColor: "#fc544b",
      				      	      fill: false,
      				      	      data: sumOcean,
      				      	    }, 
      				    ],
      				  },
      				  options: {
      				    maintainAspectRatio: false,
      				    layout: {
      				      padding: {
      				        left: 10,
      				        right: 25,
      				        top: 25,
      				        bottom: 0
      				      }
      				    },
      				    scales: {
      				      xAxes: [{
      				        time: {
      				          unit: 'date'
      				        },
      				        gridLines: {
      				          display: false,
      				          drawBorder: false
      				        },
      				        ticks: {
      				          maxTicksLimit: 6
      				        },
      				        maxBarThickness: 25,
      				      }],
      				      yAxes: [{
      				          ticks: {
      				            maxTicksLimit: 5,
      				            padding: 10,
      				            // Include a dollar sign in the ticks
      				            callback: function(value, index, values) {
      				              return  '￦' + number_format(value);
      				            }
      				          },
      				          gridLines: {
      				            color: "rgb(234, 236, 244)",
      				            zeroLineColor: "rgb(234, 236, 244)",
      				            drawBorder: false,
      				            borderDash: [2],
      				            zeroLineBorderDash: [2]
      				          }
      				        }],
      				    },
      				    legend: {
      				      display: true
      				    },
      				    tooltips: {
      				      titleMarginBottom: 10,
      				      titleFontColor: '#6e707e',
      				      titleFontSize: 14,
      				      backgroundColor: "rgb(255,255,255)",
      				      bodyFontColor: "#858796",
      				      borderColor: '#dddfeb',
      				      borderWidth: 1,
      				      xPadding: 15,
      				      yPadding: 15,
      				      displayColors: false,
      				      caretPadding: 10,
      				      callbacks: {
      				        label: function(tooltipItem, chart) {
      				          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
      				          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
      				        }
      				      }
      				    },
      				  }
      				});
      			}
      			if(result.error.getCountMember != null){
      				
      			  var countMember = result.error.getCountMember;
      			  countMember = countMember.reverse();
      			  
      			var countDelMember = result.error.getCountDelMember;
      			countDelMember = countDelMember.reverse();
      				
      				//7일 가입한 회원
      				var ctx = document.getElementById("myMemberChart");
      				if(window.myCharts2 != undefined)
      	      			window.myCharts2.destroy();
      	      			window.myCharts2 = new Chart(ctx, {
      				  type: 'bar',
      				  data: {
      				    labels: dateString,
      				    datasets: [
      				    	{
      				    	      type: 'bar',
      				    	      label: "가입한 회원",
      				    	      lineTension: 0,
      				    	      backgroundColor: "#1cc88a",
      				    	      hoverBackgroundColor: "#17a673",
      				    	      borderColor: "#1cc88a",
      				    	      fill: false,
      				    	      data: countMember,
      				    	    },
      				        {
      				    	      type: 'bar',
      				      	      label: "탈퇴한 회원",
      				      	      lineTension: 0,
      				      	      backgroundColor: "#fc544b",
      				      	      hoverBackgroundColor: "#B9062F",
      				      	      borderColor: "#fc544b",
      				      	      fill: false,
      				      	      data: countDelMember,
      				      	    }, 
      				    ],
      				  },
      				  options: {
      				    maintainAspectRatio: false,
      				    layout: {
      				      padding: {
      				        left: 10,
      				        right: 25,
      				        top: 25,
      				        bottom: 0
      				      }
      				    },
      				    scales: {
      				      xAxes: [{
      				        time: {
      				          unit: 'date'
      				        },
      				        gridLines: {
      				          display: false,
      				          drawBorder: false
      				        },
      				        ticks: {
      				          maxTicksLimit: 6
      				        },
      				        maxBarThickness: 25,
      				      }],
      				      yAxes: [{
      				          ticks: {
      				            maxTicksLimit: 5,
      				            padding: 10,
      				            // Include a dollar sign in the ticks
      				            callback: function(value, index, values) {
      				              return  number_format(value) + "명";
      				            }
      				          },
      				          gridLines: {
      				            color: "rgb(234, 236, 244)",
      				            zeroLineColor: "rgb(234, 236, 244)",
      				            drawBorder: false,
      				            borderDash: [2],
      				            zeroLineBorderDash: [2]
      				          }
      				        }],
      				    },
      				    legend: {
      				      display: true
      				    },
      				    tooltips: {
      				      titleMarginBottom: 10,
      				      titleFontColor: '#6e707e',
      				      titleFontSize: 14,
      				      backgroundColor: "rgb(255,255,255)",
      				      bodyFontColor: "#858796",
      				      borderColor: '#dddfeb',
      				      borderWidth: 1,
      				      xPadding: 15,
      				      yPadding: 15,
      				      displayColors: false,
      				      caretPadding: 10,
      				      callbacks: {
      				        label: function(tooltipItem, chart) {
      				          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
      				          return datasetLabel + " " + number_format(tooltipItem.yLabel) + "명";
      				        }
      				      }
      				    },
      				  }
      				});
      			}
      			if(result.error.getCountExgoods != null){
      				
      			  var countExgoods = result.error.getCountExgoods;
      			  countExgoods = countExgoods.reverse();
      				
      				//7일 지구마켓
      				var ctx = document.getElementById("myExgoodsChart");
      				if(window.myCharts3 != undefined)
      	      			window.myCharts3.destroy();
      	      			window.myCharts3 = new Chart(ctx, {
      			    type: 'line',
      			    data: {
      			    	 
      			      labels: dateString,
      			    	 
      			      datasets: [{
      			        label: "",
      			        lineTension: 0.3,
      			        backgroundColor: "#AAEBAA",
      			        borderColor: "#388E3C",
      			        pointRadius: 3,
      			        pointBackgroundColor: "#66bb6a",
      			        pointBorderColor: "#388E3C",
      			        pointHoverRadius: 3,
      			        pointHoverBackgroundColor: "#388E3C",
      			        pointHoverBorderColor: "#388E3C",
      			        pointHitRadius: 10,
      			        pointBorderWidth: 2,
      			        data: countExgoods,
      			      }],
      			    },
      			    options: {
      			      maintainAspectRatio: false,
      			      layout: {
      			        padding: {
      			          left: 10,
      			          right: 25,
      			          top: 25,
      			          bottom: 0
      			        }
      			      },
      			      scales: {
      			        xAxes: [{
      			          time: {
      			            unit: 'date'
      			          },
      			          gridLines: {
      			            display: false,
      			            drawBorder: false
      			          },
      			          ticks: {
      			            maxTicksLimit: 7
      			          }
      			        }],
      			        yAxes: [{
      			          ticks: {
      			            maxTicksLimit: 5,
      			            padding: 10,
      			            // Include a dollar sign in the ticks
      			            callback: function(value, index, values) {
      			              return number_format(value) + "건";
      			            }
      			          },
      			          gridLines: {
      			            color: "rgb(234, 236, 244)",
      			            zeroLineColor: "rgb(234, 236, 244)",
      			            drawBorder: false,
      			            borderDash: [2],
      			            zeroLineBorderDash: [2]
      			          }
      			        }],
      			      },
      			      legend: {
      			        display: false
      			      },
      			      tooltips: {
      			        backgroundColor: "rgb(255,255,255)",
      			        bodyFontColor: "#858796",
      			        titleMarginBottom: 10,
      			        titleFontColor: '#6e707e',
      			        titleFontSize: 14,
      			        borderColor: '#dddfeb',
      			        borderWidth: 1,
      			        xPadding: 15,
      			        yPadding: 15,
      			        displayColors: false,
      			        intersect: false,
      			        mode: 'index',
      			        caretPadding: 10,
      			        callbacks: {
      			          label: function(tooltipItem, chart) {
      			            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
      			            return datasetLabel + number_format(tooltipItem.yLabel) + "건";
      			          }
      			        }
      			      }
      			    }
      			  });
      			}
   			},
   		 error:function(request,status,error){
   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
      			//통신 실패시 발생하는 함수(콜백)
   				}
			});
  }
  
	  //월별 그래프
  	  $("#month").hide();
  	  $("#select_div").hide();
  	  
  	  $('#dayButton').click(function(){
  		  $("#input_date").show();
  		  $("#select_div").hide();
  	  });
  	  $('#monthButton').click(function(){
  		  $("#input_date").hide();
  		  $("#select_div").show();
  	  });
  	  
  	  var d = new Date();
  	  var yy = d.getFullYear();
  	  var mm = ('0' + (d.getMonth() + 1)).slice(-2);
  	  var select_year;
  	  var select_month;
  	  
  	  	for(var i = d.getMonth() + 1; i > 0; i--){
  		  	$("#select_month").append("<option value=" + i + ">" + i + "월</option>");
  	  	}
  	  	
  	  	$("select[id=select_year]").change(function(){
  	  	  select_year = $("select[id='select_year']").val();
  		  if(yy == select_year){
  			  $('#select_month').children('option').remove();
  			  for(var i = d.getMonth() + 1; i > 0; i--){
  				$("#select_month").append("<option value=" + i + ">" + i + "월</option>");
  			  }
  		  }else{
  			  $('#select_month').children('option').remove();
  			  for(var i = 12; i > 0; i--){
  				$("#select_month").append("<option value=" + i + ">" + i + "월</option>");
  			  }
  		  }
  	  	});
  	  	
  	  	$("select[id=select_month]").change(function(){
  	  	  select_month = $("select[id='select_month']").val();
  	    });
  	  	var myVisitorMonthChart;
  	    var myDonationMonthChart;
  	    var myMemberMonthChart;
  	    var myExgoodsMonthChart;
  	  
  	  	function getMonthData(){
  	  		$("#buttonInfo").hide();
  	  		select_year = $("select[id='select_year']").val();
  	  		select_month = ('0' + ($("select[id='select_month']").val())).slice(-2);
  	  		$("#month").show();
			$("#sevenDay").hide();
  			$.ajax({
  	   			type: "POST", //요청 메소드 방식
  	  			 url:"/adchart/getMonthData",
  	   			data: {"select_year":select_year, "select_month":select_month},
  	   			dataType: 'json', //서버가 요청 URL을 통해서 응답하는 내용의 타입
  	   			success : function(result){
  	   				
  	   			  $("#getCountVisitorMonth").text("총 : " + result.error.getCountVisitorMonth + "명");
	        	  $("#getCountMemberMonth").text("가입 회원 : " + result.error.getCountMemberMonth + "명 / 탈퇴 회원 : " + result.error.getCountDelMemberMonth + "명");
	        	  $("#getCountExgoodsMonth").text("총 : " + result.error.getCountExgoodsMonth + "건");
	        	  $("#getCountDonationMonth").text("총 : ￦" + number_format(result.error.getCountDonationMonth));
	        	  $("#getCountPlasticMonth").text("플라스틱 : ￦" + number_format(result.error.getCountPlasticMonth) + " / 바다 : ￦" + number_format(result.error.getCountOceanMonth) + " / 얼음 : ￦" + number_format(result.error.getCountIceMonth) + " / 숲 : ￦" + number_format(result.error.getCountForestMonth));
  	   				
  	      			if(result.error.getMonthData != null){
  	      				countVisitorMonth = result.error.getMonthData;
  	      				countVisitorMonth = countVisitorMonth.reverse();
  	      				
  	      	    	  var monthString = [];
  	            	  var thisMonth = new Date();
  	            	  thisMonth.setYear($("select[id='select_year']").val());
  	            	  thisMonth.setMonth($("select[id='select_month']").val());
  	            	  thisMonth.setDate(0);
  	            	  var year = thisMonth.getFullYear();
  	          	  	  var month = ('0' + (thisMonth.getMonth())).slice(-2);
  	          	  	  var date = ('0' + (thisMonth.getDate())).slice(-2);
  	          	  	  var getDate = thisMonth.getDate();
  	          	  	  $("#visitorMonthly").text((thisMonth.getMonth() + 1) + "월 방문자 수");
  	            	  
  	            	  for(var i = 0; i < getDate; i++){
  	            		var mmonth = new Date(year, month, date);
  	            		mmonth.setDate(mmonth.getDate()-i);
  	            		var myear = mmonth.getFullYear();
  	            	    var mmmonth = ('0' + (mmonth.getMonth() + 1)).slice(-2);
  	            	    var mdate = ('0' + (mmonth.getDate())).slice(-2);
  	            	    monthString[i] = myear + '-' + mmmonth  + '-' + mdate;
  	            	  }
  	        	   	  monthString = monthString.reverse();
  	        	   	  
  	        	   	  
  	        	   	
  	      		  var ctx = document.getElementById("myVisitorMonthChart");
  	      			if(window.myCharts != undefined)
  	      			window.myCharts.destroy();
  	      			window.myCharts = new Chart(ctx, {
  	      		    type: 'line',
  	      		    data: {
  	      		    	 
  	      		      labels: monthString,
  	      		    	 
  	      		      datasets: [{
  	      		        label: "",
  	      		        lineTension: 0.3,
  	      		        backgroundColor: "#AAEBAA",
  	      		        borderColor: "#388E3C",
  	      		        pointRadius: 3,
  	      		        pointBackgroundColor: "#66bb6a",
  	      		        pointBorderColor: "#388E3C",
  	      		        pointHoverRadius: 3,
  	      		        pointHoverBackgroundColor: "#388E3C",
  	      		        pointHoverBorderColor: "#388E3C",
  	      		        pointHitRadius: 10,
  	      		        pointBorderWidth: 2,
  	      		        data: countVisitorMonth,
  	      		      }],
  	      		    },
  	      		    options: {
  	      		      maintainAspectRatio: false,
  	      		      layout: {
  	      		        padding: {
  	      		          left: 10,
  	      		          right: 25,
  	      		          top: 25,
  	      		          bottom: 0
  	      		        }
  	      		      },
  	      		      scales: {
  	      		        xAxes: [{
  	      		          time: {
  	      		            unit: 'date'
  	      		          },
  	      		          gridLines: {
  	      		            display: false,
  	      		            drawBorder: false
  	      		          },
  	      		          ticks: {
  	      		            maxTicksLimit: 7
  	      		          }
  	      		        }],
  	      		        yAxes: [{
  	      		          ticks: {
  	      		            maxTicksLimit: 5,
  	      		            padding: 10,
  	      		            // Include a dollar sign in the ticks
  	      		            callback: function(value, index, values) {
  	      		              return number_format(value) + "명";
  	      		            }
  	      		          },
  	      		          gridLines: {
  	      		            color: "rgb(234, 236, 244)",
  	      		            zeroLineColor: "rgb(234, 236, 244)",
  	      		            drawBorder: false,
  	      		            borderDash: [2],
  	      		            zeroLineBorderDash: [2]
  	      		          }
  	      		        }],
  	      		      },
  	      		      legend: {
  	      		        display: false
  	      		      },
  	      		      tooltips: {
  	      		        backgroundColor: "rgb(255,255,255)",
  	      		        bodyFontColor: "#858796",
  	      		        titleMarginBottom: 10,
  	      		        titleFontColor: '#6e707e',
  	      		        titleFontSize: 14,
  	      		        borderColor: '#dddfeb',
  	      		        borderWidth: 1,
  	      		        xPadding: 15,
  	      		        yPadding: 15,
  	      		        displayColors: false,
  	      		        intersect: false,
  	      		        mode: 'index',
  	      		        caretPadding: 10,
  	      		        callbacks: {
  	      		          label: function(tooltipItem, chart) {
  	      		            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
  	      		            return datasetLabel + number_format(tooltipItem.yLabel) + "명";
  	      		          }
  	      		        }
  	      		      }
  	      		    }
  	      		  });
  	      			
  	      			}
  	      			if(result.error.getPlasticMonth != null){
  	      			//월별 후원
  	      			var getPlasticMonth = result.error.getPlasticMonth;
  	      			var getOceanMonth = result.error.getOceanMonth;
  	      			var getIceMonth = result.error.getIceMonth;
  	      			var getForestMonth = result.error.getForestMonth;
  	      		    getPlasticMonth = getPlasticMonth.reverse();
  	      			getOceanMonth = getOceanMonth.reverse();
  	      			getIceMonth = getIceMonth.reverse();
  	      			getForestMonth = getForestMonth.reverse();
  	      		    
  	      			$("#donationMonthly").text((thisMonth.getMonth() + 1) + "월 후원 금액");
  	      			
  	      			var ctx = document.getElementById("myDonationMonthChart");
  	      			if(window.myCharts1 != undefined)
  	      			window.myCharts1.destroy();
  	      			window.myCharts1 = new Chart(ctx, {
  	      		  	type: 'bar',
  	      		  	data: {
  	      		    	labels: monthString,
  	      		    	datasets: [
  	      		    		{	  
  	      		    		  type: 'bar',
  	      		    		  label: "숲",
  	      		    		  lineTension: 0,
  	      		    		  backgroundColor: "#4e73df",
  	      		    		  hoverBackgroundColor: "#2e59d9",
  	      		    		  borderColor: "#4e73df",
  	      		    		  fill: false,
  	      		    		  data: getForestMonth,
  	      		    		},
  	      		    	{
  	      		    		  type: 'bar',
  	      		    	      label: "얼음",
  	      		    	      lineTension: 0,
  	      		    	      backgroundColor: "#ffa426",
  	      		    	      hoverBackgroundColor: "#FF8200",
  	      		    	      borderColor: "#ffa426",
  	      		    	      fill: false,
  	      		    	      data: getIceMonth,
  	      		    	    },
  	      		    	{
  	      		    	      type: 'bar',
  	      		    	      label: "플라스틱",
  	      		    	      lineTension: 0,
  	      		    	      backgroundColor: "#1cc88a",
  	      		    	      hoverBackgroundColor: "#17a673",
  	      		    	      borderColor: "#1cc88a",
  	      		    	      fill: false,
  	      		    	      data: getPlasticMonth,
  	      		    	    },
  	      		        {
  	      		    	      type: 'bar',
  	      		      	      label: "바다",
  	      		      	      lineTension: 0,
  	      		      	      backgroundColor: "#fc544b",
  	      		      	      hoverBackgroundColor: "#B9062F",
  	      		      	      borderColor: "#fc544b",
  	      		      	      fill: false,
  	      		      	      data: getOceanMonth,
  	      		      	    }, 
  	      		    ],
  	      		  },
  	      		  options: {
  	      		    maintainAspectRatio: false,
  	      		    layout: {
  	      		      padding: {
  	      		        left: 10,
  	      		        right: 25,
  	      		        top: 25,
  	      		        bottom: 0
  	      		      }
  	      		    },
  	      		    scales: {
  	      		      xAxes: [{
  	      		        time: {
  	      		          unit: 'date'
  	      		        },
  	      		        gridLines: {
  	      		          display: false,
  	      		          drawBorder: false
  	      		        },
  	      		        ticks: {
  	      		          maxTicksLimit: 6
  	      		        },
  	      		        maxBarThickness: 25,
  	      		      }],
  	      		      yAxes: [{
  	      		          ticks: {
  	      		            maxTicksLimit: 5,
  	      		            padding: 10,
  	      		            // Include a dollar sign in the ticks
  	      		            callback: function(value, index, values) {
  	      		              return  '￦' + number_format(value);
  	      		            }
  	      		          },
  	      		          gridLines: {
  	      		            color: "rgb(234, 236, 244)",
  	      		            zeroLineColor: "rgb(234, 236, 244)",
  	      		            drawBorder: false,
  	      		            borderDash: [2],
  	      		            zeroLineBorderDash: [2]
  	      		          }
  	      		        }],
  	      		    },
  	      		    legend: {
  	      		      display: true
  	      		    },
  	      		    tooltips: {
  	      		      titleMarginBottom: 10,
  	      		      titleFontColor: '#6e707e',
  	      		      titleFontSize: 14,
  	      		      backgroundColor: "rgb(255,255,255)",
  	      		      bodyFontColor: "#858796",
  	      		      borderColor: '#dddfeb',
  	      		      borderWidth: 1,
  	      		      xPadding: 15,
  	      		      yPadding: 15,
  	      		      displayColors: false,
  	      		      caretPadding: 10,
  	      		      callbacks: {
  	      		        label: function(tooltipItem, chart) {
  	      		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
  	      		          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
  	      		        }
  	      		      }
  	      		    },
  	      		  }
  	      		});
  	      			}
  	      			if(result.error.getMemberMonth != null){
  	      				var getMemberMonth = result.error.getMemberMonth;
  	      				var getDelMemberMonth = result.error.getDelMemberMonth;
  	      				getMemberMonth = getMemberMonth.reverse();
  	      				getDelMemberMonth = getDelMemberMonth.reverse();
  	
  	      			$("#memberMonthly").text((thisMonth.getMonth() + 1) + "월 가입자 수");
  	      				//월별 가입자
  	      		  var ctx = document.getElementById("myMemberMonthChart");
  	      			if(window.myCharts2 != undefined)
  	      			window.myCharts2.destroy();
  	      			window.myCharts2 = new Chart(ctx, {
  	  	      		  	type: 'bar',
  	  	      		  	data: {
  	  	      		    	labels: monthString,
  	  	      		    	datasets: [
  	  	      		    		{	  
  	  	      		    		  type: 'bar',
  	  	      		    		  label: "가입한 회원",
  	  	      		    		  lineTension: 0,
  	  	      		       		  backgroundColor: "#1cc88a",
	      		    	      	  hoverBackgroundColor: "#17a673",
	      		    	      	  borderColor: "#1cc88a",
  	  	      		    		  fill: false,
  	  	      		    		  data: getMemberMonth,
  	  	      		    		},
  	  	      		        {
  	  	      		    	      type: 'bar',
  	  	      		      	      label: "탈퇴한 회원",
  	  	      		      	      lineTension: 0,
  	  	      		      	      backgroundColor: "#fc544b",
  	  	      		      	      hoverBackgroundColor: "#B9062F",
  	  	      		      	      borderColor: "#fc544b",
  	  	      		      	      fill: false,
  	  	      		      	      data: getDelMemberMonth,
  	  	      		      	    }, 
  	  	      		    ],
  	  	      		  },
  	  	      		  options: {
  	  	      		    maintainAspectRatio: false,
  	  	      		    layout: {
  	  	      		      padding: {
  	  	      		        left: 10,
  	  	      		        right: 25,
  	  	      		        top: 25,
  	  	      		        bottom: 0
  	  	      		      }
  	  	      		    },
  	  	      		    scales: {
  	  	      		      xAxes: [{
  	  	      		        time: {
  	  	      		          unit: 'date'
  	  	      		        },
  	  	      		        gridLines: {
  	  	      		          display: false,
  	  	      		          drawBorder: false
  	  	      		        },
  	  	      		        ticks: {
  	  	      		          maxTicksLimit: 6
  	  	      		        },
  	  	      		        maxBarThickness: 25,
  	  	      		      }],
  	  	      		      yAxes: [{
  	  	      		          ticks: {
  	  	      		            maxTicksLimit: 5,
  	  	      		            padding: 10,
  	  	      		            // Include a dollar sign in the ticks
  	  	      		            callback: function(value, index, values) {
  	  	      		              return  number_format(value) + "명";
  	  	      		            }
  	  	      		          },
  	  	      		          gridLines: {
  	  	      		            color: "rgb(234, 236, 244)",
  	  	      		            zeroLineColor: "rgb(234, 236, 244)",
  	  	      		            drawBorder: false,
  	  	      		            borderDash: [2],
  	  	      		            zeroLineBorderDash: [2]
  	  	      		          }
  	  	      		        }],
  	  	      		    },
  	  	      		    legend: {
  	  	      		      display: true
  	  	      		    },
  	  	      		    tooltips: {
  	  	      		      titleMarginBottom: 10,
  	  	      		      titleFontColor: '#6e707e',
  	  	      		      titleFontSize: 14,
  	  	      		      backgroundColor: "rgb(255,255,255)",
  	  	      		      bodyFontColor: "#858796",
  	  	      		      borderColor: '#dddfeb',
  	  	      		      borderWidth: 1,
  	  	      		      xPadding: 15,
  	  	      		      yPadding: 15,
  	  	      		      displayColors: false,
  	  	      		      caretPadding: 10,
  	  	      		      callbacks: {
  	  	      		        label: function(tooltipItem, chart) {
  	  	      		          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
  	  	      		          return datasetLabel + " " + number_format(tooltipItem.yLabel) + " 명";
  	  	      		        }
  	  	      		      }
  	  	      		    },
  	  	      		  }
  	  	      		});
  	      			}
  	      			if(result.error.getExgoodsMonth != null){
  	      			//이번달 굿즈
  	      				getExgoodsMonth = result.error.getExgoodsMonth;
  	      				getExgoodsMonth = getExgoodsMonth.reverse();
  	      			$("#exgoodsMonthly").text((thisMonth.getMonth() + 1) + "월 지구마켓 주문");
  	      				
  	      		  var ctx = document.getElementById("myExgoodsMonthChart");
  	      			if(window.myCharts3 != undefined)
  	      			window.myCharts3.destroy();
  	      			window.myCharts3 = new Chart(ctx, {
  	      		    type: 'line',
  	      		    data: {
  	      		    	 
  	      		      labels: monthString,
  	      		    	 
  	      		      datasets: [{
  	      		        label: "",
  	      		        lineTension: 0.3,
  	      		        backgroundColor: "#AAEBAA",
  	      		        borderColor: "#388E3C",
  	      		        pointRadius: 3,
  	      		        pointBackgroundColor: "#66bb6a",
  	      		        pointBorderColor: "#388E3C",
  	      		        pointHoverRadius: 3,
  	      		        pointHoverBackgroundColor: "#388E3C",
  	      		        pointHoverBorderColor: "#388E3C",
  	      		        pointHitRadius: 10,
  	      		        pointBorderWidth: 2,
  	      		        data: getExgoodsMonth,
  	      		      }],
  	      		    },
  	      		    options: {
  	      		      maintainAspectRatio: false,
  	      		      layout: {
  	      		        padding: {
  	      		          left: 10,
  	      		          right: 25,
  	      		          top: 25,
  	      		          bottom: 0
  	      		        }
  	      		      },
  	      		      scales: {
  	      		        xAxes: [{
  	      		          time: {
  	      		            unit: 'date'
  	      		          },
  	      		          gridLines: {
  	      		            display: false,
  	      		            drawBorder: false
  	      		          },
  	      		          ticks: {
  	      		            maxTicksLimit: 7
  	      		          }
  	      		        }],
  	      		        yAxes: [{
  	      		          ticks: {
  	      		            maxTicksLimit: 5,
  	      		            padding: 10,
  	      		            // Include a dollar sign in the ticks
  	      		            callback: function(value, index, values) {
  	      		              return number_format(value) + "건";
  	      		            }
  	      		          },
  	      		          gridLines: {
  	      		            color: "rgb(234, 236, 244)",
  	      		            zeroLineColor: "rgb(234, 236, 244)",
  	      		            drawBorder: false,
  	      		            borderDash: [2],
  	      		            zeroLineBorderDash: [2]
  	      		          }
  	      		        }],
  	      		      },
  	      		      legend: {
  	      		        display: false
  	      		      },
  	      		      tooltips: {
  	      		        backgroundColor: "rgb(255,255,255)",
  	      		        bodyFontColor: "#858796",
  	      		        titleMarginBottom: 10,
  	      		        titleFontColor: '#6e707e',
  	      		        titleFontSize: 14,
  	      		        borderColor: '#dddfeb',
  	      		        borderWidth: 1,
  	      		        xPadding: 15,
  	      		        yPadding: 15,
  	      		        displayColors: false,
  	      		        intersect: false,
  	      		        mode: 'index',
  	      		        caretPadding: 10,
  	      		        callbacks: {
  	      		          label: function(tooltipItem, chart) {
  	      		            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
  	      		            return datasetLabel + number_format(tooltipItem.yLabel) + "건";
  	      		          }
  	      		        }
  	      		      }
  	      		    }
  	      		  });
  	      			
  	      			}
  	   			},
  	   		 error:function(request,status,error){
  	   	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
  	      			//통신 실패시 발생하는 함수(콜백)
  	   				}
  				});
  	  	}
  
  </script>
   

</body>

</html>