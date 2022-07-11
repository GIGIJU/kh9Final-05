<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
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