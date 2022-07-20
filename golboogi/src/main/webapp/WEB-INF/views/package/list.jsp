 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<fmt:parseDate value = "2009-03-01 13:00:59" pattern = "yyyy-MM-dd" var = "date"/>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<style>
	/*Yujin custom style*/
	        .tour-product-info {
	      display: flex;
	      align-items: center;
	      flex-direction: column;
	  }
	    .tour-product-info .product-info-item+.product-info-item {
	      margin-top: 30px;
	  }
	    .tour-product-info .product-info-item {
	      display: flex;
	      width: 100%;
	      padding: 40px;
	      background-color:#343a40;
	      border-radius: 15px;
	  }
	  .tour-product-info .product-info-item .item-title {
	    width: 240px;
	    font-size: 24px;
	    font-weight: 700;
	}
	  .tour-product-info .product-info-item .item-cont {
	    flex: 1;
	    flex-grow: 1;
	    flex-shrink: 1;
	    flex-basis: 0%;
	    margin-left: 100px;
	    
	}
	.button-toggle {
	  justify-content: center;
	  height: 60px;
	  padding: 0 24px;
	  font-size: 18px;
	  color: #000;
	  border: 1px solid rgba(0,0,0,.2);
	}
	.tour-detail-info {
	  display: flex;
	  justify-content: center;
	}
	.tour-detail-info .info-item {
	  color: #343a40;
	  width: 200px;
	  text-align: center;
	}
	.tour-detail-info .info-item+.info-item {
	  border-left: 1px solid rgba(0,0,0,.1);
	}
	
		.button-toggle {
	  justify-content: center;
	  height: 60px;
	  padding: 0 24px;
	  font-size: 18px;
	  color: #000;
	  border: 1px solid rgba(0,0,0,.2);
	}
	
	.button-toggle+.button-toggle {
	  border-left-width: 0;
	}
	
	.button-toggle:active{
	  color: #fff;
	  background-color: #000;
	  border: 1px solid #000;
	}
</style>

<script>
	

$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  minDate: 0,
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
	
$(function () {
	  $('#datepicker').datepicker({
	  });
	});
	
	

</script>

<div id="app">
<!-- 헤더 밑 이미지 타이틀 세션 -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>package <i class="fa fa-chevron-right"></i></span></p>
					<p class="mb-0" style="font-size: 17px">투어, 모든 골프장 예약은 골북이로 통합니다.</p>
     </div>
   </div>
 </div>
</section>

<!-- 검색바 -->
<section class="ftco-section ftco-no-pb">
 <div class="container">
  <div class="row">
   <div class="col-md-12">
    <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
     <form action="list" class="search-property-1">
      <div class="row no-gutters">
       <div class="col-lg d-flex">
        <div class="form-group p-4 border-0">
         <label for="#">지역</label>
         <div class="form-field">
            <div class="icon"><span class="fa fa-chevron-down"></span></div>
                 <select name="stayLocal" id="" class="form-control">
                    <option value="">전체</option>
			        <option value="경기도">경기도</option>
			        <option value="강원도">강원도</option>
			        <option value="전라도">전라도</option>
			        <option value="경상도">경상도</option>
			        <option value="제주도">제주도</option>
		      </select>
         </div>
       </div>
     </div>  
<!--      <div class="col-lg d-flex"> -->
<!--       <div class="form-group p-4"> -->
<!--        <label for="#">체크인</label> -->
<!--        <div class="form-field"> -->
<!--          <div class="icon"><span class="fa fa-calendar"></span></div> -->
<!--          <input type="text"  autocomplete="off" name="packageDepart"  id="datepicker"  class="form-control " placeholder="Check In" > -->


