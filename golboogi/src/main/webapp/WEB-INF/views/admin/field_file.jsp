<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="profileUrl" value="/attachment/download?attachmentNo="></c:set>
<jsp:include page="/WEB-INF/views/template/header_admin.jsp"></jsp:include>
<style>
    textarea {
        resize: none;
    }
</style>

<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                        
                            <div class="card shadow-lg border-0 rounded-lg mt-5">

                                <div class="card-header bg-success" style=" color:white;">
                                    <h3 class="text-center font-weight-light my-4">골프장 사진 삭제</h3>
                                </div>
                                
                                <div class="card-body mt-2" >
                                <c:choose>
                                	<c:when test="${empty list}">
                                		<h1 style="text-align: center">이미지가 존재하지 않습니다.</h1>
                                	</c:when>
                                	<c:otherwise>
		                                <c:forEach var="attach" items="${list}">
		                                	<div class="mt-4 mb-0" >
		                                		<img src="${root}${profileUrl}${attach.attachmentNo}" style="width:100%; height: 200px">
		                                	</div>
		                                	 <div class="d-grid">
		                                            <a href="${root}/admin/field_file_delete?attachmentNo=${attach.attachmentNo}" class="btn btn-danger">삭제</a>
		                                     </div>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                                </div>
								<div class="card-footer text-center py-3">
                            	<div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <a href="${root}/admin/field_list" class="btn btn-primary">돌아가기</a>
                                        </div>
                                </div>
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