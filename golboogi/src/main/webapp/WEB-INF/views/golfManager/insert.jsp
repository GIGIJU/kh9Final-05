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

    <div class="container-fluid">
        <!-- jumbotron -->
        <div class="p-4 mt-4 text-light bg-dark col-md-6 offset-md-3 rounded">
            <h1 style="color:white">골프장 관리자 아이디 생성</h1>
        </div>
        <form action="insert" method="post" autocomplete="off" class="form-check">

            <div class="row mt-3">
                <div class="col col-md-3 offset-md-3">
                    <label class="form-label">골프장 관리자 아이디</label>
                    <input type="text" class="form-control rounded" name="golfManagerId" >
                </div>
            </div>
            
            <div class="row mt-3">
                <div class="col col-md-3 offset-md-3">
                    <label class="form-label">골프장 관리자 비밀번호</label>
                    <input type="password" class="form-control rounded" name="golfManagerPw" >
                </div>
            </div>

            <div class="row mt-3">
                <div class="col col-md-3 offset-md-3">
                    <label class="form-label">골프장 번호</label>
                    <input type="number" class="form-control rounded" name="fieldNo" >
                </div>
            </div>
            
			<br>
            <div class="row mt-3">
                <div class="col col-md-3 offset-md-3">
                    <button type="submit" class="btn btn-primary rounded">회원가입</button>
                </div>
            </div>
            <br>

        </form>

    </div>    







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>