<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
    *{text-align: center;}
    #navibar{
        background-color:/* #325288;*/ #114E60;
        border-bottom:4.5px solid #dff1e4 ;
    }
    #naviimg{height:50px;}
    .nav-item{height:75px;padding-left: 12px;padding-right: 12px;}
    .nav-item>a{color:#FDFAF6;}
    .nav-item>a{color:#FDFAF6;}
    #mypage{color:#FDFAF6;}
    .active{background-color: #124352;}
    

</style>
</head>
<body>
   <!-- 네비바 -->
    <nav class="navbar navbar-expand-lg navbar-dark p-0 pl-2 pr-2" id="navibar">
        <a class="navbar-brand p-2 mr-5" href="/">
            <img src="<spring:url value='/resources/img_home/logo02_dark.png'/>" id="naviimg">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="line-height:60px;">
          <ul class="navbar-nav mr-auto" style="display: flex;">
            <li class="nav-item" id="main">
              <a class="nav-link" href="/" style="color:#FDFAF6;">메인</a>
            </li>
            <li class="nav-item" id="meal">
              <a class="nav-link" href="meal/main" style="color:#FDFAF6;">식단관리</a>
            </li>
            <li class="nav-item dropdown" id="chat">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#FDFAF6;">메신저</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/chat/findFriend">친구 찾기</a>
                    <a class="dropdown-item" href="/chat/myChat">내 채팅방</a>
                </div>
            </li>
            <li class="nav-item" id="free">
                <a class="nav-link" href="#" style="color:#FDFAF6;">자유게시판</a>
            </li>
            <li class="nav-item" id="mail">
                <a class="nav-link" href="#" style="color:#FDFAF6;">메일</a>
            </li>
            <li class="nav-item" id="stats">
                <a class="nav-link" href="#" style="color:#FDFAF6;">통계</a>
            </li>
        </ul>
          <form class="form-inline my-2 my-lg-0 dropdown" id="loginNavi">
            <a class="nav-link dropdown-toggle" id="mypage" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-left dropdown-menu-lg-right"  aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="#">프로필 수정</a>
                <a class="dropdown-item" href="#">회원정보 수정</a>
                <a class="dropdown-item" href="#">로그아웃</a>
            </div>  
          </form>
        </div>
    </nav>

</body>
</html>