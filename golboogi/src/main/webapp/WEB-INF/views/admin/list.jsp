<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">골프장관리자목록</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">회원관리메뉴</li>
        <li class="breadcrumb-item active">골프장관리자목록</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
        </div>
        
           <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th width="20%">아이디</th>
                        <th>골프장</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="adminVO" items="${adminVO}">
                    <tr>
						<td>${adminVO.golfManagerId}</td>
						<td>${adminVO.fieldName}</td>
						<td>
							<a href="detail?golfManagerId=${adminVO.golfManagerId}" class="btn btn-primary">이동</a>
						</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a href="insert"><i class="fa-solid fa-circle-plus"></i>관리자 생성</a>
        </div>
        
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    