<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${root}/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i
							class="fa fa-chevron-right"></i></a></span> <span>Hotel <i
						class="fa fa-chevron-right"></i></span>
				</p>
				<h1 class="mb-0 bread">booking</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb">
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="pt-5 mt-5">
					<h3 class="mb-5 text-center" style="font-size: 20px; font-weight: bold;">
					${param.teeTimeD}</h3><hr>
					<ul class="comment-list">
					<c:forEach var="searchList" items="${list}">
						<li class="comment" >
							<div class="vcard bio">
								<img src="${root}/images/golf-dummy.jpg" alt="Image placeholder" height="50px">
							</div>
							<div class="comment-body">
								<h3>${searchList.fieldName}</h3>
								<div class="meta" style="font-size: 9px">지역</div>
								<p>
									<a href="#" class="reply">${searchList.teeTimeT}</a>
								</p>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>