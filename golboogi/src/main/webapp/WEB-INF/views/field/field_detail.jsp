<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<!-- css 파일 추가 -->
<link rel="stylesheet" href="${root}/css/master.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: inline-block;
	width: 100%;
	height: 100%;
	max-height: 873px;
	max-width: 700px;
	object-fit: cover;
}

.golf_field_info>ul li {
	font: 2em;
}
</style>
</head>

<body>
	<!-- END nav -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-0 bread">골프장</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"></a></span> <span>골프장
							정보 여기에 다 모였다 </span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<div class="col-md-8 offset-md-2">
		<section class="place_container">
			<h3 class="fieldName text-center" style="font-weight: bold;">${info.fieldName}</h3>
			<div class="place_content">
				<div class="place_swiper_container">
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper mySwiper round_swiper">
						<div class="swiper-wrapper">
							<c:choose>
								<c:when test="${empty list}">
									<div class="swiper-slide">
										<img src="${root}${profileUrl}">
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${list}">
										<div class="swiper-slide">
											<img src="${root}${profileUrl}${list.attachmentNo}">
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 					<div class="swiper-pagination"></div> -->
					</div>

					<!-- Swiper JS -->
					<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

					<!-- Initialize Swiper -->
					<script>
						var swiper = new Swiper(".mySwiper", {
							cssMode : true,
							navigation : {
								nextEl : ".swiper-button-next",
								prevEl : ".swiper-button-prev",
							},
							pagination : {
								el : ".swiper-pagination",
							},
							mousewheel : true,
							keyboard : true,
						});
					</script>
				</div>

				<div class="row mt-5 ml-4">
					<h4>골프장 정보</h4>
				</div>
				<hr>
				<h3></h3>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<!--  <div class=""> -->
					<!-- <div class=""> -->
					<p>${info.fieldInfo}</p>
					<div class="golf_field_info_content">
						<div class="golf_field_score">
							<div class="golf_field_score_content">
								<h1>골프장 평점</h1><br>
								<p>
									<fmt:formatNumber value="${rating}" pattern="#.#"></fmt:formatNumber>
								</p><br>
								<span>등록 라운드 330K</span>
							</div>
						</div>
						<div class="golf_field_info">
							<ul>
								<li><i class="bi bi-check"></i> ${info.fieldArea}</li>
								<li><i class="bi bi-check"></i> ${info.fieldBasicAddress}</li>
								<li><i class="bi bi-check"></i> ${info.fieldPhone}</li>
							</ul>
						</div>
					</div>
					<div class="place_round_btn_container" id="app">
						<a href="${root}/review/list?keyword=${info.fieldName}"
							id="round_review_write_btn">라운드 후기 보기</a> 
							<button id="round_review_show_btn" @click="locationReserve">예약하러 가기</button>
					</div>

				</div>
			</div>
		</section>
	</div>

	<div class="col-md-12 mt-3">
		<div id="map" style="width: 100%; height: 350px;"></div>
	</div>


</body>



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b03de227a4e196a92952ccb566363417&libraries=services"></script>
<script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script>
        const app = Vue.createApp({
            data(){
                return {
                	tomorrow:"",
                };
            },
            computed:{

            },
            methods:{
            	locationReserve(){
            		window.location.href="${root}/booking/detail?fieldNo=${info.fieldNo}&teeTimeD="+this.tomorrow;
            	}
            },
            watch:{

            },
            mounted(){
	            //내일 날짜
	           	 this.tomorrow = moment().add("1","d").format('YYYY-MM-DD');
	           	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    		mapOption = {
	    			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    			level : 3
	    		// 지도의 확대 레벨
	    		};

	    		var fieldName = $(".fieldName").text();

	    		// 지도를 생성 
	    		var map = new kakao.maps.Map(mapContainer, mapOption);

	    		// 주소-좌표 변환 객체를 생성
	    		var geocoder = new kakao.maps.services.Geocoder();

	    		// 주소로 좌표를 검색합니다
	    		geocoder
	    				.addressSearch(
	    						'${info.fieldBasicAddress}',
	    						function(result, status) {

	    							// 정상적으로 검색이 완료됐으면 
	    							if (status === kakao.maps.services.Status.OK) {

	    								var coords = new kakao.maps.LatLng(result[0].y,
	    										result[0].x);

	    								// 결과값으로 받은 위치를 마커로 표시
	    								var marker = new kakao.maps.Marker({
	    									map : map,
	    									position : coords
	    								});

	    								// 인포윈도우로 장소에 대한 설명을 표시
	    								var infowindow = new kakao.maps.InfoWindow(
	    										{
	    											content : '<div style="width:150px;text-align:center;padding:6px; border: 2px solid green; background-color: green; color:white;">'
	    													+ fieldName + '</div>'
	    										});
	    								infowindow.open(map, marker);

	    								// 지도의 중심을 결과값으로 받은 위치로 이동
	    								map.setCenter(coords);
	    							}
	    						});
            }
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
