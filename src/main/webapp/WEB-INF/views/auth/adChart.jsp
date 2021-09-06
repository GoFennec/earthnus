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
  	h6{
  		text-align:center;
  	}
  	input{
  		text-align:center;
  	}
  	#visitorArea,#visitorArea2{
  		width:200px;
  		text-align:center;
  	}
  </style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adIndex">
        <div class="sidebar-brand-icon">
          <img src="/resources/assets/img/logo/logo2_footer.png">
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
            
            <!-- Area Chart -->
            <div class="col-lg-6">
              <div class="card mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">최근 7일 방문자 수</h6>
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
            <div class="col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">최근 7일 카테고리 별 최근 후원 금액</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">최근 7일 가입자 수</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myMemberChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold">최근 7일 지구마켓 주문</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myExgoodsChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->

        </div>
        <!---Container Fluid-->
      </div>

      <!-- Footer -->
      <!-- Footer -->
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
    type: 'doughnut',
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
    type: 'doughnut',
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
  
  var sumPlastic = ${sumPlastic};
  var sumOcean = ${sumOcean};
  var sumIce = ${sumIce};
  var sumForest = ${sumForest};
  var countMember = ${countMember};
  var countExgoods = ${countExgoods};
  
  var day = new Array;
  var dateString = new Array;
  for(var i = 0; i < 7; i++){
	  var today = new Date();
	  today.setDate(today.getDate()-i);
	  var year = today.getFullYear();
	  var month = ('0' + (today.getMonth() + 1)).slice(-2);
	  var date = ('0' + (today.getDate())).slice(-2);
	  dateString[i] = year + '-' + month  + '-' + date;
  }
	dateString = dateString.reverse();
	sumPlastic = sumPlastic.reverse();
	sumOcean = sumOcean.reverse();
	sumIce = sumIce.reverse();
	sumForest = sumForest.reverse();
	countMember = countMember.reverse();
	countExgoods = countExgoods.reverse();
  
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
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
  </script>
  <script type="text/javascript">
  
  var sevenDate = new Date();
  var yyyy = sevenDate.getFullYear();
  var mm = ('0' + (sevenDate.getMonth() + 1)).slice(-2);
  var dd = ('0' + (sevenDate.getDate())).slice(-2);
  var day = new Array;
  var dateString = [];
  var lastWeek = new Date();
  var pastWeek = new Date();
  
  for(var i = 0; i < 7; i++){
	  var today = new Date();
	  today.setDate(today.getDate()-i);
	  var year = today.getFullYear();
	  var month = ('0' + (today.getMonth() + 1)).slice(-2);
	  var date = ('0' + (today.getDate())).slice(-2);
	  dateString[i] = year + '-' + month  + '-' + date;
  }
  var dateLabel = dateString.reverse();
  var countVisitor = ${countVisitor};
  var visitorData = countVisitor.reverse();
  
  var sevenDay = dateString[0] + " ~ " + dateString[6];
  
  $("#visitorArea2").val(dateString[6]);
  $("#visitorArea").val(dateString[0]);
  
  $('#leftWeek').click(function(){
	  alert(sevenDate);
  });
  
  
  
  
	
  var ctx = document.getElementById("myAreaChart");
  var myAreaChart = new Chart(ctx, {
    type: 'line',
    data: {
    	 
      labels: dateLabel,
    	 
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
        data: visitorData,
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
  
//가입한 회원
  var ctx = document.getElementById("myMemberChart");
  var myMemberChart = new Chart(ctx, {
    type: 'line',
    data: {
    	 
      labels: dateLabel,
    	 
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
        data: countMember,
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
  
//굳즈
  var ctx = document.getElementById("myExgoodsChart");
  var myExgoodsChart = new Chart(ctx, {
    type: 'line',
    data: {
    	 
      labels: dateLabel,
    	 
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
  </script>
   

</body>

</html>