<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Notice<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">공지사항</p>
				</div>
			</div>
		</div>
	</section>	
<form action="write" method="post" enctype="multipart/form-data">
	<div class="container">
	    <div class="mt-3" align="center">
	        <h1>공지글 작성</h1>
	    </div>
	    <br><br>
		<h3><label>이벤트</label></h3>
	    <div class="mt-3" align="center">
			<select name="noticeHead" class="form-control">
				<option value="">선택하세요</option>
				<option>이벤트</option>
				<option>공지사항</option>
				<option>정검</option>
			</select>	    
	    </div>
	    <br><br>
        <h3><label>제목</label></h3>
	    <div class="mt-3" class="form-control" align="center">
	        <input type="text" name="noticeTitle" class="form-control">
	    </div>
	    <br><br>
	    <h3><label>파일첨부</label></h3>
	    <div class="mt-3" align="center">
	    	<input type="file" class="form-control" name="noticeProfile">
	    </div>
	    <br><br>
	    <div class="mt-3" align="center">
	        <button type="submit" class="btn btn-success btn-lg btn-block">등록</button>
	    </div>
	    <br><br>
	    <hr>
	    <br><br>
	    <div class="mt-3" align="center">
	        <a href="${root}/notice/list" class="btn btn-success btn-lg btn-block">목록</a>
	    </div>
	</div>
</form>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>