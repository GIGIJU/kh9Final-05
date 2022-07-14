<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
.tagcloud {
    text-transform: uppercase;
    display: inline-block;
    padding: 4px 10px;
    margin-bottom: 7px;
    margin-right: 4px;
    border-radius: 4px;
    color: #000000;
    border: 1px solid #ccc;
    font-size: 11px;
}
</style>
<div id="app"> 
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>mypage <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>

<div class="container-fluid">
<div class="col-6 offset-3 mt-5">
<div class="row">
<h4>나의 조인 등록 현황</h4>
</div>
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
				 		<th>조인현황</th>
				 	</tr>
			 	</thead>
			 	<tbody>
	<c:forEach var="MyJoinListVO" items="${list}">
					<tr>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${MyJoinListVO.joinListVO.teeTimeT}</td>
				 		<td>${MyJoinListVO.joinListVO.fieldArea}</td>
				 		<td>${MyJoinListVO.joinListVO.fieldName}</td>
				 		<td>${MyJoinListVO.joinListVO.joinPeople}명</td>
				 		<td><fmt:formatNumber value="${MyJoinListVO.joinListVO.bookingPrice}" />원</td>
				 		<fmt:parseDate var="teeTimeD"  value="${MyJoinListVO.joinListVO.joinTime}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${MyJoinListVO.joinListVO.memberNick}</td>
				 		<c:choose>
				 			<c:when test="${MyJoinListVO.joinListVO.joinStatus==0}"><td>모집중</td></c:when>
				 			<c:otherwise><td>마감</td></c:otherwise>
				 		</c:choose>
				 	</tr>
			<c:forEach var="JoinApplyDto" items="${MyJoinListVO.joinApplyList}">
			<tr>
				<td colspan="6" style="text-align: left;">
					▷ 신청현황 : ${JoinApplyDto.joinApplyInfo}	<br>
					▷ 신청인원수 : ${JoinApplyDto.joinApplyPeople}명
					<c:if test="">
					▷ 신청인원수 : ${JoinApplyDto.joinApplyPeople}명
					</c:if>
				</td>
				<td colspan="3" style="text-align: right;">
				<c:choose>
					<c:when test="${JoinApplyDto.joinApplyStatus==0}">
						<a href="apply_approve/joinApplyNo/${JoinApplyDto.joinApplyNo}/joinApplyPeople/${JoinApplyDto.joinApplyPeople}" class="tagcloud">승인</a>
						<a href="apply_refuse/${JoinApplyDto.joinApplyNo}" class="tagcloud">거절</a>
					</c:when>
					<c:when test="${JoinApplyDto.joinApplyStatus==1}"><div class="tagcloud" style="color: #686de0;">승인완료</div></c:when>
					<c:otherwise><div class="tagcloud" style="color: #eb4d4b;">거절완료</div></c:otherwise>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
	</c:forEach> 

	</tbody>
	</table>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>