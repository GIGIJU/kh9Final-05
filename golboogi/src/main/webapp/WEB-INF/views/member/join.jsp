<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
	boolean type3 = error != null && error.equals("3");
%>	
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
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Join<i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">회원가입</p>
				</div>
			</div>
		</div>
	</section>	
    <div class="container col-12" id="app">
    	<br><br>
        <div class="mt-3" style="text-align:center;">
            <h2 id="join">회원가입</h2>
        </div>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form v-on:submit="sendForm($event)" action="join" method="post" enctype="multipart/form-data">
                <!-- 1단계 -->
               
                <div class="mt-3">
                    <label>아이디</label>
                    <input type="text" class="form-control" name="memberId" v-model="member.memberId" placeholder="영문 소문자,숫자 8자 이상" autocomplete="off">
                    <span v-if="member.IdPass">사용 가능한 아이디입니다.</span>
                    <span v-if="member.IdFalse">잘못된 작성입니다.</span>
                </div>
                <div class="mt-3">
                    <label>비밀번호</label>
                    <input type="password" class="form-control" name="memberPw" v-model="member.memberPw"  placeholder="영문 소/대, 숫자, 특수문자 8자 이상">
                    <span v-if="member.PwPass">사용 가능한 비밀번호입니다.</span>
                    <span v-if="member.PwFalse">잘못된 작성입니다.</span>
                </div>
                <div class="mt-3">
                    <label>비밀번호 확인</label>
                    <input type="password" v-model="member.checkPw" class="form-control">
                    <span v-if="member.checkPwPass">일치</span>
                    <span v-if="member.checkPwFalse">불일치!</span>
                </div>
                
                <!-- 2단계 -->
                <div v-show="member.firstClear">
                    <div class="mt-3">
                        <label>이름</label>
                        <input type="text" class="form-control is-valid" name="memberName" v-model="member.memberName" placeholder="한글 2~7자" autocomplete="off">
                        <span v-if="member.NamePass" class="valid-feedback">멋진 이름이네요!</span>
                        <span v-if="member.NameFalse" class="invalid-feedback">이름 형식이 잘못됐어요</span>
                        
                    </div>
                    <div class="mt-3">
                        <label>닉네임</label>
                        <input type="text" class="form-control is-valid" name="memberNick" v-model="member.memberNick" placeholder="한글,숫자 2~10자" autocomplete="off">
                        <span v-if="member.NickPass" class="valid-feedback">멋진 닉네임이네요!</span>
                        <span v-if="member.NickFalse" class="invalid-feedback">닉네임 형식이 잘못됐어요</span>
                    </div>
                    <div class="mt-3">
                        <label>전화번호</label>
                        <input type="tel" class="form-control" name="memberPhone" v-model="member.memberPhone" placeholder="-제외" autocomplete="off">
                        <span v-if="member.PhonePass"></span>
                        <span v-if="member.PhoneFalse">잘못된 작성입니다.</span>
                    </div>
    
                    <div class="mt-3">
                        <label>생년월일</label>
                        <input type="date" class="form-control" name="memberBirth" v-model="member.memberBirth">
                    </div>
                </div>
                
                <!-- 3단계 -->
                <div v-show="member.secondClear">
                    <div class="mt-3">
                        <label>이메일</label>
                        <input type="email" class="form-control" name="memberEmail" v-model="member.memberEmail" autocomplete="off">
                        <span v-if="member.EmailPass"></span>
                        <span v-if="member.EmailFalse">잘못된 작성입니다.</span>
                    </div>
                    <div class="mt-3">
                        <label>성별</label>
                        <select name="memberGender" v-model="member.memberGender" class="form-control">
                            <option>남</option>
				            <option>여</option>
                        </select>
                    </div>
                    <div class="mt-3">
                        <label>지역</label>
                        <input type="tel" class="form-control" name="memberLocal" v-model="member.memberLocal"  placeholder="한글 ~10자" autocomplete="off">
                    </div>
                    
                    <div class="mt-3">
				    	<label>프로필 이미지</label><br>
				    	<input type="file" name="memberProfile" class="form-control">
				    </div>
                </div>
                <br>
               <% if(type1) { %>
					<div class="mt-3" align="center">
						<h3 style="color:red;">아이디가 이미 존재합니다.</h3>
					</div>
				<% } %>
				<% if(type2) { %>
					<div class="mt-3" align="center">
						<h3 style="color:red;">닉네임이 이미 존재합니다.</h3>
					</div>
				<% } %>
				<% if(type3) { %>
					<div class="mt-3" align="center">
						<h3 style="color:red;">전화번호가 이미 존재합니다.</h3>
					</div>
				<% } %>
				<br>
                <div class="mt-3 d-grid" align="center">
                    <button type="submit" class="btn btn-success btn-lg btn-block" v-bind:click="member.isJoin">회원가입</button>
                </div>
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
                        memberPw:"",
                        checkPw:"",
                        memberName:"",
                        memberNick:"",
                        memberPhone:"",
                        memberEmail:"",
                        memberBirth:"",
                        memberGender:"",
                        memberLocal:"",

                        get IdPass(){
                           const regex = /^[a-z0-9]{8,20}$/;
                           return this.memberId.length > 0 && regex.test(this.memberId);
                        },

                        get IdFalse(){
                            const regex = /^[a-z0-9]{8,20}$/;
                            return this.memberId.length > 0 && !regex.test(this.memberId);
                        },

                        get PwPass(){
                            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@!#])[A-Za-z\d$@!#]{8,16}/;
                            return this.memberPw.length > 0 && regex.test(this.memberPw);
                        },

                        get PwFalse(){
                            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@!#])[A-Za-z\d$@!#]{8,16}/;
                            return this.memberPw.length > 0 && !regex.test(this.memberPw);
                        },

                        get checkPwPass(){
                            return this.checkPw.length > 0 && this.memberPw == this.checkPw;
                        },

                        get checkPwFalse(){
                            return this.checkPw.length && this.memberPw != this.checkPw;
                        },

                        get NamePass(){
                            const regex = /^[가-힣]{2,7}$/;
                            return this.memberName.length > 0 && regex.test(this.memberName);
                        },

                        get NameFalse(){
                            const regex = /^[가-힣]{2,7}$/;
                            return this.memberName.length > 0 && !regex.test(this.memberName);
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

                        get EmailPass(){
                            const regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                            return this.memberEmail.length > 0 && regex.test(this.memberEmail);
                        },

                        get EmailFalse(){
                            const regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                            return this.memberEmail.length > 0 && !regex.test(this.memberEmail);
                        },

                        get BirthPass(){
                            return this.memberBirth.length > 0;
                        },

                        get GenderPass(){
                            return this.memberGender.length > 0;
                        },

                        get LocalPass(){
                            const regex = /^[가-힣]{2,10}$/;
                            return this.memberLocal.length == 0 || regex.test(this.memberLocal);
                        },  

                        get firstClear(){
                            return this.IdPass && this.PwPass && this.checkPwPass;
                        },

                        get secondClear(){
                            return this.NamePass && this.NickPass && this.PhonePass && this.BirthPass ;
                        },

                        get thirdClear(){
                            return this.EmailPass && this.GenderPass && this.EmailPass;
                        },
                        
                        get isJoin(){
                            return this.thirdClear;
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
                    if(this.member.isJoin == false){
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
