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
	  prevText: '?????? ???',
	  nextText: '?????? ???',
	  minDate: 0,
	  monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
	  monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
	  dayNames: ['???', '???', '???', '???', '???', '???', '???'],
	  dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
	  dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
	  showMonthAfterYear: true,
	  yearSuffix: '???'
	});
	
$(function () {
	  $('#datepicker').datepicker({
	  });
	});
	
	

</script>

<div id="app">
<!-- ?????? ??? ????????? ????????? ?????? -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>package <i class="fa fa-chevron-right"></i></span></p>
					<p class="mb-0" style="font-size: 17px">??????, ?????? ????????? ????????? ???????????? ????????????.</p>
     </div>
   </div>
 </div>
</section>

<!-- ????????? -->
<section class="ftco-section ftco-no-pb">
 <div class="container">
  <div class="row">
   <div class="col-md-12">
    <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
     <form action="list" class="search-property-1">
      <div class="row no-gutters">
       <div class="col-lg d-flex">
        <div class="form-group p-4 border-0">
         <label for="#">??????</label>
         <div class="form-field">
            <div class="icon"><span class="fa fa-chevron-down"></span></div>
                 <select name="stayLocal" id="" class="form-control">
                    <option value="">??????</option>
			        <option value="?????????">?????????</option>
			        <option value="?????????">?????????</option>
			        <option value="?????????">?????????</option>
			        <option value="?????????">?????????</option>
			        <option value="?????????">?????????</option>
		      </select>
         </div>
       </div>
     </div>  
<!--      <div class="col-lg d-flex"> -->
<!--       <div class="form-group p-4"> -->
<!--        <label for="#">?????????</label> -->
<!--        <div class="form-field"> -->
<!--          <div class="icon"><span class="fa fa-calendar"></span></div> -->
<!--          <input type="text"  autocomplete="off" name="packageDepart"  id="datepicker"  class="form-control " placeholder="Check In" > -->


<!--        </div> -->
<!--      </div> -->
<!--    </div> -->
   <div class="col-lg d-flex">
    <div class="form-group p-4">
     <label for="#">??????</label>
     <div class="form-field">
       <div class="icon"><span class="fa fa-calendar"></span></div>
       <input type="text" class="form-control checkout_date" placeholder="Check Out" disabled value="1???2???">
     </div>
   </div>
 </div>
 <div class="col-lg d-flex">
  <div class="form-group p-4">
   <label for="#">?????????</label>
   <div class="form-field">
     <div class="select-wrap">
      <div class="icon"><span class="fa fa-chevron-down"></span></div>
      <select name="stayPrice" id="" class="form-control">
        <option value="">??????</option>
        <option value="100000" id="??????">?????? (~10??????)</option>
        <option value="300000" id="??????">?????? (10~30??????)</option>
        <option value="500000" id="????????????">???????????? (30??????~)</option>
      </select>
    </div>
  </div>
</div>
</div>
<div class="col-lg d-flex">
  <div class="form-group d-flex w-100 border-0">
   <div class="form-field w-100 align-items-center d-flex">
    <input type="submit" value="??????" class="align-self-stretch form-control btn btn-primary">
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
			
			<!-- ??????????????? 500 -->
			<c:if test="${list.isEmpty()}">
			  <div class="container">
		       <div class="row justify-content-center">
       				 <div class="text-center mt-5 md-3">
		        <img src="${root}/images/no-round.svg" >
		      </br>
	 	 	    <span   style="font-size: 18px; color:#999999">?????? ????????? ????????????.</span>
	 	 	</div>
	 	 	</div>
	 	 	</div>
 			</c:if>
 			
<!-- ????????? ????????? -->
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
			<span class="price">??????</span>
		</c:when>
		<c:when test="${PackageVO.stayDto.stayPrice<=300000}">
			<span class="price" >??????</span>
		</c:when>
		<c:otherwise>
		    <span class="price">????????????</span>
		</c:otherwise>
	</c:choose>	
    </a>
    <div class="text p-4">
	<span class="days"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${PackageVO.stayDto.stayPrice}" />~</span>
      <h3><a href="detail?packageNo=${PackageVO.packageNo}&stayNo=${PackageVO.stayDto.stayNo}"><c:out value="${PackageVO.stayDto.stayName}" /></a></h3>
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



<!-- <!-- ?????????????????? --> 
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

<!-- vue js??? lazy loading??? ???????????? -->
<script src="https://unpkg.com/vue@next"></script>
    <script>
        //div[id=app]??? ????????? ??? ?????? Vue instance??? ??????
        const app = Vue.createApp({
            //data : ????????? ??????????????? ????????? ???????????? ????????????.
            data(){
                return {
     
                };
            },
            //computed : data??? ???????????? ?????? ????????? ????????? ????????? ?????? ????????????.
            // - 3????????? ????????? ???????????? ?????? ?????? ????????????(????????? ?????? ??? ?????? ????????? ??????)
            computed:{
				},
            },
            //methods : ?????????????????? ????????? ????????? ?????? ????????? ?????? ????????? ????????? ?????? ????????????.
            methods:{
                
            },
            //watch : ?????? data??? ???????????? ?????? ????????? ???????????? ?????? ????????????
            watch:{
            	
            }
        });
        app.mount("#app");
    </script>
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
