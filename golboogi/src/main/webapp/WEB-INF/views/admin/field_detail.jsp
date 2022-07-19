<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>

<div class="container-fluid px-4">
    <h1 class="mt-4">${list.fieldName} 상세정보</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">회원관리메뉴</li>
        <li class="breadcrumb-item active">${list.fieldName} 상세정보</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fa-solid fa-person"></i>
            ${list.fieldName}님의 상세정보 페이지 입니다.
        </div>
        <div class="card-body">
            <table class="table table-bordered table-condensed table-hover" style="width: 500px;"> 
				<tr>
					<th >골프장명</th>
					<td>${list.fieldName}</td>
				</tr>
				<tr>
					<th >골프장 주소1</th>
					<td>${list.fieldPost}</td>
				</tr>
				<tr>
					<th >골프장 주소2</th>
					<td>${list.fieldBasicAddress}</td>
				</tr>
				<tr>
					<th >골프장 주소3</th>
					<td>${list.fieldDetailAddress}</td>
				</tr>
				<tr>
					<th >골프장 정보</th>
					<td>${list.fieldInfo}</td>
				</tr>
				<tr>
					<th >골프장 번호</th>
					<td>${list.fieldPhone}</td>
				</tr>
				
				<tr>
					<th >캐디피</th>
					<td>${list.fieldCaddiefee}</td>
				</tr>
				<tr>
					<th >카트피</th>
					<td>${list.fieldCartfee}</td>
				</tr>
				<tr>
					<th >그린피</th>
					<td>${list.fieldGreenfee}</td>
				</tr>
				<tr>
					<th >개장일</th>
					<td>${list.fieldOpenday}</td>
				</tr>
				<tr>
					<th >사람</th>
					<td>${list.fieldPeople}</td>
				</tr>
				<tr>
					<th >선결제 여부</th>
					<c:if test="${list.fieldPrepay == 0}">
						<td>N</td>
					</c:if>
					<c:otherwise>
						<td>Y</td>
					</c:otherwise>
				</tr>
				<tr>
					<th >수수료</th>
					<td>${list.fieldCommission}</td>
				</tr>
				<tr>
					<th >지역</th>
					<td>${list.fieldArea}</td>
				</tr>
				
				<tr>
					<th >골프장 관리자 아이디</th>
					<td>${list.golfManagerId}</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<th >코스 이름</th>
						<td>${list.courseName}</td>
					</tr>
					<tr>
						<th >홀 정보</th>
						<td>${list.courseHole}</td>
					</tr>
				</c:forEach>
				
				
				
			</table>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>