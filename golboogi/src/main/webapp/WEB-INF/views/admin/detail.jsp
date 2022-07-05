<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<section class="hero-wrap hero-wrap-2" style="background-color:black;">
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 250px;">
            <div class="col-md-9 ftco-animate pb-5 text-center">
            </div>
        </div>
    </div>
</section>
	
<div class="container mt-4">
    <div class="row mt-4">
        <table class="table table-striped">
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
                        		<a href="${root}/admin/list" class="btn btn-secondary">돌아가기</a>
                        </td>
                    </tr>
            </tbody>
        </table>
    </div>
    
    
    
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







<!--     <div class="row"> -->
<!-- 		<form action="edit" method="post" class="form-check"> -->
<!-- 			<div class="row-col-3"> -->
<!-- 				<div class=""> -->
<!-- 	                   <label class="form-label">아이디</label> -->
<%-- 	                   <input type="text" class="form-control rounded" name="golfManagerId" placeholder="${golfManagerDto.golfManagerId}" disabled> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row-col-3 mt-3"> -->
<!-- 				<div class=""> -->
<!-- 					<label class="form-label">골프장 번호</label> -->
<%-- 					<input type="text" class="form-control rounded" name="fieldNo" placeholder="${golfManagerDto.fieldNo}"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row-col-3 mt-3"> -->
<!-- 				<button type="submit" class="btn btn-primary rounded">수정</button> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!--     </div> -->
<!--     <div class="row mt-3"> -->
<!-- 		<div class="col"> -->
<%-- 			<a href="${root}/admin/delete?golfManagerId=${golfManagerDto.golfManagerId}" class="btn btn-danger">삭제</a> --%>
<!-- 		</div> -->
<!-- 	</div> -->
    