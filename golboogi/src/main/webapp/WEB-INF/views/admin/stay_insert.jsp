<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
<style>
textarea{
	resize: none;
}
</style>
<body  class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5" id="app">
                                    
								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">숙소 정보 입력</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form v-on:submit="sendForm($event)" action="stay_insert" method="post" enctype="multipart/form-data" class="form-check">
                                            
                                            <div class="form-floating mb-5">
                                                <input name="stayName" v-model="stayName" class="form-control" id="stayName" type="text" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리" />
                                                <label for="stayName">숙소 이름</label>
                                            </div>
                                            
                                             <div class="form-floating mb-5">
                                            	<select name="stayType" v-model="stayType" class="form-select" multiple style="height: 100px">
                                            		<option value="리조트">리조트</option>
										       		<option value="호텔">호텔</option>
										       		<option value="펜션">펜션</option>
                                            	</select>
                                                <label for="stayType">숙소 타입</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
										        <select name="stayRoom" class="form-select" multiple style="height: 60px">
										       		<option value="4인1실" selected>4인실</option>
										       	</select>
										       	 <label for="stayRoom">객실 타입</label>
										    </div>
										    
                                            <div class="form-floating mb-5">
                                                <input name="stayPrice" v-model="stayPrice"  class="form-control" id="stayPrice" type="number" placeholder="'-' 제외"  min="0" />
                                                <label for="stayPrice">숙소 가격</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="stayPhone" v-model="stayPhone" class="form-control" id="stayPhone" type="tel" placeholder="'-' 제외" />
                                                <label for="stayPhone">숙소 대표전화( - 제외 )</label>
                                            </div>
                                            
                                            <div class="row mb-5" id="address">
                                            	<label for="address" class="mb-1">주소</label>
                                            	<div class="form-floating mb-2">
                                            	
                                            		<div class="row">
	                                            		<div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" v-model="stayPostAddress" id="stayPostAddress" type="text" name="stayPostAddress" maxlength="6" placeholder="d"/>
		                                                        <label for="stayPostAddress">우편번호</label>
		                                                    </div>
		                                                </div>
		                                                <div class="col-md-4">
		                                                    <div class="form-floating mt-2 mb-3 mb-md-0">
		                                                        <a class="btn btn-primary" id="address-find-btn">검색</a>
		                                                    </div>
		                                                </div>
                                            		</div>
                                            		
                                            	</div>
                                            	<div class="form-floating mb-2">
                                            		<input name="stayBasicAddress" v-model="stayBasicAddress" class="form-control" id="stayBasicAddress" type="text" placeholder="d" />
                                                	<label for="stayBasicAddress">　기본 주소</label>
                                            	</div>
                                            	<div class="form-floating mb-2">
	                                            	<input name="stayDetailAddress" v-model="stayDetailAddress" class="form-control" id="stayDetailAddress" type="text" placeholder="d" />
	                                                <label for="stayDetailAddress">　상세 주소</label>
                                            	</div>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="stayLocal" v-model="stayLocal" class="form-select" multiple style="height: 160px">
                                            		<option value="경기도">경기도</option>
										       		<option value="강원도">강원도</option>
										       		<option value="전라도">전라도</option>
										       		<option value="경상도">경상도</option>
										       		<option value="제주도">제주도</option>
                                            	</select>
                                                <label for="stayLocal">숙소 지역</label>
                                            </div>
                                            
                                            <div class="mt-4 mb-5">
                                            	<div>숙소 이미지 첨부</div>
                                            	<input name="stayProfile" class="form-control" type="file" accept=".png, .jpg, .gif" multiple/>
                                            </div>
                                            
	                                            
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<input type="submit" class="btn btn-primary" value="숙소 정보 등록">
                                                </div>
                                            </div>
                                            
                                        </form>
                                        
                                    </div>
                                    
                                    <div class="card-footer text-center py-3">
                                    <!-- 카드 푸터  -->
                                    </div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
 

<!-- 다음 주소 검색 API -->
<script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('sample6_postcode').value = data.zonecode;
                    $("input[name=stayPostAddress]").val(data.zonecode);
                    //document.getElementById("sample6_address").value = addr;
                    $("input[name=stayBasicAddress]").val(addr);

                    // 커서를 상세주소 필드로 이동한다.
                    //document.getElementById("sample6_detailAddress").focus();
                    $("input[name=stayDetailAddress]").focus();
                }
            }).open();
        }
</script>

<!-- 주소 검색 버튼 이벤트 -->
<script type="text/javascript">
        $(function(){
//             $(".address-find-btn").click(findAddress);
            $("#address-find-btn").click(findAddress);
        });
</script>
<!--  <script src="https://unpkg.com/vue@next"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/3.2.37/vue.cjs.min.js" integrity="sha512-4ztiRs4Iu216VkGake07ojPy+Jp5LpaRV8WgGblQIZj/6O3st4NYucCsWKZ/RWyoBgJu941+PXBFnqgVAaDPgw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                   stayName:"",
                   stayType:"",
                   stayPrice:"",
                   stayPhone:"",
                   stayPostAddress:"",
                   stayBasicAddress:"",
                   stayDetailAddress:"",
                   stayLocal:"",

                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                stayNameNull(){
                    return this.stayName.length > 0;
                },
                stayTypeNull(){
                    return this.stayType.length > 0;
                },
                stayPriceNull(){
                    return this.stayPrice != 0;
                },
                stayPhoneCheck(){
                    const regex =  /^\d{2,3}-\d{3,4}-\d{4}$/;
                    return this.stayPhone.length > 0 && regex.test(this.stayPhone);
                },
                stayBasicAddressNull(){
                    return this.stayBasicAddress.length > 0;
                },
                stayDetailAddressNull(){
                    return this.stayDetailAddress.length > 0;
                },
                stayLocalNull(){
                    return this.stayLocal.length > 0;
                },

                clear(){
                    return this.stayNameNull && this.stayTypeNull &&
                        this.stayPriceNull && this.stayPhoneCheck && this.stayBasicAddressNull &&
                        this.stayDetailAddressNull && this.stayLocalNull;
                },
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                sendForm(e){
                    if(this.clear == false){
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

<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>