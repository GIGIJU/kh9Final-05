<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
<style>
.tagcloud {
    text-transform: uppercase;
    display: inline-block;
    padding: 4px 10px;
    margin-bottom: 7px;
    margin-right: 4px;
    border-radius: 4px;
    color: #000000;
    border: 1px solid #ccc;
    font-size: 11px;
}
</style>   
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
                        <th>정보변경</th>
                        <th>사진추가</th>
                        <th>사진삭제</th>
                    </tr>
                </thead>
                <tbody>
               		<c:forEach var="golfFieldVO" items="${golfFieldVO}">
                    <tr>
						<td>${golfFieldVO.fieldName}</td>
						<td>${golfFieldVO.golfManagerId}</td>
						<td>${golfFieldVO.fieldArea}</td>
						<td>${golfFieldVO.fieldPhone}</td>
						<td>
						<div class="row">
							<div class="col-6"><fmt:formatNumber value="${golfFieldVO.fieldCommission}" type="currency" currencySymbol="₩"/></div>
							<div class="col-6" style="text-align: right;">
							<a href="reset_commission/${golfFieldVO.fieldNo}" class="btn tagcloud">정산완료</a></div>
						</div>
						</td>
						<td>
							<a href="field_detail?fieldNo=${golfFieldVO.fieldNo}" class="btn btn-primary">이동</a>
						</td>
						<td>
							<a href="field_file_update?fieldNo=${golfFieldVO.fieldNo}" class="btn btn-success">이동</a>
						</td>
						<td>
							<a href="field_file?fieldNo=${golfFieldVO.fieldNo}" class="btn btn-danger">이동</a>
						</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <a href="field_insert"><i class="fa-solid fa-circle-plus"></i>&nbsp;골프장 등록</a>
        </div>
        
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>    