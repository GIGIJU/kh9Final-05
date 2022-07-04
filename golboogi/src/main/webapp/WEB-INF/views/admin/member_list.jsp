<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="hero-wrap-custom" style="background-color:black;"><!-- background-image: url('${root}/images/bg_1.jpg'); -->
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
		<h1 style="color:white;">일반 회원 목록</h1>
	</div>
	
    <div class="row mt-4">
        <table class="table table-striped">
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
                        			<a href="${root}/admin/member_blacklist?memberId=${memberList.memberId}" class="btn btn-secondary" >N</a>
                        		</c:if>
                        		<c:if test="${memberList.memberGrade == 1}">
                        			<a href="${root}/admin/member_blacklist?memberId=${memberList.memberId}" class="btn btn-danger">Y</a>
                        		</c:if>
                        </td>
                        <td>
							<a href="${root}/admin/member_detail?memberId=${memberList.memberId}" class="btn btn-primary">이동</a>
						</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>