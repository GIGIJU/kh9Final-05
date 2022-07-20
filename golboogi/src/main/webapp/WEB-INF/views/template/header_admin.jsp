<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminId" value="${adminLogin}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="ko">
    <head>
    	<link href="${root}/images/favicon-logo.png" rel="icon">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>golboogi_manager</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${root}/css_manager/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
        <!-- 다음 주소 검색 API -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>
    
    <body class="sb-nav-fixed">
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${root}/">
            		<img src="${root}/images/golboogi-logo.png" width="160" height="50">
            </a>
            
            <!-- Sidebar Toggle / 햄버거 메뉴 -->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        </nav>
        
        <!-- 사이드바 레이아웃 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">회원관리메뉴</div>
                            <a class="nav-link" href="${root}/admin/member_list">
                                일반회원목록
                            </a>
                            <a class="nav-link" href="${root}/admin/list">
                                골프장관리자목록
                            </a>
                            <div class="sb-sidenav-menu-heading">정보등록</div>
                            <a class="nav-link" href="${root}/admin/field_list">
                                골프장 목록
                            </a>
                            <a class="nav-link" href="${root}/admin/stay_list">
                                숙소 목록
                            </a>
                            <a class="nav-link" href="${root}/admin/package_list">
                                패키지 목록
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">반갑습니다 <i class="fa-solid fa-face-smile"></i></div>
                        ${adminId}님
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            		<main>