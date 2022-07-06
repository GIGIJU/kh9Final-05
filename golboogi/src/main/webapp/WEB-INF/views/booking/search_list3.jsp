<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jquery -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function(){
		$("#datepicker").datepicker({
            showMonthAfterYear: true,
            changeMonth: true,
            dateFormat: "yy-mm-dd",
            nextText: "다음달",
            prevText: "이전달",
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8",
                "9", "10", "11", "12"
            ],
            minDate: '+1D',
            maxDate: '+60D',
            onSelect:(dateText)=>{
            	console.log(dateText);
            	location.href="${root}/search?teeTimeD="+dateText;
            }
        });
       
		//예약가능 시간 보기를 누르면 비동기 통신으로 예약 가능한 시간 목록을 불러와서 태그를 만들어 하단에 추가한다.
		$(".reply").click(function(e){
			//this : a태그
			var a = this;
			e.preventDefault();
			
			const fieldNo = $(this).prev("input[name=fieldNo]").val();
			
			const data = {
					fieldNo : fieldNo,
					teeTimeD : "${param.teeTimeD}"
			};
			if("${param.fieldArea}") {
				data.fieldArea = "${param.fieldArea}";
			}
			if("${param.PartTime}") {
				data.PartTime = parseInt("${param.PartTime}");
			}
			if("${param.fieldGreenfee}") {
				data.fieldGreenfee = parseInt("${param.fieldGreenfee}");
			}
			
			$.ajax({
				url:"${root}/rest/booking",
				type:"post",
				data:data,
				success:function(json){
					console.log(json);
					const target = $(a).parent().parent().next();					
					
					for(let i=0; i < json.length; i++){
						let template = $("#time-a-template").html();
						//template = template.replace("{{time}}",json[i].teeTimeT);
						let tag = $(template).text(json[i].teeTimeT)
											//.attr("data-field-no", json[i].fieldNo)
											//.attr("data-teetime-no", json[i].teeTimeNo)
											.attr("href", "${root}/booking/reservation?teeTimeNo="+json[i].teeTimeNo+"&teeTimeD="+data.teeTimeD);
						target.append(tag);
					}
					
					$(a).off("click");//이벤트 제거
					$(a).on("click", function(){
						$(this).parent().parent().next().toggle();
					});
				},
			});
		});
	});
</script>

<style>
span {
	font-size: 11px;
	color: black;
}
p {
	font-size: 11px;
}
.tagcloud {
    text-transform: uppercase;
    display: inline-block;
    padding: 4px 10px;
    margin-bottom: 7px;
    margin-right: 4px;
    border-radius: 4px;
    color: #000000;
    border: 1px solid #ccc;
    font-size: 11px;
}
.comment-list li {
    padding: 30px 30px 10px 30px;
    float: left;
    width: 100%;
    clear: both;
    list-style: none;
    background-color: #f1f2f6;
    border: #dfe4ea solid 1px;
}
</style>

<div id="app">
<!-- 상단 사진 -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>search <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>


<div class="container-fluid">
	<div class="row"> <!-- v-if="checkTeeTimeD" --><!-- <button @click="checkTeeTimeD">d</button> -->
		<!-- 왼쪽 (달력)-->
		<div class="col-lg-3 sidebar ftco-animate bg-light py-md-5">
			<div id="datepicker"></div>
		</div>
		<!-- 오른쪽 -->
		<div class="col-lg-9 ftco-animate py-md-5 mt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
					<div class="text-center"><h3 class="mb-5" style="font-size: 20px; font-weight: bold;">${param.teeTimeD}</h3></div>			
						<ul class="comment-list">
							<c:forEach var="teetimeVO" items="${list}" varStatus="status">
								<li class="comment mb-4">
									<div class="vcard bio">
										<img src="${root}/images/golf-dummy.jpg" style="height: 70px; width: 70px;">
									</div>
									<div class="comment-body">
										<h3>${teetimeVO.fieldName}</h3>
										<div class="meta" style="font-size: 9px">
											<span><i class="fa-solid fa-location-dot"></i> ${teetimeVO.fieldArea}</span>
											<span> [~<fmt:formatNumber value="${teetimeVO.fieldGreenfee-20000}" />]</span>
										</div>
										<p>
											<input type="hidden" name="fieldNo" value="${teetimeVO.fieldNo}">
											<a class="reply">${teetimeVO.count}개 예약 가능시간 보기</a>
										</p>
									</div>
									<div class="comment-body">
										
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>

<template id="time-a-template">
<a href="" class="tagcloud" style="width: 50px"></a>
</template>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>