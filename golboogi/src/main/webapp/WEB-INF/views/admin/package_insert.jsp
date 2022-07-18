<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                    
								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">패키지 정보 입력</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form action="package_insert" method="post" enctype="multipart/form-data" class="form-check">
                                            
                                              <div class="form-floating mb-5">
                                            	<select name="stayNo" class="form-select" multiple style="height: 200px">
                                            		<c:forEach var="stayDto" items="${stayDto}">
	                                            		<option value="${stayDto.stayNo}">${stayDto.stayName}</option>
                                            		</c:forEach>
                                            	</select>
                                                <label for="stayNo">숙소 선택</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                            	<select name="fieldNo" class="form-select" multiple style="height: 200px">
                                            		<c:forEach var="golfFieldDto" items="${golfFieldDto}">
	                                            		<option value="${golfFieldDto.fieldNo}">${golfFieldDto.fieldName}</option>
                                            		</c:forEach>
                                            	</select>
                                                <label for="fieldNo">골프장 선택</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                            	<select name="packageBreakfast" class="form-select" multiple style="height: 80px">
                                            		<option value="1" selected>Y</option>
                                            		<option value="0">N</option>
                                            	</select>
                                                <label for="packageBreakfast">조식제공여부 선택</label>
                                            </div>
                                            
                                            <div class="form-floating mb-5">
                                                <input name="packageDepart"  class="form-control" id="packageName" type="date" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리" />
                                                <label for="packageDepart">체크인</label>
                                            </div>
                                            <div class="form-floating mb-5">
                                                <input name="packageArrive"  class="form-control" id="packageName" type="date" placeholder="영문 소문자로 시작하여 숫자를 조합한 6~20자리" />
                                                <label for="packageArrive">체크아웃</label>
                                            </div>
                                            
	                                            
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<input type="submit" class="btn btn-primary" value="패키지 정보 등록">
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
 


<jsp:include page="/WEB-INF/views/template/footer_admin.jsp"></jsp:include>