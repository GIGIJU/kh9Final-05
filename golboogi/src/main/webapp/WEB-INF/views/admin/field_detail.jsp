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
							<div class="card shadow-lg border-0 rounded-lg mt-5">
                                    
								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">골프장 정보 수정</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form action="field_detail" method="post" enctype="multipart/form-data" class="form-check">
                                            
                                            <div class="page"><!-- 페이지1 -->
                                            <div class="form-floating mb-5 card-header bg-success">
                                            	<h3 class="text-center font-weight-light my-4" style=" color:white;"> 골프장 정보 수정 (1/2)</h3>
                                            </div>
                                         
                                            
                                            <div class="form-floating mb-5">
                                                <input name="fieldName"  class="form-control" id="fieldName" type="text" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리" />
                                                <label for="fieldName">골프장 이름</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<textarea class="form-control" rows=5 style="height: 100%" name="fieldInfo" id="fieldInfo" placeholder="골프장 정보 소개글을 입력해주세요 (1000자 이내)" oninput="lengthCount();"></textarea>
 												<div><span class="len">0</span> / 1000</div>				                                          
                                            	<label for="fieldInfo">소개글</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="fieldPhone"  class="form-control" id="fieldPhone" type="tel" placeholder="'-' 제외" />
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
	                                            	<input name="fieldDetailAddress"  class="form-control" id="fieldDetailAddress" type="tel" />
	                                                <label for="fieldDetailAddress">상세 주소</label>
                                            	</div>
                                            </div>
                                            
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCaddiefee" id="fieldCaddiefee" class="form-control" type="number" min="0"/>
                                                <label for="fieldCaddiefee">캐디피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldCartfee" id="fieldCartfee" class="form-control" type="number" min="0"/>
                                                <label for="fieldCartfee">카트피</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<input name="fieldGreenfee" id="fieldGreenfee" class="form-control" type="number" min="0"/>
                                                <label for="fieldGreenfee">그린피</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<input name="fieldOpenday" id="fieldOpenday" class="form-control" type="date" value="today"/>
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
                                            
                                            <div class="page"><!-- 페이지2 -->
	                                            <div class="form-floating mb-5 card-header bg-success">
	                                            	<h3 class="text-center font-weight-light my-4" style=" color:white;"> 골프장 정보 입력 (2/2)</h3>
	                                            </div>
	                                            
	                                            <div class="form-floating mb-5">
	                                            	<input name="courseName" id="courseName" class="form-control" type="text"/>
	                                                <label for="courseName">코스 이름</label>
	                                            </div>
	                                            
	                                            <div class="form-floating mb-5">
	                                            	<select name="courseHole" class="form-select" multiple style="height: 80px">
	                                            		<option value="9홀">9홀</option>
	                                            		<option value="18홀">18홀</option>
	                                            	</select>
	                                                <label for="courseHole">골프장지역</label>
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