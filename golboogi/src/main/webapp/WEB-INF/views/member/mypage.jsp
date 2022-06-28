<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<br><br><br><br>
	<div class="container w700 m-20">
		<div class="row col-m4">
			<h2>내정보</h2>
		</div>
		<div class="row col-m4">
			아이디 : ${memberDto.memberId} <br>
			이름 : ${memberDto.memberName} <br>
			닉네임 : ${memberDto.memberNick} <br>
			생년월일 : ${memberDto.memberBirth} <br>
			전화번호 : ${memberDto.memberPhone} <br>
			이메일 : ${memberDto.memberEmail} <br>
			성벌 : ${memberDto.memberGender} <br>
			지역 : ${memberDto.memberLocal}	<br>
			가입일 : ${memberDto.memberJoindate} <br>
			최근접속일 : ${memberDto.memberLogindate} <br>
		</div>
		<div class="row col-m4">
			<a href="${root}/member/edit">정보 수정</a> &nbsp;&nbsp;
			<a href="${root}/member/password">비밀번호 변경</a>  &nbsp;&nbsp;
			<a href="${root}/member/exit">탈퇴</a>  &nbsp;&nbsp;
		</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>