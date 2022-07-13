<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>

<div class="container-fluid" id="app">
	<!-- jumbotron -->
	<div class="p-4 mt-4 text-light bg-dark col-md-6 offset-md-3 rounded">
		<h1 style="color:white">골프장 관리자 아이디 생성</h1>
	</div>
	<form v-on:submit="sendForm($event)" action="insert" method="post" autocomplete="off" class="form-check" >

		<div class="row mt-3">
			<div class="col col-md-3 offset-md-3">
				<label class="form-label">아이디</label>
				<input type="text" class="form-control rounded" name="golfManagerId" v-bind:class="idClassObject"
					v-model="golfManager.golfManagerId" v-on:blur="idValidation">
				<div class="valid-feedback">멋진 아이디네요!</div>
				<div class="invalid-feedback">아이디는 영문 소문자로 시작하며 숫자와 혼합된 8~20자로 작성하세요</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col col-md-3 offset-md-3">
				<label class="form-label">비밀번호</label>
				<input type="password" class="form-control rounded" name="golfManagerPw" v-bind:class="pwClassObject"
					v-model="golfManager.golfManagerPw" v-on:blur="pwValidation">
				<div class="valid-feedback">안전한 비밀번호입니다</div>
				<div class="invalid-feedback">비밀번호는 영문 소문자,숫자 반드시 1개 이상 포함되어야 합니다</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col col-md-3 offset-md-3">
				<label class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control rounded" 
					v-bind:class="pwCheckClassObject" v-model="golfManager.golfManagerPwCheck"
					v-on:blur="pwCheckValidation">
				<div class="valid-feedback">비밀번호가 일치합니다</div>
				<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col col-md-3 offset-md-3">
				<label class="form-label">골프장 번호</label>
				<select name="fieldNo">
					<c:forEach var="golfFieldDto" items="${golfFieldDto }">
						<option selected>골프장 선택</option>
						<option value="${golfFieldDto.fieldNo}">${golfFieldDto.fieldName }</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<br>
		<div class="row mt-3">
			<div class="col col-md-2 offset-md-3">
				<button type="submit" class="btn btn-primary">아이디 생성</button>
			</div>
			<div class="col col-md-2 ml-4">
				<a href="${root}/admin/list" class="btn btn-secondary">돌아가기</a>
			</div>
		</div>
		<br>

	</form>

</div>

<script src="https://unpkg.com/vue@next"></script>
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
					golfManagerNum: "",
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