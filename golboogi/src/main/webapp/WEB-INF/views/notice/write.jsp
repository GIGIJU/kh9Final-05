<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
<form action="write" method="post">
	<div class="container w800 m30">
	    <div class="row center">
	        <h1>공지글 작성</h1>
	    </div>
	    <br><br>
	    <div>
			<label>이벤트</label>
			<select name="noticeHead">
				<option value="">선택하세요</option>
				<option>이벤트</option>
				<option>공지사항</option>
				<option>정검</option>
			</select>	    
	    </div>
	    <br><br>
	    <div class="row">
	        <label>제목</label>
	        <input type="text" name="noticeTitle">
	    </div>
	    <div>
	    	<label>파일첨부</label>
	    	<input type="file">
	    </div>
	    <div class="row">
	        <button type="submit">등록</button>
	    </div>
	    <div class="row">
	        <a href="${root}/notice/list">목록</a>
	    </div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>