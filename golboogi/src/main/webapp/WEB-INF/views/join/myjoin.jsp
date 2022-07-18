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
/* 모달창 */
.modal {
	position: fixed;
	top: 20%;
	left: 5%;
	width: 90%;
	height: 57%;
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
    resize: none;
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
		 		<span style="cursor: pointer;">
		 		<i @click="joinEdit(${MyJoinListVO.joinListVO.joinNo})" class="fa-solid fa-pen-to-square"></i></span>
		 		<span style="cursor: pointer;">&nbsp;
		 		<i @click="joinDelete(${MyJoinListVO.joinListVO.joinNo},${MyJoinListVO.joinListVO.joinStatus})" class="fa-solid fa-trash"></i></span>
		 		</td>
		 	</tr>
			<c:forEach var="JoinApplyListVO" items="${MyJoinListVO.joinApplyList}">
			<tr>
				<td colspan="1"><i class="fa-solid fa-arrow-turn-up" style="transform: rotateZ(90deg);"></i></td>
				<td colspan="1"><img src="${root}/attachment/download?attachmentNo=${JoinApplyListVO.memberProfile}" style="width: 50px; height: 50px; border-radius: 100%;"></td>
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
						<div style="font-size: 12px;">승인대기중</div>
						<div class="tagcloud mt-2" style="color: black; cursor: pointer;" @click="joinApplyCancel(${MyJoinApplyListVO.joinApplyNo})">신청취소</div>
					</c:when>
					<c:when test="${MyJoinApplyListVO.joinApplyStatus==1}"><div style="color: #686de0; font-size: 12px;">승인됨</div></c:when>
					<c:otherwise><div style="color: #eb4d4b; font-size: 12px;">거절됨</div></c:otherwise>
				</c:choose>
				</td>
		 	</tr>
		</c:forEach> 
	</tbody>
	</table>
	</div>
</div>

<!-- 조인수정 창 -->
<div class="modal" style="display: none;">
	<div class="modal-content">
	<div class="row">
		<div class="col-8 text-left" style="padding-left: 0px;">
			<span style="font-weight: bold; color: black;">조인 수정</span>			
		</div>
		<div class="col-4 text-right">
			<button class="btn-cancel" @click="hiddenModal"><i class="fa-solid fa-xmark"></i></button>
		</div>
	</div>
		<div class="row mt-2">
			<span style="color: black; font-size: 11px; margin-right: 3px;">인원 수 : </span> 
			<select v-model="joinApplyPeople">			
				<option v-for="num in joinPeople">{{num}}</option>
			</select>
		</div>
		<div class="row mt-2">
			<textarea placeholder="나와 동반자를 표현하는 글을 작성해보세요" v-model="joinApplyInfo"></textarea>
		</div>
		<div class="row" style="font-size: 9px; text-align: left;">
			<span><i class="fa-solid fa-circle-exclamation"></i> 신청 후 조인수락이되면, 방장님과 회원님간의 핸드폰번호가 서로 공개됩니다.</span>
			<span><i class="fa-solid fa-circle-exclamation"></i> 조인서비스는 자유 공간입니다.이용 중 발생하는 사고에 대해 어떠한 법적 책임도 지지 않습니다.</span>
		</div>
		<div class="row mt-4">
			<div class="col text-center">
				<button class="btn" style="width: 50%" @click="joinApply">신청하기</button>
			</div>
		</div>
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
          	joinDelete(joinNo,status){
        		if(status==1){
        			alert("마감된 등록 건은 삭제할 수 없습니다.")
        		}
        		else if(confirm("정말로 삭제 하시겠습니까?")){
        			window.location.href="${root}/join/delete/"+joinNo;
        		}
        	}, 
        	joinEdit(joinNo){
        		
        	},
        	joinApplyCancel(joinApplyNo){
        		if(confirm("신청 취소 하시겠습니까?")){
        			window.location.href="${root}/join/applyCancel/"+joinApplyNo;
        		}
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