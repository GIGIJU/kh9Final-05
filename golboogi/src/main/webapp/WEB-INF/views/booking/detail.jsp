<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<style>
</style>
<div id="app">
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>booking <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">detail</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="col-4 offset-4">
		<input type="date" name="date" v-model="teeTimeD" v-on:input="location">
	</div>
	<%-- <div style="background-image: url('${root}/images/bg_1.jpg'),opacity:0.1;"> --%>
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3 text-center">
				<h2 style="font-weight: bold;">${golfFieldDto.fieldName}</h2>
			</div>
			<div class="col-md-6 offset-md-3 text-center">
				<img src="${root}/images/golf-dummy.jpg" width="400px"
					height="300px">
			</div>
			<div class="col-md-4 offset-md-4 mt-2">
				<span style="font-size: 9px;">${golfFieldDto.fieldInfo}</span>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-8 offset-md-2 text-center">
				<button class="btn" style="width: 100px;">타임정보</button>
				<button class="btn" style="width: 100px;">골프장정보</button>
			</div>
		</div>
		<div class="row mt-5 mb-5 text-center col-md-8 offset-md-2">
			<c:forEach var="teetimeVO" items="${teetimeList}">
				<div class="col-md-3 ftco-animate mt-2">
					<div style="border: black solid 1px">
						<button class="btn">${teetimeVO.teeTimeT}</button>
						<h6>
							<a href="reservation?teeTimeNo=${teetimeVO.teeTimeNo}&teeTimeD=${param.teeTimeD}">${teetimeVO.courseName}</a>
						</h6>
						<span class="days"><fmt:formatNumber
								value="${teetimeVO.fieldGreenfee}" />원~</span>
					</div>
				</div>
			</c:forEach>
			<hr>
		</div>
	</div>
</div>
<!--vue jis도 lazy loading을 사용한다-->
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
            		window.location.href="http://localhost:8080/booking/detail?fieldNo="+${param.fieldNo}+"&teeTimeD="+this.teeTimeD;
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