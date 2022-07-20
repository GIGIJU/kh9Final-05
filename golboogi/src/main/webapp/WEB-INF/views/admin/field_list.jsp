<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">골프장 목록</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">정보등록</li>
        <li class="breadcrumb-item active">골프장 목록</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
        </div>
        
          <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>골프장</th>
                        <th>관리자ID</th>
                        <th>지역</th>
                        <th>전화번호</th>
                        <th>수수료</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="golfFieldVO" items="${golfFieldVO}">
                    <tr>
						<td>${golfFieldVO.fieldName}</td>
						<td>${golfFieldVO.golfManagerId}</td>
						<td>${golfFieldVO.fieldArea}</td>
						<td>${golfFieldVO.fieldPhone}</td>
						<td>${golfFieldVO.fieldCommission}</td>
						<td>
							<a href="${root}/admin/field_detail?fieldNo=${golfFieldVO.fieldNo}" class="btn btn-primary">이동</a>
						</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a href="${root}/golboogi/admin/field_insert"><i class="fa-solid fa-circle-plus"></i>골프장 등록</a>
        </div>
        
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    