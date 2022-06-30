<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>웹소켓</h1>

<h2><a href="default">기본 웹소켓</a></h2>
<h2><a href="timing">웹소켓 시점 확인</a></h2>
<h2><a href="simple">간단한 텍스트 전송</a></h2>
<h2><a href="multiuser">다중 사용자 관리</a></h2>
<h2><a href="multiuser">챗봇 예제</a></h2>

<hr>

<h1>세션 정보</h1>
<h2>사용자: ${login}</h2>
<h2>권한: ${auth}</h2>
<h2>로그인? ${login !=null}</h2>

<c:choose>
	<c:when test="$[login !=null]">
		<a href="member/logout">로그아웃</a>
		</c:when>
		<c:otherwise>

<form action="member/login" method="post">
<input type="text" name="memberId" placeholder="아이디" required>
<input type="password" name="memberPw" placeholder="비밀번호" required>
<input type="submit" value="로그인">
</form>
</c:otherwise>
</c:choose>

<h2><a href="member_only">회원전용</a></h2>

<a href="member/login">로그아웃</a>






















  <script>
	/*
		프론트엔드 암호화에 대한 계획
		- 암호화 알고리즘은 상황에 맞게 선택
		- input[type=password] 형태의 컬럼을 찾아서 전송 전에 암호화한 값으로 교체
	*/
	$(function(){
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