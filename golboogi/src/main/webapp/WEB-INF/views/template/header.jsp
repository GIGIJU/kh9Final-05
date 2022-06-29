<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <title>golboogi</title>
  <link href="${root}/images/favicon-logo.png" rel="icon">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="${root}/css/animate.css">
  
  <link rel="stylesheet" href="${root}/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${root}/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${root}/css/magnific-popup.css">

  <link rel="stylesheet" href="${root}/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${root}/css/jquery.timepicker.css">

  
  <link rel="stylesheet" href="${root}/css/flaticon.css">
  <link rel="stylesheet" href="${root}/css/style.css">
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="/"><img src="${root}/images/golboogi-logo.png" width="160" height="50"></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
     </button>

     <div class="collapse navbar-collapse" id="ftco-nav">
       <ul class="navbar-nav ml-auto">
         <li class="nav-item"><a href="${root}/booking/list" class="nav-link">골프부킹</a></li>
         <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
         <li class="nav-item active"><a href="hotel.html" class="nav-link">투어</a></li>
         <li class="nav-item"><a href="blog.html" class="nav-link">게시판</a></li>
         <li class="nav-item"><a href="contact.html" class="nav-link">골프장</a></li>
       </ul>
     </div>
   </div>
 </nav>
 <!-- END nav -->
 