<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
  /* 유진 커스텀 style */
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
      width: 80%;
      padding: 30px;
      background-color:#343a40;
      border-radius: 15px;
  }

  .tour-product-info .product-info-item2 {
    display: flex;
    width: 80%;
    padding: 30px;
    background-color:#f8f9fa;
    color: #000;
    border-radius: 15px;
    border-bottom: 1px solid #c7c7c7;
}

  .tour-product-info .product-info-item .item-title {
    width: 240px;
    font-size: 20px;
    font-weight: 700;

}

  .tour-product-info .product-info-item .item-cont {
    flex: 1;
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 0%;
    margin-left: 80px;
    
}

.tour-product-info .product-info-item2 .item-title {
  width: 240px;
  font-size: 20px;
  font-weight: 700;
     
}

.tour-product-info .product-info-item2 .item-cont {
  flex: 1;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: 0%;
  margin-left: 80px;
  
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

.img-box {
  position: relative;}

  .img-box .img-thumb {
    position: absolute;
    width: inherit;
    height: inherit;
    top: 0;
    left: 0;
    background-color: #f7f7f7;
    background-size: cover;
    background-position: 50%;
    border-radius: inherit;
    transition: all .3s ease-in-out;
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

.button-toggle:hover{
  color: #fff;
  background-color: #000;
  border: 1px solid #000;
}

.red{
  color:#dc3545 ;
}

.field-button-box {
    display: flex;
    align-items: center;
    position: relative;
    height: 30px;
    z-index: 2;
}

.select-box {
    display: flex;
    position: relative;
    width: 100%;
    cursor: pointer;
}


    <!-- 셀렉 박스 눌렀을시 placehoder 설정 -->
        select option[value=""][disabled] {
	        display: none;
        }
        


</style>

<script>
//약관 전체동의 선택동의 함수
function checkboxControl(target){//target==이벤트가 발생한 태그 객체
    //준비 : 전체선택, 항목 체크박스들
   var selectAllList = document.querySelectorAll(".select-all");
   var checkboxAllList = document.querySelectorAll("input[name=subject]");
   

   //처리
   for(var i=0;i<selectAllList.length;i++){
       selectAllList[i].checked=target.checked;
   }
   for(var i=0;i<checkboxAllList.length;i++){
       checkboxAllList[i].checked=target.checked;
   }

   function selectItem(){//target==체크한 항목 아이템
       //모든 체크박스가 체크되었는지 확인
       //-> 체크된 체크박스 수 = 전체 항목 체크박스 수 
       //준비
       var checkboxList=document.querySelectorAll("input[name=subject]");
       var count =0;
       //처리
       for(var i=0;i<checkboxList;i++){
           if(checkboxList[i].checked){
               count++;
           }
       }
       
       var judge = count ==checkboxList.length;
       var selectAllList = document.querySelectorAll(".select-all");
       for(var i=0; i<selectAllList;i++){
           selectAllList[i].checked=judge;
       }
   }
}

<!-- 필수항목체크 함수 -->
function chk() {
    var f = document.thisForm;
    if(f.subject_agree.checked!==true) {
        alert('필수항목에 체크해 주세요.');
    } else {
        alert('약관에 동의하셨습니다.');
        f.submit();
    }
}
</script>


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



<!--예약 정보 입력-->
    <form method="post" action="reserve" onsubmit="return  !!(formCheck() & chk());">
<section class="ftco-intro ftco-section ftco-no-pt">
  <div class="container">
    
    <div class="row justify-content-center">
    <div class="text-center mt-5 mb-5">
      <h3 style="font-weight: bold;">예약 신청</h3>
    </div>
    </div>
    <div class="row justify-content-center tour-product-info">
            <div class="product-info-item2" >
        <div class="product-info-title" ><h5 style="color: #000; font-weight: bold;">상품 정보</h5></div>
        <div class="item-cont">
          <h2 style="color:#17a2b8">${packageVo.stayDto.stayName}</h2> 
          <hr>
          <p>• 출발일 : ${packageVo.packageDto.packageDepart} </p>
          <p>• 기간 : 1박2일</p>
          <p>• 지역 : ${packageVo.stayDto.stayLocal}</p>
      </div>
                <div class="item-cont">
      <div class="img-box">
        <img src="${root}/images/hotel-resto-1.jpg" style="height: 200px; width: 200px; border-radius: 70%;">
      </div>
      </div>
    </div>
    </div>
      <div class="row justify-content-center tour-product-info">
        <div class="product-info-item2 " >
  <div class="product-info-title " ><h5 style="color: #000; font-weight: bold;">신청 정보</h5>
          <h6 class="red">* 필수입력</h6>
        </div>
          <div class="item-cont">
            <h6  >이름 * </h6>
               <input type="text" value="${memberDto.memberName}" readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box"></div>
                                          <h6 >이메일 *</h6> 
               <input type="text" value="${memberDto.memberEmail}"  readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box" style="width:100%"></div>
            </div>
                      <div class="item-cont">
            <h6  >휴대폰 * </h6>
               <input type="text" value="${memberDto.memberPhone}" readonly="readonly" style="pointer-events: none;  background-color: #e0e0e0;     border-radius: 4px; border-style : none;">
               <div class="field-button-box"></div>
            </div>
        </div>
        </div>
	
        <div class="row justify-content-center tour-product-info">
          <div class="product-info-item2 " >
            <div class="product-info-title" ><h5 style="color: #000; font-weight: bold;">티업 정보</h5>
            <h6 class="red">* 필수입력</h6>
          </div>
            <div class="item-cont">
            <h6  > 1일차  </h6>
            <div class="select-box" >
						<select  style="width:100%" required  name="selectField"  >
						    <option value="" disabled selected >골프장 선택 </option>
      					<option value="${packageVo.fieldDto.fieldName}" >${packageVo.fieldDto.fieldName}</option>
      					</select>
      						<select  style="width:100%" required  name="selectTime" >
						    <option value="" disabled selected >희망타임 선택 </option>
      					<option value="1" >오전</option>
      					<option value="2">오후</option>
      					<option value="3">저녁</option>
      					<option value="4">야간</option> 					
      					</select>
          </div>
                 <br>
            <h6 > 2일차  </h6>
            <div class="select-box" >
						<select  style="width:100%"  required name="selectField" >
						    <option value=""  disabled selected  >골프장 선택 </option>
      					<option >${packageVo.fieldDto.fieldName}</option>
      					</select>
      						<select  style="width:100%" required name="selectTime" >
						    <option value=""  disabled selected >희망타임 선택 </option>
      					 <option value="1"  >오전</option>
      					<option value="2" >오후</option>
      					<option value="3" >저녁</option>
      					<option value="4" >야간</option>
      					</select>
          </div>
            
				<br>
				<p style="color:gray; text-align: center;"> * 희망타임 선택 시 골프장에서 티타임이 랜덤으로 배정됩니다.</p>
          	
          </div>
          </div>
          </div>
          <div class="row justify-content-center tour-product-info">
            <div class="product-info-item " >
              <div class="product-info-title" ><h2 >결제 정보</h2>
            </div>
              <div class="item-cont">
                <h5 style="color:#fff; text-align: center; text-style:bold;">[숙박]    1인 기준 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${packageVo.stayDto.stayPrice}" />  </h5> 
                <h5 style="color:#fff; text-align: center; text-style:bold;">[티업]    1인 기준 : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${packageVo.fieldDto.fieldGreenfee}" />  </h5> 
                <h5 style="color:#fff; text-align: center; text-style:bold;">신청 인원 : 4인 1팀 </h5> 
                <hr style="background-color :#fff">
                <div >
                <h3 style="color:#ffc107; font-weight: bold; text-decoration: underline; text-align: center;"> 총  <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${(packageVo.stayDto.stayPrice)*4 + (packageVo.fieldDto.fieldGreenfee)*4}" /></h3>
                </div>  		
                <br>
				</div>
            </div>
            </div>
            
          <!-- 약관동의 -->
     <form name="thisForm">
    <div class="row justify-content-center">
              <div class="mt-5" style="width: 400px;">
              
                <h4 style="font-weight: bold;">약관동의 <span class="red">*</span></h4>
               
                <label for="select_all" class="mt-3">
                 <span style="color:#999999" >전체 동의</span>
                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; &nbsp;
				  <input type="checkbox" name="select_all" id="select_all"  oninput="checkboxControl(this);"  style="zoom: 1.5;">
				</label>
				<hr  class="mt-0" >
                <label for="subject">
				<i class="fa fa-bars" aria-hidden="true" style="color:#999999"></i>
             <span style="color:#999999">개인정보 수집 및 이용동의<strong>(필수)</strong></span>
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			  <input type="checkbox" name="subject" value="1" required oninput="selectItem();" style="zoom: 1.5;">
			</label>
			<label for="subject">
			<i class="fa fa-bars" aria-hidden="true" style="color:#999999"></i>
		     <span style="color:#999999">개인정보 제3자 제공 동의<strong>(필수)</strong></span>
		     &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; &nbsp;&nbsp;  &nbsp;
			  <input type="checkbox" name="subject" value="2" required oninput="selectItem();" style="zoom: 1.5;">
			</label>
			<hr>

              </div>
              </div>
              </form>

	
    <!--예약 버튼 -->
      <input type="hidden" name="packageNo" value="${packageVo.packageDto.packageNo}">
      <input type="hidden" name="packageTotalPrice" value="${(packageVo.stayDto.stayPrice)*4 + (packageVo.fieldDto.fieldGreenfee)*4}">
      <input type="hidden" name="quantity" value="1" min="1" required>  
      		<div class="row justify-content-center mt-5 mb-1">
        <button  class="btn btn-success"  style="width:35%; font-size: 17px;">예약하기(현장결제)</button>
        </div>
      </form>
      
          <!--선결제 페이지 이동 버튼 -->
    <form method="post" action="package_purchase">
      <input type="hidden" name="packageNo" value="${packageVo.packageDto.packageNo}">
      <input type="hidden" name="packageTotalPrice" value="${(packageVo.stayDto.stayPrice)*4 + (packageVo.fieldDto.fieldGreenfee)*4}">
      <input type="hidden" name="quantity" value="1" min="1" required>
      	<div class="row justify-content-center mt-3 mb-5">
        <a href="${root}/package/package_purchase?packageNo=${packageVo.packageDto.packageNo}" style="color:white; font-size: 17px; width:35%; " class="btn" >선결제하기</a>
       </div>
      </form>
      </div>
      
</form>
    </div>
    </section>
    </div>
    

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
