<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
        $(function () {
            //차트는 시작하자마자 화면에 표시되어야 한다.
            // -> 시작하자마자 서버에 비동기통신 요청을 보내서 데이터를 가져와야 한다.
            // -> 가져온 데이터에서 제목과 내용을 분리해서 설정한다.
            // -> (중요) 통신이 끝나야 차트가 나올 수 있다

            $.ajax({
             	url : "${root}/golboogi/rest/manager/charts",
                type : "get" ,
                //data : {},
                success:function(resp){
                    //차트 생성
                    //console.log(resp);

                    //label : X축에 표시될 항목들
                    var labels = [];
                    for(var i=0; i < resp.length; i++) {
                        labels.push(resp[i].month);//연도를 라벨에 추가
                    }

                    var cnt = [];
                    for(var i=0; i < resp.length; i++) {
                        cnt.push(resp[i].cnt);//카운트를 데이터에 추가
                    }

                    //data : 차트에 표시될 데이터
                    var data = {
                        labels: labels,
                        datasets: [{
                            label: '가입인원수',//범례
                            backgroundColor: 'rgb(255, 99, 132)',//배경색
                            borderColor: 'rgb(255, 99, 132)',//테두리색
                            data: cnt,//데이터
                        }]
                    };

                    //차트의 형태 등을 설정(옵션, 환경설정)
                    var config = {
                        type: 'bar',//차트의 모양
                        data: data,//차트 데이터
                        options: {}
                    };

                    //차트 생성 구문
                    var myChart = new Chart(
                        document.querySelector('#myChart'),//차트 적용 대상
                        config//차트 옵션
                    );
                }
            });
            
            $.ajax({
                url : "${root}/golboogi/rest/manager/stat",
                type : "get" ,
                //data : {},
                success:function(resp){
                    //차트 생성
                    //console.log(resp);
                    		console.log(resp);

                    //label : X축에 표시될 항목들
                    var labels = [];
                    for(var i=0; i < resp.length; i++) {
                        labels.push(resp[i].month);//연도를 라벨에 추가
                    }

                    var sum = [];
                    for(var i=0; i < resp.length; i++) {
                    		sum.push(resp[i].sum);//카운트를 데이터에 추가
                    }

                    //data : 차트에 표시될 데이터
                    var data = {
                        labels: labels,
                        datasets: [{
                            label: '월 매출 액',//범례
                            backgroundColor: '#00a8ff',//배경색
                            data: sum,//데이터
                        }]
                    };

                    //차트의 형태 등을 설정(옵션, 환경설정)
                    var config = {
                        type: 'bar',//차트의 모양
                        data: data,//차트 데이터
                        options: {}
                    };

                    //차트 생성 구문
                    var myChart = new Chart(
                        document.querySelector('#myChart2'),//차트 적용 대상
                        config//차트 옵션
                    );
                }
            });
            
        });
    </script>
    
<jsp:include page="/WEB-INF/views/template/header_manager.jsp"></jsp:include>


<div class="container-fluid px-4">
	<h1 class="mt-4">골프장</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="#"></a></li>
		<li class="breadcrumb-item active">Charts</li>
	</ol>


	<div class="row">
		<div class="col-lg-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i>
					월별 가입 회원 통계
				</div>
				<div class="card-body"><canvas id="myChart" width="100%" height="50"></canvas></div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i>
					월별 매출 통계
				</div>
				<div class="card-body"><canvas id="myChart2" width="100%" height="50"></canvas></div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
		</div>
		
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer_manager.jsp"></jsp:include>