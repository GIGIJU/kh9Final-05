<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
    <title>VueJs</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/cosmo/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    <style>

    </style>
</head>
<body>
    <!--특정 영역을 생성하여 이 부분만 vue로 제어한다-->
    <div id="app">
    	<div>
    	<h1>DraggableCal</h1>
     	<DraggableCal @selectedDate="doSomething($event)"></DraggableCal>    	
    	</div>
    </div>
    
    <!--vue jis도 lazy loading을 사용한다-->
    <script src="http://unpkg.com/vue@next"></script>
    <script src="https://unpkg.com/vue-draggable-cal"></script>
	<script>
	new Vue({
	  	el: '#app',
	  	components: {
		    DraggableCal,
		  }
		})
	</script>
</body>
</html>