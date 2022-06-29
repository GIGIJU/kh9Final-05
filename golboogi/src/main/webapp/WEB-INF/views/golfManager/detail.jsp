<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container">

	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/bg_1.jpg');">
	    <div class="container">
	        <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 250px;">
	            <div class="col-md-9 ftco-animate pb-5 text-center">
	                <h1 class="mb-0 bread">골프장 관리자 목록</h1>
	            </div>
	        </div>
	    </div>
	</section>
	
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
                    <th>골프장 번호</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                    <tr>
                        <td>${golfManagerDto.golfManagerId}</td>
                        <td>${golfManagerDto.fieldNo}</td>
                        <td><a href="${root}/golfManager/delete?golfManagerId=${golfManagerDto.golfManagerId}">삭제(아이콘변경예정)</a></td>
                    </tr>
            </tbody>
        </table>
        <div>
        </div>
    </div>
    
    
    
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>