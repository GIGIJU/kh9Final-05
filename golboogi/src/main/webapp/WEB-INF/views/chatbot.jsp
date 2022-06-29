<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>챗봇 예제</h1>

<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>
<hr>

<!-- 메세지 출력 공간 -->
<div class="message-wrapper"></div>
<button class="btn-prev">뒤로가기</button>


<style>
	.btn-message {
		display:block;
		margin: 10px 0px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		disconnectOperation();//최초 상태 설정
		
		//이전 질문 저장소 구현
		var memory = [];
		
		$(".btn-connect").click(function(){
			//주소 자동 계산
			var uri = "ws://";
			uri += location.host;
			uri += "${pageContext.request.contextPath}";
			uri += "/ws/chatbot";
			
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
				$(".message-wrapper").empty();//다지워
				
				//console.log(e.data);
				//console.log(typeof e.data);
				
				//서버에서 온 값이 string이므로 이를 자바스크립트 객체 형식으로 변환해야 한다
				// - JSON.parse(문자열) --> 객체
				// - JSON.stringify(객체) --> 문자열
				var data = JSON.parse(e.data);
				//console.log(data);
				
				for(var i=0; i < data.length; i++){
					//console.log(data[i]);
					//태그를 만들어서 영역 내에 배치
					var button = $("<button>").addClass("btn-message")
																.text(data[i].chatbotContent)
																.attr("data-chatbot-no", data[i].chatbotNo);
					if(data[i].count > 0){//답변이 있을 때만 클릭이벤트를 부여
						button.click(function(){//클릭하면 서버로 번호를 전송
							var chatbotNo = $(this).attr("data-chatbot-no");
							sendMessage(chatbotNo);
							memory.push(chatbotNo);
							//console.log(memory);
						});
					}
					$(".message-wrapper").append(button);
				}
			};
			
		});
		
		$(".btn-disconnect").click(function(){
			socket.close();
		});
		
		$(".btn-prev").click(function(){
			var chatbotNo = memory.pop();//pop()은 마지막 요소를 제거하여 반환
			console.log(memory, memory.length);
			if(memory.length > 0){//memory에 남은게 있다면 마지막 항목 화면을 요청
				sendMessage(memory[memory.length-1]);
				//sendMessage(memory.slice(-1));
			}
			else {//memory에 남은게 없다면 첫화면을 요청
				sendMessage(0);
			}
		});
		
		function sendMessage(text){
			if(text === "" || text === undefined || text === null) return;
			socket.send(text);
		}
		function connectOperation(){//연결되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", true);//연결버튼 비활성화
			$(".btn-disconnect").prop("disabled", false);//종료버튼 활성화
			$(".btn-prev").prop("disabled", false);//뒤로가기 활성화
			$(".btn-prev").show();
		}
		function disconnectOperation(){//연결 종료되면 처리할 화면 작업을 구현
			$(".btn-connect").prop("disabled", false);//연결버튼 활성화
			$(".btn-disconnect").prop("disabled", true);//종료버튼 비활성화
			$(".btn-prev").prop("disabled", true);//뒤로가기 비활성화
			$(".btn-prev").hide();
		}
	});
</script>