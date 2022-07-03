<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${root}/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center"
				style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<h1 class="mb-0 bread">error</h1>
				</div>
			</div>
		</div>
	</section>
<br><br><br><br>
	<div class="container mb-5">
	<div class="col-md-6 offset-md-3 text-center">
		<div class="row">
			<h1>페이지를 찾을 수 없습니다.</h1>
		</div>
		
		<div class="row mt-3" style="width: 60%; float:none; margin:0 auto">
			<img src = "${pageContext.request.contextPath}/images/404.jpg" class="fill img img">		
		</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>