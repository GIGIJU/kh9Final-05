<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="${root}/review/list">review <i class="fa fa-chevron-right"></i></a></span> 
					<span class="mr-2">write <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">리뷰글 작성</p>
			</div>
		</div>
	</div>
</section>	
<br><br><br><br>
<div class="container">
	<div class="mt-3">
		<h2>후기 작성</h2>
	</div>
	<div class="mt-3" id="app">
		<form v-on:submit="sendForm($event)" method="post" enctype="multipart/form-data">
			<div class="mt-3">
				<input type="hidden" name="reviewWriter" value="${memberId}">
			</div>
			<br><br>
			<c:choose>
				<c:when test="${fieldName == null}">
					<div class="mt-3">
						<input type="text" class="form-control" v-model="review.fieldName" name="fieldName" placeholder="골프장명" required>
					</div>
					<br><br>
				</c:when>
				<c:otherwise>
					<div class="mt-3">
						<input type="text" class="form-control" v-model="review.fieldName" name="fieldName" value="${fieldName}" placeholder="골프장명">
					</div>
					<br><br>
				</c:otherwise>
			</c:choose>
			<div class="mt-3">
				<input type="text" class="form-control" v-model="review.reviewTitle" name="reviewTitle" placeholder="글제목">
			</div>
			<br><br>
			<div class="mt-3">
				<span>개인 평점</span>
				<select name="reviewRating" class="form-control" v-model="review.reviewRating">
					<option value="">선택하세요</option>
					<option>10</option>
					<option>9.5</option>
					<option>9</option>
					<option>8.5</option>
					<option>8</option>
					<option>7.5</option>
					<option>7</option>
					<option>6.5</option>
					<option>6</option>
					<option>5.5</option>
					<option>5</option>
				</select>
			</div>
			<br><br>
			
			<div class="mt-3">
				<span>캐디 서비스</span>
				<select name="reviewCaddie" class="form-control" v-model="review.reviewCaddie">
					<option value="">선택하세요</option>
					<option>10</option>
					<option>9.5</option>
					<option>9</option>
					<option>8.5</option>
					<option>8</option>
					<option>7.5</option>
					<option>7</option>
					<option>6.5</option>
					<option>6</option>
					<option>5.5</option>
					<option>5</option>
				</select>
			</div>
			<br><br>
			<div class="mt-3">
				<span>코스 평점</span>
				<select name="reviewCos" class="form-control" v-model="review.reviewCos">
					<option value="">선택하세요</option>
					<option>10</option>
					<option>9.5</option>
					<option>9</option>
					<option>8.5</option>
					<option>8</option>
					<option>7.5</option>
					<option>7</option>
					<option>6.5</option>
					<option>6</option>
					<option>5.5</option>
					<option>5</option>
				</select>
			</div>
			<br><br>
			<div class="mt-3">
				<span>가격 만족도</span>
				<select name="reviewPrice" class="form-control" v-model="review.reviewPrice">
					<option value="">선택하세요</option>
					<option>10</option>
					<option>9.5</option>
					<option>9</option>
					<option>8.5</option>
					<option>8</option>
					<option>7.5</option>
					<option>7</option>
					<option>6.5</option>
					<option>6</option>
					<option>5.5</option>
					<option>5</option>
				</select>
			</div>
			<br><br>
			<div class="mt-3">
				<span>시설 만족도</span>
				<select name="reviewFacility" class="form-control" v-model="review.reviewFacility">
					<option value="">선택하세요</option>
					<option>10</option>
					<option>9.5</option>
					<option>9</option>
					<option>8.5</option>
					<option>8</option>
					<option>7.5</option>
					<option>7</option>
					<option>6.5</option>
					<option>6</option>
					<option>5.5</option>
					<option>5</option>
				</select>
			</div>
			<br><br>
			<div class="mt-3">
				<span>글작성</span>
				<textarea rows="5" class="form-control" cols="60" name="reviewContent" v-model="review.reviewContent"></textarea>
			</div>
			<br><br>
			<div class="mt-3">
				<span>사진업로드</span>
				<input type="file" name="reviewProfile" class="form-control">
			</div>
			<br><hr><br>
			<div class="mt-3">
				<input type="submit" class="btn btn-success btn-lg btn-block" value="등록">
			</div>
			
		</form>
	</div>
	<br><br><br><br>
</div>
<script src="https://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
//div[id=app]을 제어할 수 있는 Vue instance를 생성
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	review:{
        		fieldName:"${fieldName}",
        		reviewTitle:"",
        		reviewRating:"",
        		reviewCaddie:"",
        		reviewCos:"",
        		reviewPrice:"",
        		reviewFacility:"",
        		reviewContent:"",
        		
        		get fieldNameNullCheck(){
        			return this.fieldName.length > 0;
        		},
        		
        		get reviewTitleNullCheck(){
        			return this.reviewTitle.length > 0;
        		},
        		
        		get reviewRatingNullCheck(){
        			return this.reviewRating.length > 0;
        		},
        		
        		get reviewCaddieNullCheck(){
        			return this.reviewCaddie.length > 0;
        		},
        		get reviewCosNullCheck(){
        			return this.reviewCos.length > 0;
        		},
        		get reviewPriceNullCheck(){
        			return this.reviewPrice.length > 0;
        		},
        		get reviewFacilityNullCheck(){
        			return this.reviewFacility.length > 0;
        		},
        		
        		get reviewContentNullCheck(){
        			return this.reviewContent.length > 0;
        		},
        		
        		get isWrite(){
                    return this.fieldNameNullCheck && this.reviewTitleNullCheck && this.reviewRatingNullCheck && this.reviewCaddieNullCheck &&
                    this.reviewCosNullCheck && this.reviewPriceNullCheck && this.reviewFacilityNullCheck && this.reviewContentNullCheck;
                },
        	},
        };
    },
    computed:{
       
    },
    methods:{
    	sendForm(e){
            if(this.review.isWrite == false){
                e.preventDefault();
            }
        },
    },
    watch:{
        
    },
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>