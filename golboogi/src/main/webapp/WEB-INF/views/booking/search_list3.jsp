<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
span {
	font-size: 11px;
	color: black;
}
p {
	font-size: 11px;
}
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
.comment-list li {
    padding: 30px 30px 10px 30px;
    float: left;
    width: 100%;
    clear: both;
    list-style: none;
    background-color: #f1f2f6;
    border: #dfe4ea solid 1px;
}
</style>
<div id="app">
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('${root}/images/bg_1.jpg');">
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center"
			style="height: 300px;">
			<div class="col-md-9 ftco-animate pb-5 text-center">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
					<span>search <i class="fa fa-chevron-right"></i></span>
				</p>
				<p class="mb-0" style="font-size: 17px">부킹, 모든 골프장 예약은 골북이로 통합니다.</p>
			</div>
		</div>
	</div>
</section>


<div class="container-fluid">
	<div class="row"> <!-- v-if="checkTeeTimeD" --><!-- <button @click="checkTeeTimeD">d</button> -->
		<!-- 왼쪽 -->
		<div class="col-lg-3 sidebar ftco-animate bg-light py-md-5">
			<div id="datepicker" v-model="teeTimeD"></div>
		</div>
		<!-- 오른쪽 -->
		<div class="col-lg-9 ftco-animate py-md-5 mt-5">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
					<div class="text-center"><h3 class="mb-5" style="font-size: 20px; font-weight: bold;">${param.teeTimeD}</h3></div>			
						<ul class="comment-list">
							<c:forEach var="teetimeVO" items="${list}" varStatus="status">
								<li class="comment mb-4">
									<div class="vcard bio">
										<img src="${root}/images/golf-dummy.jpg" style="height: 70px; width: 70px;">
									</div>
									<div class="comment-body">
										<h3>${teetimeVO.fieldName}</h3>
										<div class="meta" style="font-size: 9px">
											<span><i class="fa-solid fa-location-dot"></i> ${teetimeVO.fieldArea}</span>
											<span> [~<fmt:formatNumber value="${teetimeVO.fieldGreenfee-20000}" />]</span>
										</div>
										<p>
											<a class="reply" @click="showTeetime(${teetimeVO.fieldNo},${status.index} )">${teetimeVO.count}개 예약 가능시간 보기</a>
										</p>
									</div>
									<div class="comment-body" v-show="teeTimeDiv">
										<button class="tagcloud" v-for="(time,index) in teeTimeList[${status.index}]" v-bind:key="index" style="width: 50px"
										@click="locationReserve(index)">
										{{time.teeTimeT}}
										</button>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
<!--vue jis도 lazy loading을 사용한다-->
<script src="http://unpkg.com/vue@next"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
            data(){
                return {
                	teeTimeD:"${param.teeTimeD}",
                	teeTimeList:[],
                	teeTimeDiv:false,
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            //- 반드시 return을 통해 값을 반환해야 한다
            computed:{
				
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
            	showTeetime(fieldNo,index){
            		this.teeTimeDiv = !this.teeTimeDiv;
            		if(this.teeTimeDiv){
            		const urlParams = new URL(location.href).searchParams;
            		const fieldArea = urlParams.get('fieldArea');
            		const PartTime = urlParams.get('PartTime');
            		const fieldGreenfee = urlParams.get('fieldGreenfee');

             		axios({
                         url:"${root}/rest/booking",
                         method:"post",
                         params: {
                        	 fieldNo : fieldNo,
                        	 teeTimeD : this.teeTimeD,
                        	 fieldArea : fieldArea,
                        	 PartTime : PartTime,
                        	 fieldGreenfee : fieldGreenfee,
                         }
                     })
                     .then(resp=>{
                         console.log(resp.data);
                         this.teeTimeList.push(resp.data);
                     })
            		}
             	},
             	checkTeeTimeD(){
             		/* const now = new Date();
             		var year = js_date.getFullYear();
                    var month = js_date.getMonth() + 1;
                    var day = js_date.getDate()+60; */
                    console.log("2달 뒤",new Date(Date.parse(Now) + 30 * 1000 * 60 * 60 * 24));
             	},
             	locationReserve(index){
             		//console.log(this.teeTimeList.index.fieldName);
             		window.location.href= "${root}/booking/reservation?teeTimeD="+this.teeTimeD+"&teeTimeNo=940";
             	}
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{

            },
            mounted(){
            	$.datepicker.setDefaults({
                    showMonthAfterYear: true,
                    changeMonth: true,
                    dateFormat: "yy-mm-dd",
                    nextText: "다음달",
                    prevText: "이전달",
                    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                    monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8",
                        "9", "10", "11", "12"
                    ],
                    minDate: '+1D',
                    maxDate: '+60D',
                    onSelect:(dateText)=>{
                    	window.location.href="http://localhost:8080/booking/search?teeTimeD="+dateText;
                    },
                });
                $("#datepicker").datepicker(); 
            }, 
            created(){
      
            },
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>