<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
<br><br><br><br><br><br><br><br><br><br><br><br><br>

<form action="insert" method="post" enctype="multipart/form-data">
	<div class="container w450 m30">
	    <div class="row center">
	        <h1>숙소 정보 등록이요이!</h1>
	    </div>
	    <div class="row">
	        <label>숙소명</label>
	        <input type="text" name="stayName" autocomplete="off" placeholder=""   class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>숙소 타입</label>
	       	<select name="stayType" class="selectpicker">
	       		<option value="리조트">리조트</option>
	       		<option value="호텔">호텔</option>
	       		<option value="펜션">펜션</option>
	       	</select>
	    </div>
	    <div class="row">
	        <label>대표전화</label>
	        <input type="tel" name="stayPhone" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	    <div class="row">
	        <label>객실타입</label><br>
	        <select name="stayRoom" class="selectpicker">
	       		<option value="4인1실" selected>4인실</option>
	       	</select>
	    </div>
	    
	    <div>
	    		<label>가격</label>
	    		<input type="number" name="stayPrice" class="form-input fill input-round">
	    </div>
	    
	    <div class="row">
	        <label>주소</label><br>
	        <input type="text" name="stayPostAddress" size="6" maxlength="6" placeholder="우편번호" class="form-input input-round" autocomplete="off">
	        <a href="#" class="link link-btn">검색</a>
	    </div>
	    <div class="row">
	        <input type="text" name="stayBasicAddress" placeholder="기본주소" class="form-input fill input-round" autocomplete="off">
	    </div>
	    <div class="row">
	        <input type="text" name="stayDetailAddress" placeholder="상세주소" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	    <div class="row">
	        <label>숙소지역</label><br>
	        <select name="stayLocal" class="selectpicker">
	       		<option value="경기도">경기도</option>
	       		<option value="강원도">강원도</option>
	       		<option value="전라도">전라도</option>
	       		<option value="경상도">경상도</option>
	       		<option value="제주도">제주도</option>
	       	</select>
	    </div>
	    
	    <div class="row">
	    	<label>프로필 이미지</label><br>
	    	<input type="file" name="stayProfile" class="form-input input-round">
	    </div>
	    
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">숙소등록</button>
	    </div>
	</div>
</form>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>