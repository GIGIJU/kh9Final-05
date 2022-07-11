<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function() {
	$(".modal").hide();
	$(".show-detail").each(function(){
		$(this).click(function() {
			$(this).next().toggle();
		});
	});
	
	$(".show-modal").each(function(){
		$(this).click(function() {
			$(this).parent().next().toggle();
		});
	});
	
});
</script>
<style>
/* 모달창 */
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 90%;
	height: 65%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal-content {
	background-color: white;
	padding: 30px 50px;
	text-align: center;
	position: relative;
	border-radius: 5px;
	width: 35em;
	height: 80%;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	max-height: 100%;
	overflow-y: auto;
}

textarea {
    width: 100%;
    height: 14em;
    text-align: left;
    font-size: 11px;
    color: black;
 }
 
 .btn-create {
    background: white;
    border: none;
    color: black;
    font-size: 11px;
}

.btn-create:hover {
    background-color: #white;
    border: none;
    color: gray;
    
}
.btn-cancel {
	background-color: white;
	border: none;
	color: black;
}
.btn-cancel:hover {
    background-color: white;
    color: gray;
}
</style>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>join <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>	
<div class="container-fluid">
	<div class="col-6 offset-3 mt-5">
		<h4>조인게시판</h4>
	<div class="row mt-4 mb-5">
			<table class="table table-hover text-center" style="font-size: 12px;">
		 		<thead>
			 		<tr>
				 		<th>날짜</th>
				 		<th>타임</th>
				 		<th>지역</th>
				 		<th>골프장</th>
				 		<th>필요인원</th>
				 		<th>인당그린피</th>
				 		<th>등록일</th>
				 		<th>등록자</th>
				 	</tr>
			 	</thead>
			 	<tbody>
			 	<c:forEach var="joinListVO" items="${list}">
				 	<tr class="show-detail">
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${joinListVO.teeTimeT}</td>
				 		<td>${joinListVO.fieldArea}</td>
				 		<td>${joinListVO.fieldName}</td>
				 		<td>${joinListVO.joinPeople}명</td>
				 		<td><fmt:formatNumber value="${joinListVO.bookingPrice}" />원</td>
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.joinTime}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${joinListVO.memberNick}</td>
				 	</tr>
			 		<tr style="display: none; text-align: left; background-color: #F2FFED;">
			 			<td colspan="4">
			 				 [ ${joinListVO.fieldName} : ${joinListVO.courseName} ]<br>
							 * ${joinListVO.joinInfo}<br>
							 
						</td>
			 			<td colspan="3" style="text-align: right;">
			 				<c:forEach var="i" begin="1" end="${4-joinListVO.joinPeople}">
			 					<img src="${root}/images/join_o.png" style="height: 40px; width: 40px; border-radius: 70%;">
			 				</c:forEach>
			 				<c:forEach var="i" begin="1" end="${joinListVO.joinPeople}">
			 					<img src="${root}/images/join_x.png" style="height: 40px; width: 40px; border-radius: 70%;">
			 				</c:forEach>
						</td>
						<td class="show-modal"><button class="btn" style="padding: 2px 2px 2px 2px; font-size: 10px;">신청하기</button></td>
			 		</tr>
			 		<div class="modal">
			 			<div class="modal-content">
							<div class="row">
								<div class="col-8 text-left">
									<h5 style="font-weight: bold;">조인 신청</h5>			
								</div>
								<div class="col-4 text-right">
									<button class="btn-cancel"><i class="fa-solid fa-xmark"></i></button>
								</div>
							</div>
							<div class="row mt-2">
								<span style="color: black; font-size: 11px;">인원 수 : </span> 
								<select name="join">
								<c:forEach var="i" begin="1" end="${joinListVO.joinPeople}">
									<option>${i}</option>
								</c:forEach>
								</select>
							</div>
							<div class="row mt-2">
								<textarea placeholder="나와 동반자를 표현하는 글을 작성해보세요" name="join"></textarea>
							</div>
							<div class="row mt-4">
							<div class="col text-center">
								<button class="btn" style="width: 50%">신청하기</button>
							</div>
						</div>
						</div>
			 		</div>
			 	</c:forEach>
			 	</tbody>
			 </table>
		</div>
		
			<div class="row mt-5 mb-5">
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
	
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>