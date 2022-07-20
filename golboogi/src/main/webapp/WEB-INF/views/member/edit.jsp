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
	#edit {
		text-align: center;
	}
</style>
<div class="container col-12" id="app">
	<div class="mt-3" align="center">
		<h1 id="edit">개인정보 변경</h1>
	</div>
	<br><br>
	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
		<form v-on:submit="sendForm($event)" method="post">
			<div class="mt-3">
				<span>이름</span> 
				<input type="text" name="memberName" class="form-control" value="${memberDto.memberName}" autocomplete="off" placeholder="한글,숫자 2~10자">
			</div>
			<div class="mt-3">
				<span>닉네임</span> 
				<input type=text name="memberNick" class="form-control" autocomplete="off" value="${memberDto.memberNick}" placeholder="한글,숫자 2~10자">
			</div>
			<div class="mt-3">
				<span>생년월일</span> 
				<input type="date" name="memberBirth" class="form-control" value="${memberDto.memberBirth}">
			</div>
			<div class="mt-3">
				<span>전화번호</span> 
				<input type="tel" name="memberPhone" class="form-control" value="${memberDto.memberPhone}" autocomplete="off" placeholder="-제외">
			</div>
			<div class="mt-3">
				<span>이메일</span> 
				<input type="email" name="memberEmail" class="form-control" value="${memberDto.memberEmail}" autocomplete="off">
			</div>
			<div class="mt-3">
				<span>성별</span>
				<select name="memberGender" class="form-control">
					<option <c:if test="${memberDto.memberGender == '남'}">selected</c:if>>남</option>
					<option <c:if test="${memberDto.memberGender == '여'}">selected</c:if>>여</option>
				</select>
			</div>
			<div class="mt-3">
				<span>지역</span> 
				<input type="text" name="memberLocal" class="form-control" value="${memberDto.memberLocal}" autocomplete="off" placeholder="한글만 허용 2자리 ex)서울">
			</div>
			<div class="mt-3">
				<span>변경 확인</span> 
				<input type="text" v-model="ok" class="form-control"><br>
				<p>"변경한다"를 입력해주세요</p>
			</div>
			<br><br>
			<div class="mt-4 d-grid" align="center">
				<button type="submit" class="btn btn-success btn-lg btn-block">정보 변경하기</button>
			</div>
		</form>
	</div>
	<br><br><br><br>
</div>
<script src="https://unpkg.com/vue@next"></script>
		<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                  ok:"",
                  pk:"변경한다",
                  get isPath(){
                      return this.ok.length > 0 && this.ok == this.pk;
                  },
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                isTextPath(){
                	const ok = '변경합니다';
                	return this.textCheck.lengh > 0 && this.textCheck == this.ok;
                },
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	sendForm(e){
                    if(this.isPath == false){
                        e.preventDefault();
                    }
                },
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>