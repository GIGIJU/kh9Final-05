<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
<script>
	/*
		프론트엔드 암호화에 대한 계획
		- 암호화 알고리즘은 상황에 맞게 선택
		- input[type=password] 형태의 컬럼을 찾아서 전송 전에 암호화한 값으로 교체
	*/
	$(function(){
		$("form").submit(function(){
			//this == form
			$(this).find("input[type=password]").each(function(){
				//this == 입력창
				var rawData = $(this).val();
				//var encData = 암호화(rawData);
				var hash = CryptoJS.SHA1(rawData);//암호화
				var encData = CryptoJS.enc.Hex.stringify(hash);//문자열화
				$(this).val(encData);
			});
		});
	});
</script>
<body id="app" class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    
                                    <div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">골프장 관리자 생성</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form v-on:submit="sendForm($event)" action="insert" method="post" autocomplete="off" class="form-check">
                                            
                                            <div class="form-floating mb-5">
                                                <input class="form-control" id="inputId" type="text" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리"
                                                name="golfManagerId" v-bind:class="idClassObject" v-model="golfManager.golfManagerId" v-on:blur="idValidation"
                                                 />
                                                <label for="inputId">골프장 관리자 아이디</label>
                                                <div class="valid-feedback">멋진 아이디네요!</div>
												<div class="invalid-feedback">아이디는 영문 소문자로 시작하며 숫자와 혼합된 8~20자로 작성하세요</div>
                                            </div>
                                            
                                            <div class="row mb-5">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" type="password" placeholder="영문 소문자와 숫자가 혼합된 8자리" 
                                                        name="golfManagerPw" v-bind:class="pwClassObject" v-model="golfManager.golfManagerPw" v-on:blur="pwValidation"/>
                                                        <label for="inputPassword">비밀번호</label>
                                                        <div class="valid-feedback">안전한 비밀번호입니다</div>
														<div class="invalid-feedback">비밀번호는 영문 소문자,숫자 반드시 1개 이상 포함되어야 합니다</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="영문 소문자와 숫자가 혼합된 8자리" 
                                                        v-bind:class="pwCheckClassObject" v-model="golfManager.golfManagerPwCheck" v-on:blur="pwCheckValidation"/>
                                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                                        <div class="valid-feedback">비밀번호가 일치합니다</div>
														<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>	
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="fieldNo" class="form-select" size="3" aria-label="size 3 select example" style="height:400px;">
                                            		<c:forEach var="golfFieldDto" items="${golfFieldDto}">
                                            			<option value="${golfFieldDto.fieldNo}">${golfFieldDto.fieldName}</option>
                                            		</c:forEach>
                                            	</select>
                                            </div>
                                            
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<input type="submit" class="btn btn-primary" value="관리자 등록">
                                                </div>
                                            </div>
                                            
                                        </form>
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="field/insert">골프장 생성하기</a></div>
                                        <div class="small">※골프장을 먼저 생성해야 계정을 등록할 수 있습니다.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
		</div>
</body>

<!-- <script src="https://unpkg.com/vue@next"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/3.2.37/vue.cjs.min.js" integrity="sha512-4ztiRs4Iu216VkGake07ojPy+Jp5LpaRV8WgGblQIZj/6O3st4NYucCsWKZ/RWyoBgJu941+PXBFnqgVAaDPgw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	//div[id=app]을 제어할 수 있는 Vue instance를 생성
	const app = Vue.createApp({
		//data : 화면을 구현하는데 필요한 데이터를 작성한다.
		data() {
			return {
				golfManager: {
					golfManagerId: "",
					golfManagerPw: "",
					golfManagerPwCheck: "",
// 					golfManagerNum: "",
					get idValid() {
						const regex = /^[a-z][a-z0-9]{7,19}$/;
						return regex.test(this.golfManagerId);
					},
					get pwValid() {
						const regex = /^([a-z]+)([0-9]+)$/;
						return regex.test(this.golfManagerPw);
					},
					get pwCheckValid() {
						return this.golfManagerPw == this.golfManagerPwCheck;
					},
// 					get numValid() {
// 						const regex = /^(\d){1,}$/;
// 						return regex.test(this.golfManagerNum);
// 					},
					
					get allValid(){
	                    return this.idValid && this.pwValid && this.pwCheckValid /*&& this.numValid*/;
	                },

				},

				idClassObject: {
					'is-valid': false,
					'is-invalid': false,
				},
				pwClassObject: {
					'is-valid': false,
					'is-invalid': false,
				},
				pwCheckClassObject: {
					'is-valid': false,
					'is-invalid': false,
				},
// 				numClassObject: {
// 					'is-valid': false,
// 					'is-invalid': false,
// 				},
				
			};
		},
		//computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
		// - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
		computed: {

		},
		//methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
		methods: {
			idValidation() {
				this.idClassObject["is-valid"] = this.golfManager.idValid;
				this.idClassObject["is-invalid"] = !this.golfManager.idValid;
			},
			pwValidation() {
				this.pwClassObject["is-valid"] = this.golfManager.pwValid
				this.pwClassObject["is-invalid"] = !this.golfManager.pwValid;
			},
			pwCheckValidation() {
				this.pwCheckClassObject["is-valid"] = this.golfManager.pwCheckValid
				this.pwCheckClassObject["is-invalid"] = !this.golfManager.pwCheckValid;
			},
// 			numValidation() {
// 				this.numClassObject["is-valid"] = this.golfManager.numValid;
// 				this.numClassObject["is-invalid"] = !this.golfManager.numValid;
// 			},
			sendForm(e){
                if(this.golfManager.allValid == false){
                    e.preventDefault();
                }
            },
		},
	});
	app.mount("#app");
</script>





<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>