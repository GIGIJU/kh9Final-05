<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<div id="app">
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home 
						<i class="fa fa-chevron-right"></i></a></span> 
						<span>Hotel <i class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">booking</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="col-4 offset-4">
		 <input type="text" id="booking-datePicker" class="form-control" value="${param.teeTimeD}" v-on:input="location"/>			
	</div>
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<div class="pt-5 mt-5">
						<h3 class="mb-5 text-center"
							style="font-size: 20px; font-weight: bold;">${param.teeTimeD}</h3>
						<hr>
						<ul class="comment-list">
							<c:forEach var="teetimeVO" items="${list}">
								<li class="comment">
									<div class="vcard bio">
										<img src="${root}/images/golf-dummy.jpg" style="height: 50px">
									</div>
									<div class="comment-body">
										<h3>${teetimeVO.fieldName}</h3>
										<div class="meta" style="font-size: 9px">
											~<fmt:formatNumber value="${teetimeVO.fieldGreenfee-20000}" />
											<span>${teetimeVO.fieldArea}</span>
										</div>
										<p>
											<a class="reply" href="">${teetimeVO.count}개 예약시간 보기</a>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!--vue jis도 lazy loading을 사용한다-->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                	teeTimeD:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
				
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	location(){
            		window.location.href="http://localhost:8080/booking/search?teeTimeD="+this.teeTimeD;
            	}
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
            mounted(){

            }, 
            created(){
       
            },
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>