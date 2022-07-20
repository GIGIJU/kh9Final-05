<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">패키지 목록</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">패키지 등록</li>
        <li class="breadcrumb-item active">패키지 목록</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
        </div>
        
          <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>숙소 이름</th>
                        <th>골프장 이름</th>
                        <th>숙소 타입</th>
                        <th>객실 타입</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="packageVO" items="${packageVO}">
                    <tr>
						<td>${packageVO.stayDto.stayName}</td>
						<td>${packageVO.fieldDto.fieldName}</td>
						<td>${packageVO.stayDto.stayType}</td>
						<td>${packageVO.stayDto.stayRoom}</td>
						<td>
							<a href="package_delete?packageNo=${packageVO.packageNo}" class="btn btn-danger">삭제</a>
						</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a href="package_insert"><i class="fa-solid fa-circle-plus"></i>패키지 등록</a>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    