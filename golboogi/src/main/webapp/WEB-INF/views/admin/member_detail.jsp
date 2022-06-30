<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="hero-wrap-custom" style="background-color:black;"><!-- background-image: url('${root}/images/bg_1.jpg'); -->
   <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 250px;">
            <div class="col-md-9 ftco-animate pb-5 text-center">
            </div>
        </div>
    </div>
</section>

<div class="container mt-4">

    <!-- jumbotron -->
	<div class="p-3 mb-4 text-light bg-dark col-md-6 rounded">
		<h1 style="color:white;">${memberDto.memberId}님 상세정보</h1>
	</div>
	
	<div class="row-md-9">
		<div class="col-md-3">
			<table class="table table-bordered table-condensed table-hover" style="width: 500px;"> <!-- style="width: 100%;" -->
				<tr>
					<th >아이디</th> <!-- style="width: 50;" -->
					<td>${memberDto.memberId}</td>
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
					<th>전화번호</th>
					<td>${memberDto.memberPhone}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberDto.memberEmail}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${memberDto.memberBirth}</td>
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
					<th>최종 접속일</th>
					<td>${memberDto.memberLogindate}</td>
				</tr>
				<tr>
					<th>블랙리스트</th>
					<td>${memberDto.memberGrade}</td>
				</tr>
			</table>
		</div>
	 </div>
	 <div class="row ml-2">
	 	<div class="col-2 col-md-3">
			<a href="${root}/admin/member_list" class="btn btn-secondary">돌아가기</a>
		</div>
	 	<div class="col-2 col-md-3">
			<a href="${root}/admin/member_blacklist" class="btn btn-danger">블랙리스트 만들기</a>
		</div>
	 </div>
	 <br><br><br>
	    
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>