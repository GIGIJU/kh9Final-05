<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>

<div class="container-fluid px-4">
    <h1 class="mt-4">${memberDto.memberId}님 상세정보</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">회원관리메뉴</li>
        <li class="breadcrumb-item active"><a href="admin/member_list">일반회원목록</a></li>
        <li class="breadcrumb-item active">${memberDto.memberId}님 상세정보</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fa-solid fa-person"></i>
            ${memberDto.memberId}님의 상세정보 페이지 입니다.
        </div>
        <div class="card-body">
            <table class="table table-bordered table-condensed table-hover" style="width: 500px;"> 
				<tr>
					<th >아이디</th>
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
					<th>블랙리스트 여부</th>
					<c:if test="${memberDto.memberGrade == 0}">
						<td>N</td>
					</c:if>
					<c:if test="${memberDto.memberGrade == 1 }">
						<td style="color:red;">Y</td>
					</c:if>
				</tr>
			</table>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>