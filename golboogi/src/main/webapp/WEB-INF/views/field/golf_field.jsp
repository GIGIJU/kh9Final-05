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


<div class="row mt-5">
  <div class="col text-center">
    <div class="block-27">
      <ul>
        <li><a href="#">&lt;</a></li>
        <li class="active"><span>1</span></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">&gt;</a></li>
      </ul>
    </div>
  </div>
</div>
</div>
</section>	


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>