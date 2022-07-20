<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
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
							<div class="card shadow-lg border-0 rounded-lg mt-5">
                                    
<!-- 								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">골프장 정보 입력</h3></div> -->
                                    
                                    <div class="card-body">
                                        
                                        <form action="field_detail" method="post" enctype="multipart/form-data" class="form-check">
                                            
                                            <div class="page"><!-- 페이지1 -->
                                            <div class="form-floating mb-5 card-header bg-success">
                                            	<h3 class="text-center font-weight-light my-4" style=" color:white;"> 골프장 정보 수정 (1/2)</h3>
                                            </div>
                                         
                                            <input type="hidden" name="fieldNo" value="${golfFieldDto.fieldNo }">
                                            <div class="form-floating mb-5">
                                                <input name="fieldName"  class="form-control" id="fieldName" type="text" placeholder="1" value="${golfFieldDto.fieldName}" />
                                                <label for="fieldName">골프장 이름</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<textarea class="form-control" rows=5 style="height: 100%" name="fieldInfo" id="fieldInfo" placeholder="골프장 정보 소개글을 입력해주세요 (1000자 이내)" oninput="lengthCount();">${golfFieldDto.fieldInfo} </textarea>
 												<div><span class="len">0</span> / 1000</div>				                                          
                                            	<label for="fieldInfo">소개글</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="fieldPhone"  class="form-control" id="fieldPhone" type="tel" placeholder="'-' 제외"  value="${golfFieldDto.fieldPhone}"  />
                                                <label for="fieldPhone">골프장 대표전화( - 제외 )</label>
                                            </div>
                                            
                                            <div class="row mb-5" id="address">
                                            	<label for="address" class="mb-1">주소</label>
                                            	<div class="form-floating mb-2">
                                            	
                                            		<div class="row">
	                                            		<div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="fieldPost" type="text" name="fieldPost" maxlength="6"  value="${golfFieldDto.fieldPost}"  />
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
                                            		<input name="fieldBasicAddress"  class="form-control" id="fieldBasicAddress" type="tel"  value="${golfFieldDto.fieldBasicAddress}"  />
                                                	<label for="fieldBasicAddress">기본 주소</label>
                                            	</div>
                                            	<div class="form-floating mb-2">
	                                            	<input name="fieldDetailAddress"  class="form-control" id="fieldDetailAddress" type="tel"  value="${golfFieldDto.fieldDetailAddress}"  />
	                                                <label for="fieldDetailAddress">상세 주소</label>
                                            	</div>
                                            </div>
                                            
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCaddiefee" id="fieldCaddiefee" class="form-control" type="number" value="${golfFieldDto.fieldCaddiefee}" />
                                                <label for="fieldCaddiefee">캐디피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCartfee" id="fieldCartfee" class="form-control" type="number"  value="${golfFieldDto.fieldCartfee}" />
                                                <label for="fieldCartfee">카트피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldGreenfee" id="fieldGreenfee" class="form-control" type="number"  value="${golfFieldDto.fieldGreenfee}" />
                                                <label for="fieldGreenfee">그린피</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldOpenday" id="fieldOpenday" class="form-control" type="date" value="${golfFieldDto.fieldOpenday}" /> <!-- value="today"--> 
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
                                            	<select name="fieldArea" class="form-select" multiple style="height: 170px">
                                            		<c:choose>
                                            			<c:when test="${golfFieldDto.fieldArea == '경기도'}">
	                                            			<option value="경기도" selected>경기도</option>
		                                            		<option value="강원도">강원도</option>
		                                            		<option value="전라도">전라도</option>
		                                            		<option value="경상도">경상도</option>
		                                            		<option value="제주도">제주도</option>
	                                            		</c:when>
	                                            		<c:when test="${golfFieldDto.fieldArea == '강원도'}">
	                                            			<option value="경기도" >경기도</option>
		                                            		<option value="강원도" selected>강원도</option>
		                                            		<option value="전라도">전라도</option>
		                                            		<option value="경상도">경상도</option>
		                                            		<option value="제주도">제주도</option>
	                                            		</c:when>
		                                            	<c:when test="${golfFieldDto.fieldArea == '전라도'}">	
		                                            		<option value="경기도" >경기도</option>
		                                            		<option value="강원도" >강원도</option>
		                                            		<option value="전라도" selected>전라도</option>
		                                            		<option value="경상도">경상도</option>
		                                            		<option value="제주도">제주도</option>
	                                            		</c:when >
	                                            		<c:when test="${golfFieldDto.fieldArea == '경상도'}">
	                                            			<option value="경기도" >경기도</option>
		                                            		<option value="강원도" >강원도</option>
		                                            		<option value="전라도" >전라도</option>
		                                            		<option value="경상도" selected>경상도</option>
		                                            		<option value="제주도">제주도</option>
	                                            		</c:when>
	                                            		<c:otherwise>
	                                            			<option value="경기도" >경기도</option>
		                                            		<option value="강원도" >강원도</option>
		                                            		<option value="전라도" >전라도</option>
		                                            		<option value="경상도" >경상도</option>
		                                            		<option value="제주도" selected>제주도</option>
	                                            		</c:otherwise>
	                                            			
                                            		</c:choose>
                                            	</select>
                                                <label for="fieldArea">골프장지역</label>
                                            </div>
                                            
                                            <!-- page button (1/2) -->
                                            <div class="row mt-5">
                                            	<div class="col-md-6">
		                                            <button type="button" class="btn btn-prev btn-success" disabled>이전</button>
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
	                                            
	                                            <c:forEach var="golfCourseDto" items="${golfCourseDto}">
	                                            	<input type="hidden" name="courseNo" value="${golfCourseDto.courseNo }">
	                                            	<span>* 코스</span>
		                                            <div class="form-floating mb-5">
		                                            	<input name="courseName" id="course-name" class="form-control" type="text" value=" ${golfCourseDto.courseName}" />
		                                                <label for="course-name">코스 이름</label>
		                                            </div>
		                                            
		                                            <div class="form-floating mb-5">
		                                            	<select name="courseHole" class="form-select" multiple style="height: 80px">
		                                            		<c:choose>
		                                            			<c:when test="${golfCourseDto.courseHole == '9홀' }">
				                                            		<option value="9홀">9홀</option>
				                                            		<option value="18홀" selected>18홀</option>
		                                            			</c:when>
		                                            			<c:when test="${golfCourseDto.courseHole == '18홀' }">
		                                            				<option value="9홀">9홀</option>
				                                            		<option value="18홀" selected>18홀</option>
		                                            			</c:when>
		                                            		</c:choose>
		                                            	</select>
		                                                <label for="courseHole">골프장지역</label>
		                                            </div>
	                                            </c:forEach>
	                                            
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<input type="submit" class="btn btn-primary" value="골프장 정보 수정">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<a href="${root}/admin/field_list" class="btn btn-secondary">돌아가기</a>
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<a href="${root}/admin/field_delete?fieldNo=${golfFieldDto.fieldNo}" class="btn btn-danger">삭제하기</a>
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

<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>