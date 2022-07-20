<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Mypage<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">회원 탈퇴</p>
				</div>
			</div>
		</div>
	</section>	
<style>
      #exit{
         text-align: center;
         font-size: 2em;
     }
</style>
<body>
    <div class="container col-12" id="app">
    <br><br>
        <div class="mt-4 col-6 offset-3">
            <h2 id="exit">회월 탈퇴</h2>
        </div>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form action="exit" method="post">
                <div class="mt-3">
                	<label>아이디</label>
                	<input type="text" class="form-control" name="memberId" value="${memberId}" readonly>
                </div>
                 <br>
                <div class="mt-3">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" name="memberPw" >
                </div>
                <br>
                <div class="mt-3" align="center">
                    <button type="submit" class="btn btn-danger btn-lg btn-block">회원 탈퇴</button> &nbsp;&nbsp;
                </div>
                <div class="mt-3" align="center">
                    <a href="${root}/member/changeInfo" class="btn btn-success btn-lg btn-block">취소</a>
                </div>
                <% if(request.getParameter("error") != null) { %>
					<div class="mt-3" align="center">
						<h3 style="color:red;">비밀번호를 다시 입력하세요</h3>
					</div>
				<% } %>
            </form>
        </div>
        <br><br>
    </div>
   <br><br><br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>