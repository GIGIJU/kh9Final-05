<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />


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
	let result = false;
	if (!$("#agree1").is(":checked")) {
		alert("개인정보 수집 및 이용에 동의해주세요.");
		return false;
	} else if (!$("#agree2").is(":checked")) {
		alert("개인정보 제3자 제공에 동의해주세요.");
		return false;
	} else if ($("#packageDepart").val() == "") {
		alert("일정을 선택하세요");
		$("#packageDepart").focus();
		return false;
	}
    let reserveDate = Number($("#packageDepart").val().replace(/-/gi, ""));
    let date = new Date();
    let year = String(date.getFullYear());
    let month = (date.getMonth() + 1);
    month = month < 10 ? "0" + month : String(month);
    let day = date.getDate();
    day = day < 10 ? "0" + day : String(day);
    let today = Number(year + month + day);
    if (reserveDate > today) {
    	$.ajax({
    		async:false,
    		url:"${root}/package/reserveConfirm",
    		data:{"packageDepart":$("#packageDepart").val()},
    		type:"post",
    		dataType:"json",
    		success:function(data) {
    			console.log("success", data);
    			if (data.count == 0) {
    				alert("약관에 동의하셨습니다.");
    		    	result = true;
    			} else {
    				alert("이미 예약된 날짜입니다.");
    				result = false;
    			}
    		},
    		error:function(xhr, status, res) {
    			//console.log("error", xhr, status, res);
    			result = false;
    		}
    	});
    } else {
    	alert("오늘 이후 날짜만 예약이 가능합니다.");
    	result = false;
    }
    console.log("result", result);
    return result;
}


</script>

<script>
    $(function(){
        //var swiper = new Swiper("선택자", {옵션});
        var swiper = new Swiper('.swiper', {
            loop: true,//순환 모드

            //자동재생
            //autoplay:true,
            autoplay:{
                delay : 5000,//슬라이드 자동재생 시 교체시간(ms)
            },

            //이펙트 효과 지정
            effect : 'slide',

            // Swiper에서 내부적으로 사용할 영역을 지정
            pagination: {
                el: false,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            // scrollbar: {
            //     el: '.swiper-scrollbar',
            // },
        });            
    });
    
   
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
<section class="ftco-intro ftco-section ftco-no-pt">
	<form id="reserveform" method="post"  action="package_purchase"" onsubmit="return chk();">
		<div class="container">
			<div class="row justify-content-center">
				<div class="text-center mt-5 mb-5">
					<h3 style="font-weight: bold;">예약 신청</h3>
				</div>
			</div>
			<div class="row justify-content-center tour-product-info">
				<div class="product-info-item2" >
					<div class="product-info-title" >
						<h5 style="color: #000; font-weight: bold;">상품 정보</h5>
					</div>
					<div class="item-cont">
						<h2 style="color:#17a2b8">${packageVo.stayDto.stayName}</h2>
						<hr>
						<p>• 일정을 선택하세요 </p>
						<input type="date" id="packageDepart" name="packageDepart" style="width:60%;" min="" max="">
						<p>• 기간 : 1박2일</p>
						<p>• 지역 : ${packageVo.stayDto.stayLocal}</p>
					</div>
					<div class="item-cont">
						<div class="img-box">
							<c:choose>
					<c:when test="${empty list}">
						<div class="swiper-slide">
							<img src="${root}${profileUrl}" style="width: 300px; height: 300px; border-radius: 70%;">
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="attach" items="${list}">
							<div class="swiper-slide">
								<img src="${root}${profileUrl}${attach.attachmentNo}" style="width: 300px; height: 300px; border-radius: 70%;">
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center tour-product-info">
				<div class="product-info-item2 " >
					<div class="product-info-title " >
						<h5 style="color: #000; font-weight: bold;">신청 정보</h5>
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
			  <input type="checkbox" id="agree1" name="subject" value="1" oninput="selectItem();" style="zoom: 1.5;">
			</label>
			<label for="subject">
			<i class="fa fa-bars" aria-hidden="true" style="color:#999999"></i>
		     <span style="color:#999999">개인정보 제3자 제공 동의<strong>(필수)</strong></span>
		     &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; &nbsp;&nbsp;  &nbsp;
			  <input type="checkbox" id="agree2" name="subject" value="2"oninput="selectItem();" style="zoom: 1.5;">
			</label>
			<hr>

              </div>
              </div>

	
    <!--예약 버튼 -->
      <input type="hidden" name="packageNo" value="${packageVo.packageDto.packageNo}">
      <input type="hidden" name="packageTotalPrice" value="${(packageVo.stayDto.stayPrice) + (packageVo.fieldDto.fieldGreenfee)*4}">
      <input type="hidden" name="quantity" value="1" min="1" required>  
      		<div class="row justify-content-center mt-5 mb-1">
        <button  type="submit" form="reserveform" class="btn btn-success"  style="width:35%; font-size: 17px;">결제하기</button>
        </div>
      </form>
      
    </div>
    </section>
    </div>
    

    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
