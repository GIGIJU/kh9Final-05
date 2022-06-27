<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memberId" value="${login}"></c:set>
<c:set var="isLogin" value="${memberId != null}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Golboogi</title>
</head>
<body>
	<c:choose>
		<c:when test="${isLogin}">
			<div>
				<a href="${root}/member/mypage">MyPage</a>&nbsp; <a href="${root}/member/logout">로그아웃</a>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<a href="${root}/member/login">로그인</a>&nbsp; <a href="${root}/member/join">회원가입</a>
			</div>
		</c:otherwise>
	</c:choose>
	<hr>
	<script>
		$(function() {
			$("form").submit(function() {
				//this == form
				$(this).find("input[type=password]").each(function() {
					//this == 입력창
					var rawData = $(this).val();
					//var encData = 암호화(rawData);
					var hash = CryptoJS.SHA1(rawData);//암호화
					var encData = CryptoJS.enc.Hex.stringify(hash);//문자열화
					$(this).val(encData);
				});
			});
		});
	</script>