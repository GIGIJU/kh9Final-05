<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight"
	style="background-image: url('${root}/images/bg_1.jpg');"></section>
<style>
	#login {
		text-align: center;
		font-size: 2em;
	}
</style>
<div class="container col-12" id="app">
	<br><br><br>
	<div class="mt-3">
		<h2 id="login">로그인</h2>
	</div>

	<div
		class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
		<form v-on:submit="sendForm($event)" action="login" method="post">
			<div class="mt-3">
				<label>아이디</label> <input type="text" class="form-control"
					name="memberId" v-model="memberId" placeholder="영문 소문자,숫자 8자 이상">
				<span v-if="IdPass"></span> <span v-if="IdFalse">잘못된 작성입니다.</span>
			</div>
			<div class="mt-3">
				<label>비밀번호</label> <input v-bind:type="passwordInputType"
					class="form-control" name="memberPw" v-model="memberPw"
					placeholder="영문 소/대, 숫자, 특수문자 8자 이상"> <span v-if="PwPass"></span>
				<span v-if="PwFalse">잘못된 작성입니다.</span>
			</div>
			<div class="form-group form-check mt-3">
				<label>  
					<input type="checkbox" class="form-check-input" v-model="showPassword">
					비밀번호 확인
				</label>
			</div>
			<div class="mt-3 " align="center">
				 <a href="${root}/member/find_id">아이디 찾기</a> &nbsp; <span>/</span> &nbsp; <a href="${root}/member/find_pw">비밀번호 찾기</a>
			</div>
				<br>
			<div class="mt-3 d-grid" align="center">
				<button type="submit" class="btn btn-success btn-lg btn-block" v-bind:click="isLogin">로그인</button>
			</div>
			<br><br>
			<% if(request.getParameter("error") != null) { %>
				<div class="mt-3" align="center">
					<h3 style="color:red;">입력한 정보와 일치하는 데이터가 없습니다</h3>
				</div>
			<% } %>
		</form>
	</div>
	<br><br><br><br>
</div>
<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		
		<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    showPassword:false,
                    memberId:"",
                    memberPw:"",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                IdNullCheck(){
                    return this.memberId.length > 0;
                },
                PwNullCheck(){
                    return this.memberPw.length > 0;
                },
                
                isLogin(){
                    return this.IdNullCheck && this.PwNullCheck;
                },

                passwordInputType(){
                    return this.showPassword ? "text" : "password";
                }

            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                sendForm(e){
                    if(this.isLogin == false){
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

