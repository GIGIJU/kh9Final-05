<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>웹소켓 시점</h1>

<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		disconnectOperation();
		
		//1
		$(".btn-connect").click(function(){

			var uri = "ws://";
			uri += location.host;
			uri += "${pageContext.request.contextPath}";
			uri += "/ws/timing";
			
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
			
		});
		
		$(".btn-disconnect").click(function(){
			socket.close();
		});
		
		function connectOperation(){
			$(".btn-connect").prop("disabled", true);
			$(".btn-disconnect").prop("disabled", false);
		}
		function disconnectOperation(){
			$(".btn-connect").prop("disabled", false);
			$(".btn-disconnect").prop("disabled", true);
		}
	});
</script>