<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>

<div class="container-fluid px-4">
    <h1 class="mt-4">일반회원목록</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">회원관리메뉴</li>
        <li class="breadcrumb-item active">일반회원목록</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
        </div>
          <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>아이디</th>
	                    <th>이름</th>
	                    <th>전화번호</th>
	                    <th>블랙리스트여부</th>
	                    <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
            	<c:forEach var="memberList" items="${memberList}">
                    <tr>
                        <td>${memberList.memberId}</td>
                        <td>${memberList.memberName}</td>
                        <td>${memberList.memberPhone}</td>
                        <td>
                        		<c:if test="${memberList.memberGrade == 0}">
                        			<a href="member_blacklist?memberId=${memberList.memberId}" class="btn btn-secondary">N</a>
                        		</c:if>
                        		<c:if test="${memberList.memberGrade == 1}">
                        			<a href="member_blacklist?memberId=${memberList.memberId}" class="btn btn-danger">Y</a>
                        		</c:if>
                        </td>
                        <td>
							<a href="member_detail?memberId=${memberList.memberId}" class="btn btn-primary">이동</a>
						</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>