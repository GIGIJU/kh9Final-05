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
                                    
								<div class="card-header bg-success" style=" color:white;"><h3 class="text-center font-weight-light my-4">골프장 사진 추가</h3></div>
                                    
                                    <div class="card-body">
                                        
                                        <form action="field_file_update" method="post" enctype="multipart/form-data" class="form-check">
                                            <input type="hidden" name="fieldNo" value="${fieldNo}">
                                            <div class="mt-4 mb-5">
                                            	<div>골프장 사진 첨부</div>
                                            	<input name="fieldProfile" class="form-control" type="file" accept=".png, .jpg, .gif" multiple/>
                                            </div>
                                            
	                                            <div class="mt-4 mb-0">
	                                                <div class="d-grid">
	                                                	<input type="submit" class="btn btn-primary" value="골프장 사진 추가">
	                                                </div>
	                                            </div>
	                                            <div class="mt-4 mb-0">
				                                        <div class="d-grid">
				                                            <a href="${root}/admin/field_list" class="btn btn-secondary">돌아가기</a>
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