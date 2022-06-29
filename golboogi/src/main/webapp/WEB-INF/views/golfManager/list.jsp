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
	
	<div class="row" >
		<div class="col-3"></div>
		<div class="col-6"></div>
		<div class="col-3">
			<a href="${root}/golfManager/insert">골프장 관리자 생성</a>
		</div>
	
	</div>
    <div class="row mt-4">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>골프장 이름</th>
                    <th>정보 수정</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="golfManagerVO" items="${vo}">
                    <tr>
                        <td>${golfManagerVO.golfManagerId}</td>
                        <td>${golfManagerVO.fieldName}</td>
                        <td><a href="${root}/golfManager/detail?golfManagerId=${golfManagerVO.golfManagerId}">아이콘(변경예정)</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
        </div>
    </div>
    
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>