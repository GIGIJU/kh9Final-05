<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2"><a href="${root}/member/memberProfile">MemberProfile <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">프로필 변경</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
    #memberProfile{
        text-align: center;
        font-size: 2em;
    }
</style>
    <div class="container">
        <div class="mt-3 col-12">
            <h2 id="memberProfile">프로필 변경</h2>
        </div>
        <br><br>
        <div class="mt-3" align="center">
        	<img src="${pageContext.request.contextPath}${profileUrl}" width="300px;" class="img img-circle img-shadow">
        </div>
	    <br>    
   		<form action="memberProfile" method="post" enctype="multipart/form-data">
	       	<!-- 프로필 이미지 -->
			<div class="mt-3" align="center">
				<span>바꿀 프로필</span>
				<input type="file" name="memberProfile" class="form-control">
			</div>
			<br><br><br>
			<input type="submit" class="btn btn-success btn-lg btn-block" value="변경하기">
		</form>
    </div>
    <br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>