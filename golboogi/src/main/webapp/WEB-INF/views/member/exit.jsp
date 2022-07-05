<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
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
                <div class="mt-3">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" name="memberPw" >
                </div>
                <br><br>
                <div class="mt-3 d-grid" align="center">
                    <button type="submit" class="btn btn-primary btn-lg" >회원 탈퇴</button> &nbsp;&nbsp;
                    <a href="${root}/member/changeInfo" class="btn btn-secondary btn-lg">취소</a>
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