w<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">숙소 목록</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">숙소 등록</li>
        <li class="breadcrumb-item active">숙소 목록</li>
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
                        <th>숙소 타입</th>
                        <th>객실 타입</th>
                        <th>전화번호</th>
                        <th>지역</th>
                        <th>정보변경</th>
                        <th>사진추가</th>
                        <th>사진삭제</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="stayDto" items="${stayDto}">
                    <tr>
						<td>${stayDto.stayName}</td>
						<td>${stayDto.stayType}</td>
						<td>${stayDto.stayRoom}</td>
						<td>${stayDto.stayPhone}</td>
						<td>${stayDto.stayLocal}</td>
						<td>
							<a href="stay_detail?stayNo=${stayDto.stayNo}" class="btn btn-primary">이동</a>
						</td>
						<td>
							<a href="stay_file_update?stayNo=${stayDto.stayNo}" class="btn btn-success">이동</a>
						</td>
						<td>
							<a href="stay_file?stayNo=${stayDto.stayNo}" class="btn btn-danger">이동</a>
						</td>
						
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a href="stay_insert"><i class="fa-solid fa-circle-plus"></i>숙소 등록</a>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    