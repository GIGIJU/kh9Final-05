<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
<style>
textarea{
	resize: none;
}
</style>
<script type="text/javascript">
$(function(){
	//코스 빼기 버튼 숨기기
	$(".btn-delCourse").hide();
	
	//코스 함수
	function addCourse(courseNum) {
		var div = $("<div>").attr('class', 'course'+courseNum);
		var h6 = $("<hr><br><h6>* 코스"+courseNum+"</h6>");
			var content = $('<div class="form-floating mb-5">\
					<input name="courseName" id="course-name" class="form-control" type="text"/>\
					<label for="course-name">코스 이름</label></div>\
					<div class="form-floating mb-5"><select name="courseHole" class="form-select" multiple style="height: 80px">\
					<option value="9홀">9홀</option><option value="18홀">18홀</option></select>\
					<label for="courseHole">골프장지역</label></div>');
					
		div.append(h6).append(content);
		$("#add-course").append(div);
		$(".btn-delCourse").show();
	}

	courseNum = 2;
	//코스 추가버튼 클릭 시 내용 추가
	$(".btn-addCourse").click(function() {
		addCourse(courseNum);
		courseNum++;
	});

	//추가한 코스 삭제
	$(".btn-delCourse").click(function(){
		courseNum--;
		$("#add-course").children(".course"+courseNum).remove();
		if(courseNum==2){
			$(".btn-delCourse").hide();
		}
	});	
	
});
</script>
<body  class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5" id="app">
                                    
<!-- 								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">골프장 정보 입력</h3></div> -->
                                    
                                    <div class="card-body">
                                        
                                        <form v-on:submit="sendForm($event)" action="field_insert" method="post" enctype="multipart/form-data" class="form-check">
                                            
                                            <div class="page"><!-- 페이지1 -->
                                            <div class="form-floating mb-5 card-header bg-success">
                                            	<h3 class="text-center font-weight-light my-4" style=" color:white;"> 골프장 정보 입력 (1/2)</h3>
                                            </div>
                                         
                                            
                                            <div class="form-floating mb-5">
                                                <input name="fieldName"  class="form-control" v-model="fieldName" id="fieldName" type="text" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리" />
                                                <label for="fieldName">골프장 이름</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<textarea class="form-control" rows=5 style="height: 100%" v-model="fieldInfo" name="fieldInfo" id="fieldInfo" placeholder="골프장 정보 소개글을 입력해주세요 (1000자 이내)" oninput="lengthCount();"></textarea>
 												<div><span class="len">0</span> / 1000</div>				                                          
                                            	<label for="fieldInfo">소개글</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="fieldPhone"  class="form-control" v-model="fieldPhone" id="fieldPhone" type="tel" placeholder="'-' 제외" />
                                                <label for="fieldPhone">골프장 대표전화( - 제외 )</label>
                                            </div>
                                            
                                            <div class="row mb-5" id="address">
                                            	<label for="address" class="mb-1">주소</label>
                                            	<div class="form-floating mb-2">
                                            	
                                            		<div class="row">
	                                            		<div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="fieldPost" type="text" name="fieldPost" maxlength="6" />
		                                                        <label for="fieldPost">우편번호</label>
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
                                            		<input name="fieldBasicAddress"  class="form-control" id="fieldBasicAddress" type="tel"  />
                                                	<label for="fieldBasicAddress">기본 주소</label>
                                            	</div>
                                            	<div class="form-floating mb-2">
	                                            	<input name="fieldDetailAddress" class="form-control" id="fieldDetailAddress" type="tel" />
	                                                <label for="fieldDetailAddress">상세 주소</label>
                                            	</div>
                                            </div>
                                            
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCaddiefee" v-model="fieldCaddiefee" id="fieldCaddiefee" class="form-control" type="number" min="0"/>
                                                <label for="fieldCaddiefee">캐디피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCartfee" v-model="fieldCartfee" id="fieldCartfee" class="form-control" type="number" min="0"/>
                                                <label for="fieldCartfee">카트피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldGreenfee" v-model="fieldGreenfee" id="fieldGreenfee" class="form-control" type="number" min="0"/>
                                                <label for="fieldGreenfee">그린피</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldOpenday" v-model="fieldOpenday" id="fieldOpenday" class="form-control" type="date" value="today"/>
                                                <label for="fieldOpenday">개장일</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="fieldPrepay" class="form-select" >
                                            		<option value="1" selected>Y</option>
                                            		<option value="0">N</option>
                                            	</select>
                                                <label for="fieldPrepay">선결제여부</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="fieldArea" class="form-select" v-model="fieldArea" multiple style="height: 170px">
                                            		<option value="경기도">경기도</option>
                                            		<option value="강원도">강원도</option>
                                            		<option value="전라도">전라도</option>
                                            		<option value="경상도">경상도</option>
                                            		<option value="제주도">제주도</option>
                                            	</select>
                                                <label for="fieldArea">골프장지역</label>
                                            </div>
                                            
                                            <div class="mt-4 mb-5">
                                            	<div>골프장 이미지 첨부</div>
                                            	<input name="fieldProfile" class="form-control" type="file" accept=".png, .jpg, .gif" multiple/>
                                            </div>
                                            
                                            <!-- page button (1/2) -->
                                            <div class="row mt-5">
                                            	<div class="col-md-6">
		                                            <button type="button" class="btn btn-prev btn-success">이전</button>
                                            	</div>
                                            	<div class="col-md-6" >
		               								<button type="button" class="btn btn-next btn-success" style="float: right;">다음</button>
                                            	</div>
                                            </div>
	                                            
                                            </div><!-- 페이지1 -->
                                            
                                            <!-- 페이지2 -->
                                            <div class="page">
	                                            <div class="form-floating mb-5 card-header bg-success">
	                                            	<h3 class="text-center font-weight-light my-4" style=" color:white;"> 코스 정보 입력 (2/2)</h3>
	                                            </div>
	                                            
	                                            <span>* 코스1</span>
	                                            <div class="form-floating mb-5">
	                                            	<input name="courseName" id="course-name" v-model="courseName" class="form-control" type="text"/>
	                                                <label for="course-name">코스 이름</label>
	                                            </div>
	                                            
	                                            <div class="form-floating mb-5">
	                                            	<select name="courseHole" class="form-select" v-model="courseHole" multiple style="height: 80px">
	                                            		<option value="9홀">9홀</option>
	                                            		<option value="18홀">18홀</option>
	                                            	</select>
	                                                <label for="courseHole">골프장지역</label>
	                                            </div>
												<div id="add-course"></div>
	                                            <div class="row">
		                                            <div class="col-md-12" style="text-align: right;">
														<a class="btn-delCourse"><i class="fa-solid fa-minus"></i></a>
														<a class="btn-addCourse"><i class="fa-solid fa-plus"></i></a>
		                                            </div>
												</div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<input type="submit" class="btn btn-primary" value="골프장 정보 등록">
	                                                </div>
	                                            </div>
	                                            
	                                            <!-- page button (2/2) -->
	                                            <div class="row mt-5">
	                                            	<div class="col-md-6">
			                                            <button type="button" class="btn btn-prev btn-success">이전</button>
	                                            	</div>
	                                            	<div class="col-md-6" >
			               								<button type="button" class="btn btn-next btn-success" style="float: right;" disabled>다음</button>
	                                            	</div>
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
 
