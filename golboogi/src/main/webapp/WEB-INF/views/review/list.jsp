<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!-- css 파일 추가 -->
    <link rel="stylesheet" href="${root}/css/mastar2.css">

<!--xeicon 추가 눈 아이콘 임시-->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"/>
<style>
	#reviewList{
		background-size: coverbackground:;
		url('') no-repeat;"
	}
</style>

 <!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>Review Board <i class="fa fa-chevron-right"></i></span>
					</p>
					<p class="mb-0" style="font-size: 17px">리뷰 게시판</p>
				</div>
			</div>
		</div>
	</section>	


<div class="container">
	<div class="mt-3">
		<h2>Photo & Review</h2>
	</div>
	<br><br>
	
	<!-- 검색창 -->
	<div class="both" style="display: flex; justify-content: space-between;">
		<div align="left" class="form-inline" id="app">
			<form v-on:submit="sendForm($event)" action="list" method="get">
				<input type="text" class="form-control" name="keyword" placeholder="골프장명" v-model="keyword">&nbsp;
				<button class="btn btn-success btn-lg" type="submit">{{buttonPlaceholder}}</button>
			</form>
		</div>
		<div class="mt-3" align="right">
			<a href="${root}/review/write" class="btn btn-success btn-lg">글쓰기</a>
		</div>
	</div>
	<br><br>
	
	
	<!-- 테이블 -->
	<div class="photo_review_container" >
		<c:forEach var="ReviewProfileVO" items="${list}">
		<c:choose>
			<c:when test="${search}">
				<span>${ReviewProfileVO.fieldName}</span>
			</c:when>
			<c:otherwise>
				<span>${ReviewProfileVO.fieldName}</span>
			</c:otherwise>
		</c:choose>
		
		<!-- 작동안함 -->
		<c:if test="${ReviewProfileVO.attachmentNo == 0}">
			<div>검색결과 없음</div>
		</c:if>
		
		<ul>
			<li>
				<div class="review_content">
					<c:choose>
						<c:when test="${ReviewProfileVO.attachmentNo == 0}">
							<div class="review_user_photo" align="center"><img src="${root}/images/user.png" width="70px;" height="70px;" style="border-radius: 50%;"></div>
						</c:when>
						<c:otherwise>
							<div class="review_user_photo" align="center"><img src="${root}/attachment/download?attachmentNo=${ReviewProfileVO.attachmentNo}" width="50px;" height="50px;"></div>
						</c:otherwise>
					</c:choose>
					<div class="review_user_comment">
						<div class="user_review_rating"><a href="#">${ReviewProfileVO.reviewRating}</a>&nbsp;&nbsp;<span><a href="${root}/review/detail/${ReviewProfileVO.reviewNo}">자세히보기</a></span></div>
						<div class="review_user_comment_name_con">
							<div class="user_review_name"><span>${ReviewProfileVO.memberName}</span></div>
							<div class="user_review_con">${ReviewProfileVO.reviewTitle}</div>
						</div>
						<div class="review_user_comment_time_read_count">
							<div class="user_review_time"><span>${ReviewProfileVO.reviewTime}</span></div>
							<!-- 임시로 xeicon 눈 -->
							<div class="user_review_read_icon"><span class="xi-eye-o"></span></div>
							<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="눈 아이콘"></a> -->
							<div class="user_review_read">${ReviewProfileVO.reviewReadcount}</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
		</c:forEach>
	</div>
	<br><br>

	
	<!-- pagenation	 -->
	<div align="center">
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
					<a href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
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
							<a class="active" href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i} &nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i} &nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i == p}">
							<a class="active" href="list?p=${i}&s=${s}">${i} &nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="list?p=${i}&s=${s}">${i} &nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 버튼 영역 -->
		<c:if test="${endBlock < lastPage}">
			<c:choose>
				<c:when test="${search}">
					<a href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
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
	<br><br><br>
</div>

<script src="https://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    //div[id=app]을 제어할 수 있는 Vue instance를 생성
    const app = Vue.createApp({
        //data : 화면을 구현하는데 필요한 데이터를 작성한다.
        data(){
            return {
               keyword:"",

            };
        },
        //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
        // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
        computed:{
            keywordNullCheck(){
                return this.keyword.length > 0;
            },
            buttonPlaceholder(){
                return this.search ? "검색" : "검색불가";
            },
            search(){
                return this.keywordNullCheck;
            },
        },
        //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
        methods:{
            sendForm(e){
                if(this.search == false){
                    e.preventDefault();
                }
            },
        },
        //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
        watch:{
            
        },
    });
    app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>