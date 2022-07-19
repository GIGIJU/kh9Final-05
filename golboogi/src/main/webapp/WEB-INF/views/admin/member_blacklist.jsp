<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>

<div class="container-fluid px-4">
    <h1 class="mt-4">${memberDto.memberId}님 상세정보</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">회원관리메뉴</li>
        <li class="breadcrumb-item active"><a href="${root}/admin/member_list">일반회원목록</a></li>
        <li class="breadcrumb-item active">${memberDto.memberId}님 블랙리스트 정보</li>
    </ol>

    <div class="card mb-4">
        <div class="card-header" >
            <div style="color:red; ">
            	블랙리스트 설정 시 로그인 기능이 제한되어 비회원 기능만 이용 가능합니다.
            </div>
        </div>
<!-- 		 	<div class="row"> -->
<!-- 		 		<div class="col col-md-3"> -->
<!-- 			 		<form method="post" class="form-check"> -->
<%-- 			 			<c:if test="${memberDto.memberGrade == 0}"> --%>
<!-- 			 				<input type="hidden" value="1" name="memberGrade"> -->
<!-- 			 				<button class="btn btn-danger">블랙리스트 지정하기</button> -->
<%-- 			 			</c:if> --%>
<%-- 			 			<c:if test="${memberDto.memberGrade == 1}"> --%>
<!-- 			 				<input type="hidden" value="0" name="memberGrade"> -->
<!-- 			 				<button class="btn btn-primary">블랙리스트 해제하기</button> -->
<%-- 			 			</c:if> --%>
						
<!-- 					</form> -->
<!-- 		 		</div> -->
<!--  		 	</div> -->
	 		<div class="m-3">
		 		<form method="post" class="form-check" style="padding:0px;">
		 			<c:if test="${memberDto.memberGrade == 0}">
		 				<input type="hidden" value="1" name="memberGrade">
		 				<button class="btn btn-danger">블랙리스트 지정하기</button>
		 			</c:if>
		 			<c:if test="${memberDto.memberGrade == 1}">
		 				<input type="hidden" value="0" name="memberGrade">
		 				<button class="btn btn-primary">블랙리스트 해제하기</button>
		 			</c:if>
				</form>
	 		</div>
		
		    <div class="card-footer">
				<a href="member_list" class="btn btn-secondary">돌아가기</a>
			</div>
    </div>
    
</div>


<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>