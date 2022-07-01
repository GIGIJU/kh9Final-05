<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<style>
    #edit{
       text-align: center;
       font-size: 2em;
   }
</style>
<body>
    <div class="container col-12" id="app">
        <div class="mt-5 col-6 offset-3">
            <h2 id="edit">개인정보 변경</h2>
        </div>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form method="post">
                <div class="mt-3">
                    <span>이름</span>
                   <input type="text" name="memberName" class="form-control"  value="${memberDto.memberName}" autocomplete="off" placeholder="한글,숫자 2~10자">
                </div>
                <div class="mt-3">
                    <span>닉네임</span>
                    <input type=text name="memberNick" class="form-control"  autocomplete="off" value="${memberDto.memberNick}" placeholder="한글,숫자 2~10자">
                </div>
                <div class="mt-3">
                    <span>생년월일</span>
                    <input type="date" name="memberBirth" class="form-control"  value="${memberDto.memberBirth}">
                </div>
                <div class="mt-3">
                    <span>전화번호</span>
                    <input type="tel" name="memberPhone" class="form-control"  value="${memberDto.memberPhone}" autocomplete="off" placeholder="-제외">
                </div>
                <div class="mt-3">
                    <span>이메일</span>
                    <input type="email" name="memberEmail" class="form-control"  value="${memberDto.memberEmail}" autocomplete="off">
                </div>
                <div class="mt-3">
                    <span>지역</span>
                    <input type="text" name="memberLocal"  class="form-control" value="${memberDto.memberLocal}" autocomplete="off" placeholder="한글만 허용 2자리 ex)서울">
                </div>
                <div class="mt-3">
                    <span>비밀번호 확인</span>
                    <input type="password" name="memberPw" class="form-control">
                </div>
                <div class="mt-4 d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">정보 변경하기</button>
                </div>
            </form>
        </div>
        <br><br><br><br>
    </div>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
       
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>