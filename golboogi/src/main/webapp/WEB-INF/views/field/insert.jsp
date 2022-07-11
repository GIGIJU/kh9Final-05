<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 프로필 이미지를 추가하기 위해 enctype을 multipart/form-data로 변경 -->
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="insert" method="post" enctype="multipart/form-data">
	<div class="container w450 m30">
	    <div class="row center">
	        <h1>회원가입</h1>
	    </div>
	    <div class="row">
	        <label>골프장명</label>
	        <input type="text" name="fieldName" autocomplete="off" placeholder=""   class="form-input fill input-round">
	    </div>
	    
	    <div class="row">
	        <label>소개글</label>
	        <input type="text" name="fieldInfo"   placeholder="" class="form-input fill input-round" autocomplete="off">
	    </div>
	    <div class="row">
	        <label>대표전화</label>
	        <input type="tel" name="fieldPhone" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	    <div class="row">
	        <label>주소</label><br>
	        <input type="text" name="fieldPost" size="6" maxlength="6" placeholder="우편번호" class="form-input input-round" autocomplete="off">
	        <a href="#" class="link link-btn">검색</a>
	    </div>
	    <div class="row">
	        <input type="text" name="fieldBasicAddress" placeholder="기본주소" class="form-input fill input-round" autocomplete="off">
	    </div>
	    <div class="row">
	        <input type="text" name="fieldDetailAddress" placeholder="상세주소" class="form-input fill input-round" autocomplete="off">
	    </div>
	    
	     <div class="row">
	        <label>캐디피</label>
	        <input type="number" name="fieldCaddiefee"   placeholder="" class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>
	            카트피
	            <input type="number" name="fieldCartfee"   placeholder="한글, 숫자 10자 이내" autocomplete="off" class="form-input fill input-round">
	        </label>
	    </div>
	    <div class="row">
	        <label>그린피</label><br>
	        <input type="number" name="fieldGreenfee"   class="form-input input-round" autocomplete="off">
	    </div>
	    
	    
	    
	    <div class="row">
	        <label>개장일</label><br>
	        <input type="date" name="fieldOpenday"   class="form-input input-round" autocomplete="off">
	    </div>	 
	    <div class="row">
	        <label>선결제여부</label><br>
	        <select name="fieldPrepay" class="selectpicker">
		        	<option value="1" selected>Y</option>
		        	<option value="0">N</option>
	        </select>
	    </div>
	    <div class="row">
	        <label>골프장지역</label><br>
	        <input type="text" name="fieldArea" class="form-input input-round" autocomplete="off">
	    </div>
	    
	   
	    <div class="row">
	    	<label>프로필 이미지</label><br>
	    	<input type="file" name="fieldProfile" class="form-input input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">회원가입</button>
	    </div>
	</div>
</form>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>