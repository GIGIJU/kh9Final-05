<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberId" value="${login}"></c:set>
<c:set var="isLogin" value="${memberId != null}"></c:set>
<c:set var="adminId" value="${adminLogin}"></c:set>
<c:set var="isAdmin" value="${adminId != null}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <title>golboogi</title>
  <link href="${root}/images/favicon-logo.png" rel="icon">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${root}/css/animate.css">
  
  <link rel="stylesheet" href="${root}/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${root}/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${root}/css/magnific-popup.css">

  <link rel="stylesheet" href="${root}/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${root}/css/jquery.timepicker.css">
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css"><!-- 데이터피커 -->
  
  <link rel="stylesheet" href="${root}/css/flaticon.css">
  <link rel="stylesheet" href="${root}/css/style.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script>
	/*
		프론트엔드 암호화에 대한 계획
		- 암호화 알고리즘은 상황에 맞게 선택
		- input[type=password] 형태의 컬럼을 찾아서 전송 전에 암호화한 값으로 교체
	*/
	(function(){
		$("form").submit(function(){
			//this == form
			$(this).find("input[type=password]").each(function(){
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
	
	<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
	
	
</head>
<body>
<df-messenger
  intent="WELCOME"
  chat-title="GOLF_BOT"
  agent-id="6ff71c6c-70c1-4b5f-924d-544ac3698b6c"
  language-code="ko"
></df-messenger>
 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="/"><img src="${root}/images/golboogi-logo.png" width="160" height="50"></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
     </button>

     <div class="collapse navbar-collapse" id="ftco-nav">
       <ul class="navbar-nav ml-auto">
         <li class="nav-item"><a href="${root}/booking/list" class="nav-link">골프부킹</a></li>
         <li class="nav-item"><a href="${root}/package/list" class="nav-link">투어</a></li>
         <li class="nav-item"><a href="${root}/join/list" class="nav-link">조인</a></li>
         <li class="nav-item"><a href="${root}/review/list" class="nav-link">리뷰게시판</a></li>
         <li class="nav-item"><a href="${root}/notice/list" class="nav-link">공지사항</a></li>
         <li class="nav-item"><a href="${root}/field/golf_field" class="nav-link">골프장</a></li>
         <c:choose>
         	<c:when test="${isLogin}">
	         	 <li class="nav-item"><a href="${root}/member/mypage" class="nav-link">마이페이지</a></li>
	         	 <li class="nav-item"><a href="${root}/member/logout" class="nav-link">로그아웃</a></li>
         	</c:when>
         	<c:when test="${isAdmin && auth == 0}">
	         	 <li class="nav-item"><a href="${root}/admin/list" class="nav-link">골프장 관리자 목록</a></li>
	         	 <li class="nav-item"><a href="${root}/admin/member_list" class="nav-link">일반회원 목록</a></li>
	         	 <li class="nav-item"><a href="${root}/admin/logout" class="nav-link">로그아웃</a></li>
         	</c:when>
         	<c:when test="${isAdmin && auth == 1}">
	         	 <li class="nav-item"><a href="${root}/manager/stat/${adminId}" class="nav-link">관리자 페이지</a></li>
	         	 <li class="nav-item"><a href="${root}/admin/logout" class="nav-link">로그아웃</a></li>
         	</c:when>
         	<c:otherwise>
	         	<li class="nav-item"><a href="${root}/member/login" class="nav-link">로그인</a></li>
	         	<li class="nav-item"><a href="${root}/member/join" class="nav-link">회원가입</a></li>
         	</c:otherwise>
         </c:choose>
       </ul>
     </div>
   </div>
 </nav>
 <!-- END nav -->
 