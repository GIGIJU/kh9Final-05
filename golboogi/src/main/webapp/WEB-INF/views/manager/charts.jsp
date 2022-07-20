<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header_manager.jsp"></jsp:include>

<div class="container-fluid px-4">
	<h1 class="mt-4">매출통계</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
		<li class="breadcrumb-item active">Charts</li>
	</ol>
<!-- 	<div class="card mb-4"> -->
<!-- 		<div class="card-body"> -->
<!-- 			Chart.js is a third party plugin that is used to generate the charts in this template. The charts below have -->
<!-- 			been customized - for further customization options, please visit the official -->
<!-- 			<a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a> -->
<!-- 			. -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="card mb-4"> -->
<!-- 		<div class="card-header"> -->
<!-- 			<i class="fas fa-chart-area me-1"></i> -->
<!-- 			Area Chart Example -->
<!-- 		</div> -->
<!-- 		<div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div> -->
<!-- 		<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
<!-- 	</div> -->

	<div class="row">
		<div class="col-lg-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i>
					월별 매출 추이
				</div>
				<div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-pie me-1"></i>
					파이 차트 예쁘당
				</div>
				<div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var context = document
		.getElementById('myChart')
		.getContext('2d');
	var myChart = new Chart(context, {
		type: 'bar', // 차트의 형태
		data: { // 차트에 들어갈 데이터
			labels: [
				//x 축
				'1', '2', '3', '4', '5', '6', '7'
			],
			datasets: [{ //데이터
					label: 'test1', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						21, 19, 25, 20, 23, 26, 25 //x축 label에 대응되는 데이터 값
					],
					backgroundColor: [
						//색상
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						//경계선 색상
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1 //경계선 굵기
				}
				/* ,
				                        {
				                            label: 'test2',
				                            fill: false,
				                            data: [
				                                8, 34, 12, 24
				                            ],
				                            backgroundColor: 'rgb(157, 109, 12)',
				                            borderColor: 'rgb(157, 109, 12)'
				                        } */
			]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			}
		}
	});
</script>


<jsp:include page="/WEB-INF/views/template/footer_manager.jsp"></jsp:include>