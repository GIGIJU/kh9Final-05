<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/bg_1.jpg');"></section>
<style>
         #changePw{
            text-align: center;
            font-size: 2em;
        }
        #img{
            width:50px;
            height:50px;
        }
        #check{
            display: none;
        }
    </style>
</head>
<body>
    <div class="container col-12" id="app">
    	<br><br>
        <div class="mt-4 col-6 offset-3">
            <h2 id="changePw">비밀번호 변경</h2>
        </div>
        <br><br>
        <div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-10 offset-sm-1">
            <form v-on:submit="sendForm($event)" action="password" method="post">
                <div class="mt-3">
                    <label>현재 비밀번호</label>
                    <input v-bind:type="member.passwordInputType" class="form-control" name="memberPw" v-model="member.memberPw">
                </div>
                <div class="mt-3">
                    <label>바꿀 비밀번호</label>
                    <input v-bind:type="member.passwordInputType" class="form-control" name="changePw" v-model="member.changePw">
                    <span v-if="member.comparePwPass"></span>
                    <span v-if="member.comparePwFalse">기존 비밀번호와 동일합니다.</span>
                </div>
                <div class="mt-3">
                    <label>
                        <input type="checkbox" v-model="member.checkIcon" id="check">
                        <span v-if="member.checkedIcon"><img src="${root}/images/openEye.png" id="img"></span>
                        <span v-if="member.uncheckedIcon"><img src="${root}/images/closedEye.png" id="img"></span>
                    </label>
                </div>

                <div class="mt-3" align="center">
                    <button type="submit" class="btn btn-success btn-lg btn-block" v-bind:click="member.changePwStart">비밀번호 변경</button>
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
                        memberPw:"",
                        changePw:"",
                        checkIcon:false,
                        
                        get comparePwPass(){
                            return this.memberPw.length > 0 && this.changePw.length && this.memberPw != this.changePw;
                        },
                        
                        get comparePwFalse(){
                            return this.memberPw.length > 0 && this.changePw.length && this.memberPw == this.changePw;
                        },

                        get changePwStart(){
                            return this.comparePwPass;
                        },
                        get checkedIcon(){
                            return this.checkIcon == true;
                        },
                        
                        get uncheckedIcon(){
                            return this.checkIcon == false;
                        },
                        
                        get passwordInputType(){
                            return this.checkIcon ? "text" : "password";
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
                    if(this.member.changePwStart == false || this.comparePwFalse == true){
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