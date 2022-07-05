<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원 전용 웹소켓</h1>

<input type="text" class="send-input">
<button class="btn-send">전송</button>

<!-- 메세지 출력 공간 -->
<div class="message-wrapper"></div>

<style>
	.message-wrapper > .message {
		display:flex;
	}
	.message-wrapper > .message.admin {
		color:red;
	}
	.message-wrapper > .message > .user {
		padding:0.25em;
		min-width:150px;
	}
	.message-wrapper > .message > .text {
		padding:0.25em;
		flex-grow: 1;
	}
	.message-wrapper > .message > .time {
		padding:0.25em;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>

<script>
	$(function(){
		disconnectOperation();
		
		
		//주소 자동 계산
			var uri = "${pageContext.request.contextPath}/ws/memberonly";

			
			//접속
			socket = new SockJS(uri);
			
			socket.onopen = function(e){
				connectOperation();
			};
			socket.onclose = function(e){
				disconnectOperation();
			};
			socket.onerror = function(){
				alert("서버와의 연결 오류가 발생하였습니다");
				disconnectOperation();
			};
			socket.onmessage = function(e){
				//console.log(e.data, typeof e.data);
				var data = JSON.parse(e.data);//json을 객체로 복구
				//var timeObject = new Date(data.time);//날짜 객체로 변환(표준 API)
				var timeObject = moment(data.time).format("YYYY-MM-DD hh:mm:ss");//날짜 객체로 변환(momentJS)
				
				var div = $("<div>").addClass("message");
				if(data.auth == "관리자"){
					div.addClass("admin");
				}
				
				var span1 = $("<span>").addClass("user").text(data.memberId);
				var span2 = $("<span>").addClass("text").text(data.text);
				var span3 = $("<span>").addClass("time").text(timeObject);
				
				div.append(span1).append(span2).append(span3);
				$(".message-wrapper").append(div);

		
		$(".btn-send").click(function(){
			var text = $(".send-input").val();
			if(!text) return;
			
			socket.send(text);
			
			$(".send-input").val("");
		});
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false);//입력창 활성화
			$(".btn-send").prop("disabled", false);//전송버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true);//입력창 비활성화
			$(".btn-send").prop("disabled", true);//전송버튼 비활성화
		}
	});
</script>