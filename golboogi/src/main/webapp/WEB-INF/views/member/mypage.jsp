<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2"><a href="${root}/member/mypage">mypage <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">마이페이지</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
    #mypage{
        text-align: center;
        font-size: 2em;
    }
</style>
    <div class="container">
        <div class="mt-3 col-12">
            <h2 id="mypage">내정보</h2>
        </div>
        <br>
        
       	<!-- 프로필 이미지 -->
		<div class="mt-3" align="center">
			<img src="${pageContext.request.contextPath}${profileUrl}" width="300px;" class="img img-circle img-shadow">
		</div>
		
        <br>
        <div class="row mt-4">
            <div class="col-sm-8 offset-sm-2">
                <table class="table">
                    <tr>
                        <th width="30%">아이디</th>                        
                        <td width="50%">${memberDto.memberId}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${memberDto.memberName}</td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>${memberDto.memberNick}</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>${memberDto.memberBirth}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${memberDto.memberPhone}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${memberDto.memberEmail}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${memberDto.memberGender}</td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>${memberDto.memberLocal}</td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${memberDto.memberJoindate}</td>
                    </tr>
                    <tr>
                        <th>최근접속일</th>
                        <td>${memberDto.memberLogindate}</td>
                    </tr>
                </table>
                <br><br>
                <div class="mt-3" align="center">
                	<a href="${root}/member/memberProfile" class="btn btn-success btn-lg btn-block">프로필 수정</a>
                </div>
                <div class="mt-4 d-grid" align="center">
                    <a href="${root}/member/changeInfo" class="btn btn-success btn-lg btn-block">회원정보 수정</a>
                </div>
            </div>
        </div>
        <br><br><br><br>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>