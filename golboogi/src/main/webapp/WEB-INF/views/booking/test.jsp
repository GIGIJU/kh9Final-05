x<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  <DraggableCal />
</div>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/vue-draggable-call"></script>
<script>
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성해둔다
    data(){
        return {
           
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    //- 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    //- 반드시 return을 통해 값을 반환해야 한다
    computed:{

    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{

    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{

    },
});
app.mount("#app");
</script>
</body>
</html>