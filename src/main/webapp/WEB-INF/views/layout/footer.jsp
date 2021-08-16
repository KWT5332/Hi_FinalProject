<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<style>
    .footer{width:100%;height:35vh;background-color: rgb(40, 40, 40);text-align:center;}
    .footer *{color:lightgray;}
    .footerimg{width: 210px;}
</style>
</head>
<body>
   
    <div class="footer pt-4 pl-5 pb-3">
        <div class="row m-0">
            <div class="col-4 p-2">
                <img src="<spring:url value='/resources/img_home/logo02_dark.png'/>" class="footerimg">
            </div>
            <div class="col-6 p-2">
                <p style="text-align:left;font-size:15px;">
                    항상 영양사님들을 위하는 마음으로<br>
                    홈페이지를 운영합니다.</p>
                <h5 class="mt-4 mb-4" style="text-align:left;">
                    company &nbsp;&nbsp; | &nbsp;&nbsp; Business &nbsp;&nbsp; | &nbsp;&nbsp; Gallery &nbsp;&nbsp; | &nbsp;&nbsp; Contact Us
                </h5>
            </div>
        </div>
        <div class="row m-0">
            <div class="col-12">
                <p class="mt-3 mb-0"style="font-size:small;">
                    Copyright 2021 HI!급식 Corp. All rights reserved
                </p>
            </div>
        </div>
    </div>
</body>
</html>