<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="adminId" value="${adminLogin}"></c:set>
<c:set var="isAdmin" value="${adminId != null}"></c:set>
<c:set var="check1" value="${reviewDto.reviewNo}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/golboogi">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2"><a href="${root}/review/list">review <i class="fa fa-chevron-right"></i></a></span>
					<span class="mr-2"><a href="${root}/review/detail/${reviewDto.reviewNo}">detail <i class="fa fa-chevron-right"></i></a></span>
				</p>
				<p class="mb-0" style="font-size: 17px">${reviewDto.reviewNo}번 후기 게시글</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<style>
	.table{
		border: 1px solid black;
	}
	.reply-header {
		padding:1em;
		font-size:1.2em;	
	}
	.reply-header > span {
		margin-right:1em;
	}
	.reply-body {
		padding:1em;
		border-bottom: 1px solid gray;
	}
	.reply-header .fa-solid {
		margin-right:0.5em;
		cursor:pointer;
	}
	.reply-header .fa-solid:hover {
		color:red;
	} 
	#check{
		display: none;
	}
	#move{
		text-align:center;
	}
	#reviewImage{
		width:80%;
		height:300px;
	}
	
</style>
<div class="container" id="app">
	<div class="mt-3">
		<table class="table table table-bordered">
			<thead>
				<tr>
					<th colspan="5">게시글 명 : ${reviewDto.reviewTitle}</th>
				</tr>
				<tr >
					<th>골프장명 : ${reviewDto.fieldName}</th>
					<th>
						<c:choose>
							<c:when test="${reviewDto.reviewWriter == null}">
								(탈퇴한 사용자)
							</c:when>
							<c:otherwise>
								작성자 : ${reviewDto.reviewWriter}
							</c:otherwise>
						</c:choose>
					</th>
					<th>장성일 : ${reviewDto.reviewTime}</th>
					<th colspan="2" id="move">조회수 : ${reviewDto.reviewReadcount}</th>
				</tr>
				<tr>
					<th>개인평점 : ${reviewDto.reviewRating}</th>
					<th>캐디서비스 : ${reviewDto.reviewCaddie}</th>
					<th>코스관리 : ${reviewDto.reviewCos}</th>
					<th>가격만족도 : ${reviewDto.reviewPrice}</th>
					<th>시설만족도 : ${reviewDto.reviewFacility}</th>
				</tr>
			</thead>
			<tbody>
				<tr height="250">
					<td valign="top" colspan="5" align="center">
						<c:if test="${attachmentNo != 0}">
							<br>
							<div class="mt-3">
								<img src="${root}${profileUrl}" id="reviewImage">
							</div>
							<br><br>
						</c:if>
						<div class="mt-3" align="left">
							${reviewDto.reviewContent}
						</div>
					</td>
				</tr>
				<tr>
				<td class="right" colspan="5" align="right">
<%-- 					<a href="${root}/review/write" class="btn btn-success btn-sm">글쓰기</a>&nbsp; --%>
					<a href="${root}/review/list" class="btn btn-success btn-sm">목록</a>&nbsp;
					
					<c:if test="${isAdmin && auth == 0}">
						<a href="${root}/review/delete/${reviewDto.reviewNo}" class="btn btn-danger btn-sm">관리자 삭제</a>&nbsp;
					</c:if>
					
					<c:if test="${reviewDto.reviewWriter == memberId}">
						<a href="${root}/review/reviewProfile/${reviewDto.reviewNo}" class="btn btn-success btn-sm">사진수정</a>&nbsp;
						<a href="${root}/review/edit/${reviewDto.reviewNo}" class="btn btn-success btn-sm">글 수정</a> &nbsp;
						<a href="${root}/review/delete/${reviewDto.reviewNo}" class="btn btn-danger btn-sm">삭제</a>&nbsp;
					</c:if>
				</td>
			</tr>
			</tbody>
			<tfoot>
				<!-- 댓글 작성 -->
				<tr>
					<td colspan="5" align="center">
						<h4>댓글 작성</h4>
						<div class="mt-3">
							<textarea class="form-control" rows="5" :disabled="isAnonymous" :placeholder="textareaPlaceholder" v-model="reviewContent"></textarea>
						</div>
						<div class="mt-3" align="left">
							<span>{{reviewContentIsLength}}/100</span>
						</div>
						<div class="mt-3 d-grid" align="right">
							<button class="btn btn-success btn-lg" :disabled="isAnonymous"  @click="addReply">{{buttonPlaceholder}}</button>
						</div>
					</td>
				</tr>
				
				<!-- 댓글 목록 -->
				<tr>
					<td colspan="5" align="center">
						<h4>댓글 목록</h4>
						<div class="mt-3" v-for="(reply, index) in replyList" v-bind:key="index">
							<!-- 일반적인 출력화면 -->
							<div v-if="!reply.edit">
								<table class="table">
									<tr>
										<td width="20%">{{reply.replyWriter}}</td>
										<td width="50%">{{reply.replyContent}}</td>
										<td width="10%">{{reply.replyTime}}</td>
										<td width="10%" align="center">
											<span v-if="isEditAndDeleteAvailable(reply.replyWriter)">
												<i class="fa-solid fa-pen-to-square" @click="changeEditMode(index);"></i>&nbsp;&nbsp;&nbsp;&nbsp;
												<i class="fa-solid fa-trash" @click="deleteReply(index);"></i>
											</span>
										</td>
									</tr>
								</table>
							</div>
							<div class="right" v-else>
								<div class="mt-3" colspan="5" align="center">
									<textarea class="form-control" rows="5" :disabled="isAnonymous" placeholder="수정 댓글 작성" v-model="replyList[index].replyContent"></textarea>
								</div>
								<div class="mt-3" colspan="5" align="right">
									<button class="btn btn-secondary" :disabled="isAnonymous" @click="changeDisplayMode(index);">취소</button> &nbsp;&nbsp;&nbsp;
									<button class="btn btn-primary" :disabled="isAnonymous" @click="editReply(index);">수정</button>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
		<br>
	</div>
