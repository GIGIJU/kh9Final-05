<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
 <style>
    #findPw{
       text-align: center;
       font-size: 2em;
   }
</style>
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
					<p class="mb-0" style="font-size: 17px">비밀번호 찾기</p>
				</div>
			</div>
		</div>
	</section>	

<body>
    <div class="container col-12" id="app">
        <div class="mt-5 col-6 offset-3" >
            <h2 id="findPw">비밀번호 찾기</h2>
        </div>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form v-on:submit="sendForm($event)" action="find_pw" method="post">
                <div class="mt-3">
                    <label>아이디</label>
                    <input type="text" class="form-control" name="memberId" v-model="member.memberId" autocomplete="off" placeholder="영문(소),숫자 8~20자">
                	<span v-if="member.IdPass"></span>
                    <span v-if="member.IdFalse" style="color:red">다시 작성해주세요!</span>
                </div>

                <div class="mt-3">
                    <label>닉네임</label>
                    <input type="text" class="form-control" name="memberNick" v-model="member.memberNick" autocomplete="off" placeholder="한글,숫자 2~10">
                	<span v-if="member.NickPass"></span>
                    <span v-if="member.NickFalse" style="color:red">다시 작성해주세요!</span>
                </div>

                <div class="mt-3">
                    <label>전화번호</label>
                    <input type="tel" class="form-control" name="memberPhone" v-model="member.memberPhone" autocomplete="off" placeholder="-제외">
                	<span v-if="member.PhonePass"></span>
                    <span v-if="member.PhoneFalse" style="color:red">잘못된 작성입니다.</span>
                </div>

                <div class="mt-3">
                    <label>생년월일</label>
                    <input type="date" class="form-control" name="memberBirth" v-model="member.memberBirth">
                </div>

				<br>
                <div class="mt-3 d-grid" align="center">
                    <button type="submit" class="btn btn-success btn-lg btn-block" v-bind:click="member.findPw">비밀번호 찾기</button>
                </div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    member:{
                        memberId:"",
                        memberNick:"",
                        memberPhone:"",
                        memberBirth:"",

                        get IdPass(){
                            const regex = /^[a-z0-9]{8,20}$/;
                            return this.memberId.length > 0 && regex.test(this.memberId);
                         },
                        
                         get IdFalse(){
                             const regex = /^[a-z0-9]{8,20}$/;
                             return this.memberId.length > 0 && !regex.test(this.memberId);
                         },

                         get NickPass(){
                             const regex = /^[가-힣0-9]{2,10}$/;
                             return this.memberNick.length > 0 && regex.test(this.memberNick);
                         },

                         get NickFalse(){
                             const regex = /^[가-힣0-9]{2,10}$/;
                             return this.memberNick.length > 0 && !regex.test(this.memberNick);
                         },

                         get PhonePass(){
                             const regex = /^\d{11}$/;
                             return this.memberPhone.length > 0 && regex.test(this.memberPhone);
                         },

                         get PhoneFalse(){
                             const regex = /^\d{11}$/;
                             return this.memberPhone.length > 0 && !regex.test(this.memberPhone);
                         },


                        get BirthPass(){
                            return this.memberBirth.length > 0;
                        },

                        get findPw(){
                            return this.IdPass  && this.NickPass && this.PhonePass && this.BirthPass;
                        },
                    },
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{

            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                sendForm(e){
                    if(this.member.findPw == false){
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