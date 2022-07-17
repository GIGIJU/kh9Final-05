<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--    
//     String name = (String)request.getAttribute("name");
//     String email = (String)request.getAttribute("email");
//     String phone = (String)request.getAttribute("phone");
//     String address = (String)request.getAttribute("address");
//     int totalPrice = (int)request.getAttribute("totalPrice");    
--%>

<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- test -->
<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp57370818'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'payment_' + new Date().getTime(),
            name : 'Golboogi 결제',
<%--             amount : <%=totalPrice%>, --%>
<%--             buyer_email : '<%=email%>', --%>
<%--             buyer_name : '<%=name%>', --%>
<%--             buyer_tel : '<%=phone%>', --%>
<%--             buyer_addr : '<%=address%>', --%>
            amount : 100000,
            buyer_email : 'buyer@naver.com',
            buyer_name : '구매자',
            buyer_tel : '01044445555',
            buyer_addr : '서울 양천구 신월동',
            buyer_postcode : '123-456'
<%--             m_redirect_url: '<%=request.getContextPath()%>/pay/finish' --%>
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "<%=request.getContextPath()%>/pay/finish", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/pay/finish?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/pay/fail";
                alert(msg);
            }
        });
        
    });
    </script>
 

<!-- 헤더 밑 이미지 타이틀 세션 -->
<section class="hero-wrap hero-wrap-2" style="background-image: url('${root}/images/img_home_title_booking.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center" style="height: 300px;">
      <div class="col-md-9 ftco-animate pb-5 text-center">
       <p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>pay<i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">pay</h1>
     </div>
   </div>
 </div>
</section>

<section>
	<div class="container">
		<h1> 결제 진행 중 </h1>
	</div>
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>