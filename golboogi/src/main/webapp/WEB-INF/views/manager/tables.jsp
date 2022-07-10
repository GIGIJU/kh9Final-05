<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header_manager.jsp"></jsp:include>
    
<div class="container-fluid px-4">
    <h1 class="mt-4">예약현황</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="${root}/manager/stat/${adminId}">전체현황</a></li>
        <li class="breadcrumb-item active">예약현황</li>
    </ol>
<!--     <div class="card mb-4"> -->
<!--         <div class="card-body"> -->
<!--             DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
<!--             <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
<!--             . -->
<!--         </div> -->
<!--     </div> -->
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>골프장</th>
                        <th>코스명</th>
                        <th>예약자</th>
                        <th>예약일</th>
                        <th>티타임</th>
                        <th>인원수</th>
                        <th>요 금</th>
                        <th>예약상태</th>
                    </tr>
                </thead>
                <tbody>
                		<c:forEach var="golfManagerVO" items="${golfManagerVO}">
                    <tr>
                    		<td>${golfManagerVO.fieldName}</td>
                    		<td>${golfManagerVO.courseName}</td>
                    		<td>${golfManagerVO.bookingName}</td>
                    		<td>${golfManagerVO.bookingDate}</td>
                    		<td>${golfManagerVO.teeTimeD}</td>
                    		<td>${golfManagerVO.bookingPeople}</td>
                    		<td>
                    			₩ <fmt:formatNumber value="${golfManagerVO.bookingPrice}" pattern="#,###"/>
                    		</td>
                    		<td>${golfManagerVO.bookingStatus}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer_manager.jsp"></jsp:include>    