<!-- 골프장 오픈일 '오늘'로 자동 계산 -->
<script type="text/javascript">
	$(document).ready(function(){
		var now = new Date();
	    var month = (now.getMonth() + 1);               
	    var day = now.getDate();
	    if (month < 10) 
	        month = "0" + month;
	    if (day < 10) 
	        day = "0" + day;
	    var today = now.getFullYear() + '-' + month + '-' + day;
	    $('#fieldOpenday').val(today);
	});
</script>
<!-- 골프장 소개 글자 수 검사 -->
<script type="text/javascript">
        function lengthCount(){
            //준비
            var textarea = document.querySelector("textarea[name=fieldInfo]");
            var span = document.querySelector(".len");

            //처리
            var text = textarea.value;
            var count = text.length;

            //출력
            span.textContent = count;
            if(count > 1000){
                span.style.color = "red";
            }
            else {
                span.style.color = "black";
            }
        }
</script>

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
                    $("input[name=fieldPost]").val(data.zonecode);
                    //document.getElementById("sample6_address").value = addr;
                    $("input[name=fieldBasicAddress]").val(addr);

                    // 커서를 상세주소 필드로 이동한다.
                    //document.getElementById("sample6_detailAddress").focus();
                    $("input[name=fieldDetailAddress]").focus();
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

<!-- 골프장 입력 멀티 페이지 -->
<script type="text/javascript">
	$(function(){
		var index = 0;

		//처음 페이지를 제외하고 모두 숨김 처리
		move(index);

		//다음 버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function(){
			move(++index);
		});

		//이전 버튼을 누르면 이전 페이지가 나오도록 구현
		$(".btn-prev").not(":first").click(function(){
			move(--index);
		});

		function move(index){
			$(".page").hide();
			$(".page").eq(index).show();
			var percent = (index+1) * 100 / 4;
			$(".percent").css("width", percent+"%");
		}
	});
</script>
<!-- <script src="https://unpkg.com/vue@next"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/3.2.37/vue.cjs.min.js" integrity="sha512-4ztiRs4Iu216VkGake07ojPy+Jp5LpaRV8WgGblQIZj/6O3st4NYucCsWKZ/RWyoBgJu941+PXBFnqgVAaDPgw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                   fieldName:"",
                   fieldInfo:"",
                   fieldPhone:"",
                   fieldCaddiefee:"",
                   fieldCartfee:"",
                   fieldGreenfee:"",
                   fieldOpenday:"",
                   fieldArea:"",

                   courseName:"",
                   courseHole:"",

                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                fieldNameNull(){
                    return this.fieldName.length > 0;
                },
                fieldInfoNull(){
                    return this.fieldInfo.length > 0;
                },
                fieldPhoneCheck(){
                    const regex = /^[0][0-9]{8,12}$/;
                    return this.fieldPhone.length > 0 && regex.test(this.fieldPhone);
                },
                fieldCaddiefeeNull(){
                    return this.fieldCaddiefee.length != 0;
                },
                fieldCartfeeNull(){
                    return this.fieldCartfee.length != 0;
                },
                fieldGreenfeeNull(){
                    return this.fieldGreenfee.length != 0;
                },
                fieldOpendayNull(){
                    return this.fieldOpenday.length > 0;
                },
                fieldAreaNull(){
                    return this.fieldArea.length > 0;
                },

                courseNameNull(){
                    return this.courseName.length > 0;
                },
                courseHoleNull(){
                    return this.courseHole.length > 0;
                },

                clear1(){
                    return this.fieldNameNull && this.fieldInfoNull && this.fieldPhoneCheck &&
                        this.fieldCaddiefeeNull && this.fieldCartfeeNull && this.fieldGreenfeeNull &&
                        this.fieldOpendayNull && this.fieldAreaNull;
                },

                clear2(){
                    return this.clear1 && this.courseNameNull && this.courseHoleNull;
                }
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                sendForm(e){
                    if(this.clear2 == false){
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