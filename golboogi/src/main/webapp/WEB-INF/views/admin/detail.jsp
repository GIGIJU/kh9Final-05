<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">${adminVO.golfManagerId}님 상세페이지</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">골프장관리자목록</li>
        <li class="breadcrumb-item"><a href="${root}/admin/list">골프장관리자목록</a></li>
        <li class="breadcrumb-item">${adminVO.golfManagerId}님 상세페이지</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header">
            <div style="color:red;">삭제 시 복구 하실 수 없습니다.</div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>아이디</th>
	                    <th>골프장 번호</th>
	                    <th>골프장 이름</th>
	                    <th>삭제</th>
	                    <th>목록으로</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                        <td>${adminVO.golfManagerId}</td>
                        <td>${adminVO.fieldNo}</td>
                        <td>${adminVO.fieldName}</td>
                        <td>
                        		<a href="${root}/admin/delete?golfManagerId=${adminVO.golfManagerId}" class="btn btn-danger">삭제</a>
                        </td>
                        <td>
                        		<a href="${root}/admin/list" class="btn btn-primary">돌아가기</a>
                        </td>
					</tr>
                </tbody>
            </table>
            
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    