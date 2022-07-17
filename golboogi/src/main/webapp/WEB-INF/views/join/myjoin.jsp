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
.place_round_btn_container button{padding: 5px 8px; text-decoration: none; display: inline-block; cursor: pointer; font-size: 13px;}
.place_round_btn_container button:first-child{color: #000; background: #fff; border: 2px solid #000; margin-left: 5px;}
.place_round_btn_container button:last-child{color: #fff; background: #000; border: 2px solid #000; margin-left: 5px;}
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
<div class="col-6 offset-3 mt-2 text-center">
	<div class="place_round_btn_container">
		<button @click="clickRegist">조인 등록 내역</button>
		<button @click="clickApply">조인 신청 내역</button>
	</div>
</div>

<!-- 조인 등록 현황 -->
<div class="container-fluid" v-if="showRegist">
<div class="col-6 offset-3 mt-5 mb-5">
<div class="row ml-2">
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
		 		<th>조인현황</th>
		 		<th>수정/삭제</th>
		 	</tr>
	 	</thead>
	 	<tbody>
	 	 	<c:if test="${joinList.isEmpty()}">
	 	 	<tr><td colspan="9">
	 	 	<img src="https://image.smartscore.kr/pc4/no-round.svg">
	 	 	<br><span style="font-size: 15px;">조인 등록 내역이 없습니다.</span>
	 	 	</td></tr>
 			</c:if>
			<c:forEach var="MyJoinListVO" items="${joinList}">
			<tr>
		 		<fmt:parseDate var="teeTimeD"  value="${MyJoinListVO.joinListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
			 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
		 		<td>${MyJoinListVO.joinListVO.teeTimeT}</td>
		 		<td>${MyJoinListVO.joinListVO.fieldArea}</td>
		 		<td>${MyJoinListVO.joinListVO.fieldName}</td>
		 		<td>${MyJoinListVO.joinListVO.joinPeople}명</td>
		 		<td><fmt:formatNumber value="${MyJoinListVO.joinListVO.bookingPrice}" />원</td>
		 		<fmt:parseDate var="joinDate"  value="${MyJoinListVO.joinListVO.joinTime}" pattern="yyyy-MM-dd"/>
			 	<td><fmt:formatDate value="${joinDate}" pattern="MM/dd"/></td>
		 		<c:choose>
		 			<c:when test="${MyJoinListVO.joinListVO.joinStatus==0}"><td>모집중</td></c:when>
		 			<c:otherwise><td>마감</td></c:otherwise>
		 		</c:choose>
		 		<td>
		 		<span style="cursor: pointer;"><i class="fa-solid fa-pen-to-square"></i></span>
		 		<span @click="joinDelete(${MyJoinListVO.joinListVO.joinNo})" style="cursor: pointer;">&nbsp;<i class="fa-solid fa-trash"></i></span>
		 		</td>
		 	</tr>
			<c:forEach var="JoinApplyListVO" items="${MyJoinListVO.joinApplyList}">
			<tr>
				<td colspan="1"><i class="fa-solid fa-arrow-turn-up" style="transform: rotateZ(90deg);"></i></td>
				<td colspan="1"><img src="/attachment/download?attachmentNo=${JoinApplyListVO.memberProfile}" style="width: 50px; height: 50px; border-radius: 100%;"></td>
				<td colspan="6" style="text-align: left;">
					<ul style="margin-bottom: 0;">
						<li>신청자 : ${JoinApplyListVO.memberNick}</li>
						<li>신청내용 : ${JoinApplyListVO.joinApplyInfo}</li>
						<li>신청인원수 : ${JoinApplyListVO.joinApplyPeople}명</li>
						<c:if test="${JoinApplyListVO.joinApplyStatus==1}">
							<li>전화번호 : ${JoinApplyListVO.memberPhone}</li>
							<li>성별 : ${JoinApplyListVO.memberGender}</li>
						</c:if>
					</ul>
				</td>
				<td colspan="2" style="text-align: right;">
				<c:choose>
					<c:when test="${JoinApplyListVO.joinApplyStatus==0}">
						<a href="apply_approve/joinApplyNo/${JoinApplyListVO.joinApplyNo}/joinApplyPeople/${JoinApplyListVO.joinApplyPeople}" class="tagcloud">승인</a>
						<a href="apply_refuse/${JoinApplyListVO.joinApplyNo}" class="tagcloud">거절</a>
					</c:when>
					<c:when test="${JoinApplyListVO.joinApplyStatus==1}"><div class="tagcloud" style="color: #686de0;">승인완료</div></c:when>
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

<!-- 조인 신청 현황 -->
<div class="container-fluid" v-if="showApply">
<div class="col-6 offset-3 mt-5 mb-5">
<div class="row ml-2">
<h4>나의 조인 신청 현황</h4>
</div>
	<table class="table table-hover text-center" style="font-size: 12px;">
 		<thead>
	 		<tr>
		 		<th>날짜</th>
		 		<th>타임</th>
		 		<th>골프장</th>
		 		<th>내용</th>
		 		<th>인당그린피</th>
		 		<th>등록자</th>
		 		<th>조인현황</th>
		 	</tr>
	 	</thead>
	 	<tbody>
	 		<c:if test="${joinApplyList.isEmpty()}">
		 	 	<tr><td colspan="9">
		 	 	<img src="https://image.smartscore.kr/pc4/no-round.svg">
		 	 	<br><span style="font-size: 15px;">조인 신청 내역이 없습니다.</span>
		 	 	</td></tr>
	 		</c:if>
		<c:forEach var="MyJoinApplyListVO" items="${joinApplyList}">
			<tr>
		 		<td>${MyJoinApplyListVO.teeTimeD}</td>
		 		<td>${MyJoinApplyListVO.teeTimeT}</td>
		 		<td>${MyJoinApplyListVO.fieldName}</td>
		 		<td>${MyJoinApplyListVO.joinInfo}</td>
		 		<td><fmt:formatNumber value="${MyJoinApplyListVO.bookingPrice}"/></td>
		 		<td>${MyJoinApplyListVO.memberNick}</td>
 				<c:choose>
		 			<c:when test="${joinListVO.joinStatus==0}"><td>모집중</td></c:when>
		 			<c:otherwise><td>마감</td></c:otherwise>
		 		</c:choose>
		 	</tr>
		 	<tr>
		 		<td><i class="fa-solid fa-arrow-turn-up" style="transform: rotateZ(90deg);"></i></td>
				<td colspan="4" class="text-left">
		 			${MyJoinApplyListVO.joinApplyInfo}(신청인원 ${MyJoinApplyListVO.joinApplyPeople}명)
		 		</td>
				<td><c:if test="${MyJoinApplyListVO.joinApplyStatus==1}"><span style="font-weight: 500;">방장연락처<br>
				 ${MyJoinApplyListVO.joinWriterPhone}</span></c:if></td>
		 		<td>
		 		<c:choose>
					<c:when test="${MyJoinApplyListVO.joinApplyStatus==0}">
						<div class="tagcloud" style="color: black;">승인대기</div>
					</c:when>
					<c:when test="${MyJoinApplyListVO.joinApplyStatus==1}"><div class="tagcloud" style="color: #686de0;">승인됨</div></c:when>
					<c:otherwise><div class="tagcloud" style="color: #eb4d4b;">거절됨</div></c:otherwise>
				</c:choose>
				</td>
		 	</tr>
		</c:forEach> 
	</tbody>
	</table>
	</div>
</div>

</div>
<!-- vue js -->
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const app = Vue.createApp({
        data(){
            return {
            	showRegist:true,
            	showApply:false,
            };
        },
        computed:{

        },
        methods:{
        	clickRegist(){
        		this.showRegist = true;
        		this.showApply = false
        	},
        	clickApply(){
        		this.showRegist = false;
        		this.showApply = true;
        	},
        },
        watch:{

        },
        mounted(){

        }
    });
    app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>