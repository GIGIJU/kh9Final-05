<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<body>

 <!-- END nav -->
 
 <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root}/images/field3.jpeg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>Field<i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">Field</h1>
     </div>
   </div>
 </div>
</section>

<section class="ftco-section">
		<div class="container">
			<div class="row">
				<c:forEach var="golfFieldDto" items="${list}">
					<div class="col-md-4 ftco-animate">
						<div class="project-wrap hotel">
							<a href="detail?fieldNo=${golfFieldDto.fieldNo}" class="img"
								style="background-image: url(${root}/images/golf-dummy.jpg);">
							</a>
							<div class="text p-2">
								<h3>
									<a href="#">${golfFieldDto.fieldName}</a>
								</h3>
								<p class="location">
									<span class="fa fa-map-marker"></span>지역
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

<div class="text-center mb-4">

   <c:if test="${p > 1}">
      <c:choose>
         <c:when test="${search}">
            <a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
         </c:when>
         <c:otherwise>
            <a href="list?p=1&s=${s}">&laquo;</a>
         </c:otherwise>
      </c:choose>
   </c:if>

   <c:if test="${startBlock > 1}">
      <c:choose>
         <c:when test="${search}">
            <a
               href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
         </c:when>
         <c:otherwise>
            <a href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
         </c:otherwise>
      </c:choose>
   </c:if>

   <!-- 숫자 링크 영역 -->
   <c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
      <c:choose>
         <c:when test="${search}">
            <c:choose>
               <c:when test="${i == p}">
                  <a class="active"
                     href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:when>
         <c:otherwise>
            <c:choose>
               <c:when test="${i == p}">
                  <a class="active" href="list?p=${i}&s=${s}">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="list?p=${i}&s=${s}">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:otherwise>
      </c:choose>
   </c:forEach>

   <!-- 다음 버튼 영역 -->
   <c:if test="${endBlock < lastPage}">
      <c:choose>
         <c:when test="${search}">
            <a
               href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
         </c:when>
         <c:otherwise>
            <a href="list?p=${endBlock+1}&s=${s}">&gt;</a>
         </c:otherwise>
      </c:choose>
   </c:if>

   <c:if test="${p < lastPage}">
      <c:choose>
         <c:when test="${search}">
            <a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
         </c:when>
         <c:otherwise>
            <a href="list?p=${lastPage}&s=${s}">&raquo;</a>
         </c:otherwise>
      </c:choose>
   </c:if>

</div>


</div>
</section>	


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>