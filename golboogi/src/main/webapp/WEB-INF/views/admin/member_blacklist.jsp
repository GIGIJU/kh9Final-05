<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="hero-wrap-custom" style="background-color:black;">
  <!-- background-image: url('${root}/images/bg_1.jpg'); -->
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 250px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
      </div>
    </div>
  </div>
</section>

<div class="container mt-4">

	<!-- jumbotron -->
 	<div class="p-3 mb-4 text-light bg-dark col-md-6 rounded">
		<h2 style="color:white;">${memberDto.memberId}님 블랙리스트 등록</h2>
 	</div>
 	
 	<div class="row">
 		<div class="col col-md-3">
	 		<form method="post" class="form-check">
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
 		
 		 	</div>
	
	<div class="row">
		<a href="${root}/admin/member_list" class="btn btn-secondary">돌아가기</a>
	</div>



</div>





















<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>