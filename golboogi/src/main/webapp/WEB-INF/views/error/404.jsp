<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
	<div class="container w700 m30">
		<div class="row center m30">
			<h1>페이지를 찾을 수 없습니다.</h1>
		</div>
		
		<div class="row">
			<img src = "${pageContext.request.contextPath}/images/404.jpg" class="fill img img">		
		</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>