<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <h1>기본 웹소켓</h1>
<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	// websocket 생성
    const websocket = new WebSocket("ws://localhost:8080/ws/chat");
    websocket.onmessage = onMessage;	// 소켓이 메세지를 받을 때
    websocket.onopen = onOpen;		// 소켓이 생성될때(클라이언트 접속)
    websocket.onclose = onClose;	// 소켓이 닫힐때(클라이언트 접속해제)

    //on exit chat room
    function onClose(evt) {
    console.log("close event : " + evt);
    }

    //on entering chat room
    function onOpen(evt) {
    console.log("open event : " + evt);
    }

    // on message controller
    function onMessage(msg) {
    var data = JSON.parse(msg.data); // msg를 받으면 data 필드 안에 Json String으로 정보가 있음
    // 필요한 정보를 Json data에서 추출
     var senderId = data.senderId;
     var message = data.message;
     var time = data.time;
     var newOne = data.newOne;
     var outOne = data.outOne;
    }
    
    // send a message
    function send(){
    var message = document.getElementById("msg").value;
    
    // don't send when content is empty
    // 채팅 입력 칸이 비어있지 않을 경우만 정보를 Json형태로 전송
    if(message != "") {			
	let msg = {
   	'receiverId' : receiverId,
    	'message' : message
      	}

    	if(message != null) {
    	websocket.send(JSON.stringify(msg));	// websocket handler로 전송(서버로 전송)
    	}
    	document.getElementById("msg").value = '';
 	}
}

</script>
