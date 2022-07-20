<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                    
								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">숙소 정보 수정</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form action="stay_detail" method="post" enctype="multipart/form-data" class="form-check">
                                            <input type="hidden" value="${stayDto.stayNo}" name="stayNo">
                                            <div class="form-floating mb-5">
                                                <input name="stayName"  class="form-control" id="stayName" type="text" placeholder="1" value="${stayDto.stayName}" />
                                                <label for="stayName">숙소 이름</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="stayType" class="form-select" multiple style="height: 100px">
                                            		<c:choose>
                                            			<c:when test="${stayDto.stayType == '호텔' }">
		                                            		<option value="호텔" selected>호텔</option>
		                                            		<option value="리조트">리조트</option>
		                                            		<option value="펜션">펜션</option>
                                            			</c:when>
                                            			<c:when test="${stayDto.stayType == '리조트' }">
                                            				<option value="호텔">호텔</option>
                                            				<option value="리조트" selected>리조트</option>
		                                            		<option value="펜션">펜션</option>
                                            			</c:when>
                                            			<c:otherwise>
                                            				<option value="호텔">호텔</option>
                                            				<option value="리조트">리조트</option>
		                                            		<option value="펜션" selected>펜션</option>
                                            			</c:otherwise>
                                            		</c:choose>
                                            	</select>
                                                <label for="stayType">숙소 타입</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="stayRoom" class="form-select" multiple style="height: 70px">
                                            		<option value="4인실" selected>4인실</option>
                                            	</select>
                                                <label for="stayRoom">객실 타입</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="stayPrice"  class="form-control" id="stayPrice" type="number" placeholder="" value="${stayDto.stayPrice}"  min="0" />
                                                <label for="stayPrice">숙소 가격</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="stayPhone"  class="form-control" id="stayPhone" type="tel" placeholder="'-' 제외"  value="${stayDto.stayPhone}"  />
                                                <label for="stayPhone">숙소 대표전화</label>
                                            </div>
                                            
                                          	<div class="row mb-5" id="address">
                                            	<label for="address" class="mb-1">주소</label>
                                            	<div class="form-floating mb-2">
                                            		<div class="row">
	                                            		<div class="col-md-4">
		                                                    <div class="form-floating mb-3 mb-md-0">
		                                                        <input class="form-control" id="stayPostAddress" type="text" name="stayPostAddress" maxlength="6"  value="${stayDto.stayPostAddress}"  />
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
                                            		<input name="stayBasicAddress"  class="form-control" id="stayBasicAddress" type="tel"  value="${stayDto.stayBasicAddress}"  />
                                                	<label for="stayBasicAddress">기본 주소</label>
                                            	</div>
                                            	<div class="form-floating mb-2">
	                                            	<input name="stayDetailAddress"  class="form-control" id="stayDetailAddress" type="tel"  value="${stayDto.stayDetailAddress}"  />
	                                                <label for="stayDetailAddress">상세 주소</label>
                                            	</div>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="stayLocal" class="form-select" multiple style="height: 170px">
                                            		<c:choose>
                                            			<c:when test="${stayDto.stayLocal == '경기도' }">
                                            				<option value="경기도" selected>경기도</option>
                                            				<option value="강원도">강원도</option>
                                            				<option value="경상도">경상도</option>
                                            				<option value="전라도">전라도</option>
                                            				<option value="제주도">제주도</option>
                                            			</c:when>
                                            			<c:when test="${stayDto.stayLocal == '강원도' }">
                                            				<option value="경기도">경기도</option>
                                            				<option value="강원도" selected>강원도</option>
                                            				<option value="경상도">경상도</option>
                                            				<option value="전라도">전라도</option>
                                            				<option value="제주도">제주도</option>
                                            			</c:when>
                                            			<c:when test="${stayDto.stayLocal == '경상도' }">
                                            				<option value="경기도">경기도</option>
                                            				<option value="강원도">강원도</option>
                                            				<option value="경상도" selected>경상도</option>
                                            				<option value="전라도">전라도</option>
                                            				<option value="제주도">제주도</option>
                                            			</c:when>
                                            			<c:when test="${stayDto.stayLocal == '전라도' }">
                                            				<option value="경기도">경기도</option>
                                            				<option value="강원도">강원도</option>
                                            				<option value="경상도">경상도</option>
                                            				<option value="전라도" selected>전라도</option>
                                            				<option value="제주도">제주도</option>
                                            			</c:when>
                                            			<c:when test="${stayDto.stayLocal == '제주도' }">
                                            				<option value="경기도">경기도</option>
                                            				<option value="강원도">강원도</option>
                                            				<option value="경상도">경상도</option>
                                            				<option value="전라도" >전라도</option>
                                            				<option value="제주도" selected>제주도</option>
                                            			</c:when>
                                            			<c:otherwise>
                                            				<option value="경기도">경기도</option>
                                            				<option value="강원도">강원도</option>
                                            				<option value="경상도">경상도</option>
                                            				<option value="전라도">전라도</option>
                                            				<option value="제주도">제주도</option>
                                            			</c:otherwise>
                                            		</c:choose>
                                            	</select>
                                                <label for="stayLocal">숙소 지역</label>
                                            </div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<input type="submit" class="btn btn-primary" value="숙소 정보 수정">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<a href="${root}/admin/stay_list" class="btn btn-secondary">돌아가기</a>
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<a href="${root}/admin/stay_delete?stayNo=${stayDto.stayNo}" class="btn btn-danger">삭제하기</a>
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

<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>