<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
 <style>
        #mypage{
            text-align: center;
            font-size: 2em;
        }
    </style>
<body>
    <div class="container">
        <div class="mt-3 col-12">
            <h2 id="mypage">내정보</h2>
        </div>
        <div class="row mt-4">
            <div class="col-sm-8 offset-sm-2">
                <table class="table">
                    <tr>
                        <th width="30%">아이디</th>                        
                        <td width="50%">${memberDto.memberId}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${memberDto.memberName}</td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>${memberDto.memberNick}</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>${memberDto.memberBirth}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${memberDto.memberPhone}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${memberDto.memberEmail}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${memberDto.memberGender}</td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>${memberDto.memberLocal}</td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${memberDto.memberJoindate}</td>
                    </tr>
                    <tr>
                        <th>최근접속일</th>
                        <td>${memberDto.memberLogindate}</td>
                    </tr>
                </table>
                <div class="mt-4 d-grid">
                    <a href="${root}/member/changeInfo" class="btn btn-primary rounded">회원정보 수정</a>
                </div>
            </div>
        </div>
        <br><br><br><br>
    </div>
    
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
      
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>