<!--        </div> -->
<!--      </div> -->
<!--    </div> -->
   <div class="col-lg d-flex">
    <div class="form-group p-4">
     <label for="#">일정</label>
     <div class="form-field">
       <div class="icon"><span class="fa fa-calendar"></span></div>
       <input type="text" class="form-control checkout_date" placeholder="Check Out" disabled value="1박2일">
     </div>
   </div>
 </div>
 <div class="col-lg d-flex">
  <div class="form-group p-4">
   <label for="#">가격대</label>
   <div class="form-field">
     <div class="select-wrap">
      <div class="icon"><span class="fa fa-chevron-down"></span></div>
      <select name="stayPrice" id="" class="form-control">
        <option value="">전체</option>
        <option value="100000" id="알뜰">알뜰 (~10만원)</option>
        <option value="300000" id="일반">일반 (10~30만원)</option>
        <option value="500000" id="프리미엄">프리미엄 (30만원~)</option>
      </select>
    </div>
  </div>
</div>
</div>
<div class="col-lg d-flex">
  <div class="form-group d-flex w-100 border-0">
   <div class="form-field w-100 align-items-center d-flex">
    <input type="submit" value="검색" class="align-self-stretch form-control btn btn-primary">
  </div>
</div>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</section>
			
			<!-- 일정없을때 500 -->
			<c:if test="${list.isEmpty()}">
			  <div class="container">
		       <div class="row justify-content-center">
       				 <div class="text-center mt-5 md-3">
		        <img src="${root}/images/no-round.svg" >
		      </br>
	 	 	    <span   style="font-size: 18px; color:#999999">투어 정보가 없습니다.</span>
	 	 	</div>
	 	 	</div>
	 	 	</div>
 			</c:if>
 			
<!-- 패키지 리스트 -->
<section class="ftco-section">
 <div class="container">
  <div class="row">
 <c:forEach var="PackageVO" items="${list}" varStatus="status">
 <!-- ${list} -->
   <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
    <div class="project-wrap hotel">
    <c:choose>
	<c:when test="${PackageVO.stayDto.attachmentNo != 0}">
		<a href="detail?packageNo=${PackageVO.packageNo}&stayNo=${PackageVO.stayDto.stayNo}" class="img" style="background-image: url(${root}/attachment/download?attachmentNo=${PackageVO.stayDto.attachmentNo});">	</c:when>
	<c:otherwise>		
		<a href="detail?packageNo=${PackageVO.packageNo}&stayNo=${PackageVO.stayDto.stayNo}" class="img" style="background-image: url(${root}/images/no-round.svg);">				
	</c:otherwise>
</c:choose>
<%-- 					<h1>${PackageVO.stayDto.attachmentNo}</h1> --%>
      <c:choose>
		<c:when test="${PackageVO.stayDto.stayPrice <=100000}">
			<span class="price">알뜰</span>
		</c:when>
		<c:when test="${PackageVO.stayDto.stayPrice<=300000}">
			<span class="price" >일반</span>
		</c:when>
		<c:otherwise>
		    <span class="price">프리미엄</span>
		</c:otherwise>
	</c:choose>
							
    </a>
    <div class="text p-4">
	<span class="days"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${PackageVO.stayDto.stayPrice}" />~</span>
      <h3><a href="detail?stayNo=${PackageVO.packageNo}"><c:out value="${PackageVO.stayDto.stayName}" /></a></h3>
      <p class="location"><span class="fa fa-map-marker"></span><c:out value="${PackageVO.stayDto.stayLocal}" /></p>
      <ul>
       <li><span class="flaticon-mountains"></span><c:out value="${PackageVO.fieldDto.fieldName}"/></li>
       <li><span class="flaticon-king-size"></span><c:out value="${PackageVO.stayDto.stayType}" /></li>
     </ul>
   </div>
 </div>
</div>
</c:forEach> 
</div>



<!-- <!-- 페이지네이션 --> 
<!-- <div class="row mt-5"> -->
<!--   <div class="col text-center"> -->
<!--     <div class="block-27"> -->
<!--       <ul> -->
<!--         <li><a href="#">&lt;</a></li> -->
<!--         <li class="active"><span>1</span></li> -->
<!--         <li><a href="#">2</a></li> -->
<!--         <li><a href="#">3</a></li> -->
<!--         <li><a href="#">4</a></li> -->
<!--         <li><a href="#">5</a></li> -->
<!--         <li><a href="#">&gt;</a></li> -->
<!--       </ul> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
</section>

<!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://unpkg.com/vue@next"></script>
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
     
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
				},
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
            	
            }
        });
        app.mount("#app");
    </script>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
