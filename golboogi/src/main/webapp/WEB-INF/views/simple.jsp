<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>수정22</h1>
<h1>간단한 텍스트 전송</h1>

<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>
<hr>
<input type="text" class="send-input">
<button class="btn-send">전송</button>

<!-- 메세지 출력 공간 -->
<div class="message-wrapper"></div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		disconnectOperation();
		
		$(".btn-connect").click(function(){
			//주소 자동 계산
			var uri = "ws://";
			uri += location.host;
			uri += "${pageContext.request.contextPath}";
			uri += "/ws/simple";
			
			//접속
			socket = new WebSocket(uri);
			
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
				var div = $("<div>").addClass("message").text(e.data);
				$(".message-wrapper").append(div);
			};
			
		});
		
		$(".btn-disconnect").click(function(){
			socket.close();
		});
		
		$(".btn-send").click(function(){
			var text = $(".send-input").val();
			if(!text) return;
			
			socket.send(text);
			
			$(".send-input").val("");
		});
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", true);//연결버튼 비활성화
			$(".btn-disconnect").prop("disabled", false);//종료버튼 활성화
			$(".send-input").prop("disabled", false);//입력창 활성화
			$(".btn-send").prop("disabled", false);//전송버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", false);//연결버튼 활성화
			$(".btn-disconnect").prop("disabled", true);//종료버튼 비활성화
			$(".send-input").prop("disabled", true);//입력창 비활성화
			$(".btn-send").prop("disabled", true);//전송버튼 비활성화
		}
	});
</script>