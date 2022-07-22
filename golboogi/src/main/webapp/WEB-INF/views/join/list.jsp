<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function() {
	//$(".modal").hide();
	$(".show-detail").each(function(){
		$(this).click(function() {
			$(this).next().toggle();
		});
	});
	
	$(".show-modal").each(function(){
		$(this).click(function() {
			$(this).parent().parent().next(".modal").show();
		});
	});
	
});
</script>
<style>
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
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<div id="app">
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
	<br>
	<div class="row mt-5">
		<div class="col-md-6 text-left">
			<h4>조인게시판</h4>
		</div>
		<div class="col-md-6 text-right">
			<form action="list" method="get">
					<input type="hidden" name="p" value="1" class="form-input">
					<input type="hidden" name="s" value="10" class="form-input">
				<select name="type" style="height: 30px; margin-right: 3px; font-size: 12px;">
					<option value="field_name" <c:if test="${type == 'field_name'}">selected</c:if>>골프장</option>
 					<option value="field_area" <c:if test="${type == 'field_area'}">selected</c:if>>지역</option>
					<option value="member_nick" <c:if test="${type == 'member_nick'}">selected</c:if>>등록자</option> 
				</select>
				<input type="text" name="keyword" placeholder="검색어입력" value="${param.keyword}" autocomplete="off"
					 style="height: 32px; margin-right: 3px; font-size: 12px;">
				<button type="submit" class="btn" style="height: 30px;">검색</button>
			</form>
		</div>
	</div>
	<div class="row mb-5">
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
			 	<c:if test="${list.isEmpty()}">
			 		<tr><td colspan="9"><img src="https://image.smartscore.kr/pc4/no-round.svg"><br>검색 결과가 없습니다.</td></tr>
			 	</c:if>
			 	<c:forEach var="joinListVO" items="${list}">
				 	<tr class="show-detail">
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.teeTimeD}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd(E)"/></td>
				 		<td>${joinListVO.teeTimeT}</td>
				 		<td>${joinListVO.fieldArea}</td>
				 		<td><a href="${root}/field/detail/${joinListVO.fieldNo}">${joinListVO.fieldName}</a></td>
				 		<c:choose>
				 			<c:when test="${joinListVO.joinPeople==0}"><td>-</td></c:when>
				 			<c:otherwise><td>${joinListVO.joinPeople}명</td></c:otherwise>
				 		</c:choose>
				 		<td><fmt:formatNumber value="${joinListVO.bookingPrice}" />원</td>
				 		<fmt:parseDate var="teeTimeD"  value="${joinListVO.joinTime}" pattern="yyyy-MM-dd"/>
					 	<td><fmt:formatDate value="${teeTimeD}" pattern="MM/dd"/></td>
				 		<td>${joinListVO.memberNick}</td>
				 		<c:choose>
				 			<c:when test="${joinListVO.joinStatus==0}"><td>모집중</td></c:when>
				 			<c:otherwise><td>마감</td></c:otherwise>
				 		</c:choose>
				 	</tr>
			 		<tr style="display: none; text-align: left; background-color: #F2FFED;">
			 			<td colspan="4">
			 				 [ ${joinListVO.fieldName} : ${joinListVO.courseName} ]<br>
							 <i class="fa-solid fa-comment" style="transform: scaleX(-1);"></i> ${joinListVO.joinInfo}<br>
							 
						</td>
			 			<td colspan="4" style="text-align: right;">
			 				<c:forEach var="i" begin="1" end="${4-joinListVO.joinPeople}">
			 					<img src="${root}/images/join_o.png" style="height: 40px; width: 40px; border-radius: 70%;">
			 				</c:forEach>
			 				<c:forEach var="i" begin="1" end="${joinListVO.joinPeople}">
			 					<img src="${root}/images/join_x.png" style="height: 40px; width: 40px; border-radius: 70%;">
			 				</c:forEach>
						</td>
						<td style="text-align: center;">
							<c:if test="${joinListVO.memberId != memberId && joinListVO.joinStatus==0}">
								<button class="btn" style="padding: 2px 2px 2px 2px; font-size: 10px;" @click="showModal(${joinListVO.joinNo},${joinListVO.joinPeople})">신청하기</button>							
							</c:if>
						 </td>
			 		</tr>
			 	</c:forEach>
			 	</tbody>
			 </table>
		</div>
		
		<!-- 페이지네이션 -->
			<div class="row mt-5 mb-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<c:if test="${p > 1}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}" class="link">&laquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="list?p=1&s=${s}" class="link">&laquo;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:if test="${startBlock > 1}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}" class="link">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="list?p=${startBlock-1}&s=${s}" class="link">&lt;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
								<c:choose>
									<c:when test="${search}">
										<li><a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}" class="link">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="list?p=${i}&s=${s}" class="link">${i}</a></li>
									</c:otherwise>			
								</c:choose>		
							</c:forEach>			
							<!-- 다음 버튼 영역 -->
							<c:if test="${endBlock < lastPage}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}" class="link">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="list?p=${endBlock+1}&s=${s}" class="link">&gt;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
							<c:if test="${p < lastPage}">
								<c:choose>
									<c:when test="${search}">
										<li><a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}" class="link">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="list?p=${lastPage}&s=${s}" class="link">&raquo;</a></li>
									</c:otherwise>			
								</c:choose>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	</div>
	<br>
</div>

<!-- 조인신청 창 -->
<div class="modal" style="display: none;">
	<div class="modal-content">
	<div class="row">
		<div class="col-8 text-left" style="padding-left: 0px;">
			<span style="font-weight: bold; color: black;">조인 신청</span>			
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

<script src="https://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    //div[id=app]을 제어할 수 있는 Vue instance를 생성
    const app = Vue.createApp({
        //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
        data(){
            return {
               joinNo:"",
               joinApplyPeople:0,
               joinApplyInfo:"",
               joinPeople:0,
            };
        },
        //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
        //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
        //- 반드시 return을 통해 값을 반환해야 한다
        computed:{

        },
        //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
        methods:{
        	showModal(joinNo,joinPeople){
        		console.log(joinNo,joinPeople);
        		this.joinPeople = joinPeople;
       			this.joinNo = joinNo;
       			$(".modal").show();
        	},
        	hiddenModal(){
        		this.joinApplyPeople = 0;
        		this.joinApplyInfo = "";
        		$(".modal").hide();
        	},
        	joinApply(){				
				if(this.joinNo=="" || this.joinApplyPeople==0 || this.joinApplyInfo==""){
					window.alert("신청란을 작성해주세요.");
					return;
				}
				
				axios({
					url:"${pageContext.request.contextPath}/rest/apply/",
					method:"post",
					data:{
						joinNo:this.joinNo,
			            joinApplyPeople:this.joinApplyPeople,
			            joinApplyInfo:this.joinApplyInfo
					},
				})
				.then(resp=>{
					//완성 시
					window.alert("신청이 완료되었습니다.\n승인을 기다려주세요.");
					$(".modal").hide();
				});
			},
        },
        //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
        watch:{

        },
        mounted(){
			
        }
    });
    app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>