</div>	
<hr>
<!-- otherlist -->
<div class="container">
	<div class="mt-3">
		<h3>[${reviewDto.fieldName}]</h3>
	</div>
	
	<!-- 골프장별 평점 -->
	<div class="mt-3">
		<h3>평점 : <fmt:formatNumber value="${rating}" pattern="#.#"></fmt:formatNumber></h3>
	</div>
	
	<div class="mt-3">
		<table class="table table table-bordered">
			<thead>
				<tr align="center">
					<th>순서</th>
					<th>아이디</th>
					<th width="40%">제목</th>
					<th>평점</th>
					<th>등록일자</th>
					<th>조회/추천</th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:if test="${list.isEmpty()}"> --%>
<!-- 					<tr> -->
<!-- 						<td colspan="6" align="center">검색결과가 없습니다.</td> -->
<!-- 					</tr> -->
<%-- 				</c:if> --%>
				<c:forEach var="reviewDto" items="${list}">
					<tr align="center">
						<td>${reviewDto.reviewNo}</td>
						<td>
							<c:choose>
								<c:when test="${reviewDto.reviewWriter == null}">
									(탈퇴한 사용자)
								</c:when>
								<c:otherwise>
									${reviewDto.reviewWriter}
								</c:otherwise>
							</c:choose>
						</td>
						<td align="left"><a href="${root}/review/detail/${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a></td>
						<td>${reviewDto.reviewRating}</td>
						<td>${reviewDto.reviewTime}</td>
						<td>${reviewDto.reviewReadcount}/${reviewDto.reviewSuggestion}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br><br>
	</div>
</div>
<script src="https://unpkg.com/vue@next"></script>
<!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
//div[id=app]을 제어할 수 있는 Vue instance를 생성
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	// 서버에서 전달된 정보
            memberId:"${login}",
            reviewNo:${reviewDto.reviewNo},
            
            
            //댓글 입력 정보
            reviewContent:"",
            
            //댓글 목록
            replyList:[],
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{
        isAnonymous(){
        	return this.memberId == "";
        },
        isMember(){
        	return this.memberId != "";
        },
        
//         isAdmin(){
//         	return this.isMember && this.memberGrade == "관리자";
//         },
        textareaPlaceholder(){
        	return this.isAnonymous ? "로그인 후 댓글을 작성할 수 있습니다" : "댓글 내용 입력";
        },
        buttonPlaceholder(){
        	return this.isAnonymous ? "댓글 작성 불가" : "댓글 등록하기";
        },
       
        reviewContentIsEmpty(){
        	return this.reviewContent.length == 0;
        },
        reviewContentIsLength(){
        	return this.reviewContent.length;
        },
        reviewContentIsOver(){
        	return this.reviewContent.length > 100;
        },
       
    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
       	//endpoint - /home/rest/reply/
        addReply(){
        	//미입력 시 차단
        	if(this.reviewContentIsEmpty) return;
        	if(this.reviewContentIsOver) return;
        	
        	axios({
        		url:"${root}/rest/reply/",
        		method:"post",
        		data:{
        			replyTarget:this.reviewNo,
        			replyContent:this.reviewContent
        		},
        	})
        	.then(resp=>{
        		//완성 시 코드
        		window.alert("댓글 등록 완료!");
        		this.reviewContent = "";
        		this.loadReply();
        	});
        },
        
        loadReply(){
        	axios({
        		url:"${root}/rest/reply/"+this.reviewNo,
        		method:"get",
        	})
        	.then(resp=>{
        		this.replyList = resp.data;
        	});
        },
		
        isEditAndDeleteAvailable(replyWriter){
        	//1.관리자면 통과
        	if(this.isAdmin) return true;
        	
        	//2. 현재사용자가 작성자라면 통과
        	if(this.memberId == replyWriter) return true;
        	
        	//나머지 다 차단
        	return false;
        },
        deleteReply(index){
        	//확인창 출력
//         	const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
//         	if(!choice) return;
        	
        	const reply = this.replyList[index];
        	axios({
        		url:"${root}/rest/reply/"+reply.replyNo,
        		method:"delete"
        	})
        	.then(resp=>{
        		//완성 시 코드
        		this.loadReply();
        	});
        },
        
        changeEditMode(index){
        	this.replyList[index].edit = true;
        },
        changeDisplayMode(index){
        	this.replyList[index].edit = false;	
        },
        
        editReply(index){
        	const reply = this.replyList[index];
        	if(reply.replyContent.length == 0) return;
        	
        	axios({
        		url:"${pageContext.request.contextPath}/rest/reply/",
        		method:"put",
        		data:{
        			replyNo:reply.replyNo,
        			replyContent:reply.replyContent
        		},
        	})
        	.then(resp=>{
        		this.loadReply();
        	});
        },
    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{
        
    },
    created(){
    	this.loadReply();
    },
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>