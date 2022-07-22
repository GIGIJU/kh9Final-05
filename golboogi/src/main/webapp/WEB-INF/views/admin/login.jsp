<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="hero-wrap-custom" style="background-color:black;">
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 250px;">
            <div class="col-md-9 ftco-animate pb-5 text-center">
            </div>
        </div>
    </div>
</section>

<div class="container mt-5" id="app"><br>
<div class="col-md-6 offset-md-3 text-center">
    <!-- jumbotron -->
    <div class="p-3 text-light bg-dark rounded">
        <h2 style="color:white;">관리자 로그인</h2>
    </div>
    <section class="ftco-section contact-section ftco-no-pt">
           <div class="order-md-last d-flex">
               <form v-on:submit="sendForm($event)" action="login" method="post" class="bg-light p-5 contact-form">
                   <div class="form-group">
                       <input type="text" name="golfManagerId" v-model="golfManagerId" class="form-control" placeholder="ID" >
                   </div>
                   <div class="form-group">
                       <input v-bind:type="passwordInputType" name="golfManagerPw" v-model="golfManagerPw" class="form-control" placeholder="Password" >
                   </div>
                   <div class="form-group">
                    <label>비밀번호 표시
                    		<input type="checkbox" id="check" class="form-control" v-model="showPassword" style="display:none;">
                    		<i v-if="showPassword" class="fa-solid fa-eye"> </i>
                    		<i v-if="!showPassword" class="fa-solid fa-eye-slash"> </i>
                    </label>
                   </div>
                   <div class="form-group">
                       <input type="submit" value="로그인" class="btn btn-primary py-3 px-5" v-bind:click="isLogin" style="width: 100%; font-size: 14px;">
                   </div>
                   <c:if test="${param.error != null}">
						<div class="row center">
							<h3 style="color:red;">입력한 정보와 일치하는 데이터가 없습니다</h3>
						</div>
					</c:if>
               </form>
        </div>
    </section>
  </div>
</div>
<!--     <script src="https://unpkg.com/vue@next"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/3.2.37/vue.cjs.min.js" integrity="sha512-4ztiRs4Iu216VkGake07ojPy+Jp5LpaRV8WgGblQIZj/6O3st4NYucCsWKZ/RWyoBgJu941+PXBFnqgVAaDPgw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    showPassword: false,
                    golfManagerId: "",
                    golfManagerPw: "",
                };
            },
            computed: {
                IdNullCheck() {
                    return this.golfManagerId.length > 0;
                },
                PwNullCheck() {
                    return this.golfManagerPw.length > 0;
                },
                isLogin() {
                    return this.IdNullCheck && this.PwNullCheck;
                },
                passwordInputType() {
                    return this.showPassword ? "text" : "password";
                }

            },
            methods: {
                sendForm(e) {
                    if (this.isLogin == false) {
                        e.preventDefault();
                    }
                },
            },
            
        });
        app.mount("#app");
    </script>
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>