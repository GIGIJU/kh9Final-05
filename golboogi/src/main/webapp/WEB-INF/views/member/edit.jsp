<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight"
	style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br>
<br>
<br>
<br>
<form action="edit" method="post">
	<div class="container w450 m30">
		<div class="row center">
			<h1>개인정보 변경</h1>
		</div>
		<div>
			<label>이름</label> <input type="text" name="memberName" required value="${memberDto.memberName}">
		</div>

		<div class="row">
			<label>닉네임</label> <input type="text" name="memberNick"
				autocomplete="off" required class="form-input fill input-round"
				value="${memberDto.memberNick}">
		</div>
		<div class="row">
			<label>생년월일</label><br> <input type="date" name="memberBirth"
				autocomplete="off" required class="form-input input-round"
				value="${memberDto.memberBirth}">
		</div>
		<div class="row">
			<label>전화번호</label> <input type="tel" name="memberPhone"
				autocomplete="off" required class="form-input fill input-round"
				value="${memberDto.memberPhone}">
		</div>
		<div class="row">
			<label>이메일</label> <input type="email" name="memberEmail"
				autocomplete="off" class="form-input fill input-round"
				value="${memberDto.memberEmail}">
		</div>
		<div>
			<label>성별</label> 
			<select name="memberGender">
			<c:if test="${memberDto.memberGender != null}">
				<option value="">${memberDto.memberGender}</option>
			</c:if>
				<option>남</option>
				<option>여</option>
			</select>

		</div>

		<div>
			<label>지역</label> <input type="text" name="memberLocal" value="${memberDto.memberLocal}">
		</div>

		<div class="row">
			<label>비밀번호 확인</label> <input type="password" name="memberPw" required class="form-input fill input-round">
		</div>
		<div class="row">
			<button type="submit" class="btn btn-primary fill">정보 변경하기</button>
		</div>

		<c:if test="${param.error != null}">
			<div class="row center">
				<h3 style="color: red;">비밀번호가 일치하지 않습니다</h3>
			</div>
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>