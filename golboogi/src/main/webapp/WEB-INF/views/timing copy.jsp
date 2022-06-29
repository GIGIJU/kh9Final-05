<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>웹소켓 시점 확인 예제</h1>

<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		disconnectOperation();//최초 상태 설정
		
		//1
		$(".btn-connect").click(function(){
			//주소 설정(프로토콜부터 작성해야 한다)
			//var uri = "ws://localhost:8080/spring19/ws/timing";
			
			//주소 자동 계산
			var uri = "ws://";
			uri += location.host;
			uri += "${pageContext.request.contextPath}";
			uri += "/ws/timing";
			
			//접속 - 자바스크립트 표준 API 사용
			//window.socket = new WebSocket(uri);
			socket = new WebSocket(uri);
			
			//console.log(socket);
			//socket에 내장되어있는 이벤트들을 사용하도록 설정해야 한다
			//- onopen, onclose, onerror, onmessage
			socket.onopen = function(e){
				//console.log(arguments);
				connectOperation();
			};
			socket.onclose = function(e){
				//console.log(arguments);
				disconnectOperation();
			};
			socket.onerror = function(){
				//console.log(arguments);
				alert("서버와의 연결 오류가 발생하였습니다");
				disconnectOperation();
			};
			
		});
		
		//2
		$(".btn-disconnect").click(function(){
			//연결을 종료하려면 연결 정보를 가진 객체가 필요하다
			//window.socket.close();
			socket.close();
		});
		
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", true);//연결버튼 비활성화
			$(".btn-disconnect").prop("disabled", false);//종료버튼 활성화
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", false);//연결버튼 활성화
			$(".btn-disconnect").prop("disabled", true);//종료버튼 비활성화
		}
	});
</script>