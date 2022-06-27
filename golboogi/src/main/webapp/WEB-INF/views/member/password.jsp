<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="password" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>비밀번호 변경</h1>
	    </div>
	    <div class="row">
	        <label>현재 비밀번호</label>
	        <input type="password" name="memberPw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>바꿀 비밀번호</label>
	        <input type="password" name="changePw" required class="form-input fill input-round">
	    </div>
	    <br><br>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 변경하기</button>
	    </div>
	    
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>