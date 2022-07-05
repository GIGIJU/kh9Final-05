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
        <div class="mt-4 col-6 offset-3">
            <h2 id="exit">회월 탈퇴</h2>
        </div>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form action="exit" method="post">
                <div class="mt-4">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" name="memberPw" >
                </div>
                <div class="mt-4 d-grid">
                    <button type="submit" class="btn btn-primary btn-lg" >회원 탈퇴</button>
                </div>
            </form>
        </div>
        <br><br><br><br>
    </div>
  
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>