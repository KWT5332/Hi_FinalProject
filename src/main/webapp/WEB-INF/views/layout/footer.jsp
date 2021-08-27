<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<style>
	@font-face {
	    font-family: 'GowunDodum-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	body{font-family:'GowunDodum-Regular';} 
    .footer{width:100%;min-height:220px;background-color:#fff8f4;padding-top:38px;text-align:center;}
    .footer *{color:gray;}
    .footerimg{width:240px;}
	
</style>
</head>
<body>
    <div class="footer pl-5 pb-2">
        <div class="row m-0">
            <div class="col-12 col-sm-5 p-2">
                <img src="<spring:url value='/resources/img_home/logo01_light.png'/>"  class="footerimg">
            </div>
            <div class="col-12 col-sm-6 p-2">
<!--                 <p style="text-align:left;font-size:17px;">
                    항상 영양사님들을 위하는 마음으로 홈페이지를 운영합니다.<br>
                    개선사항이나 문의사항있으시면 언제나 편하게 연락 부탁드립니다.
                  </p> -->
                <P class="mb-4" style="text-align:left;font-size:18px;font-weight: 600;">
                   	항상 영양사님들을 위하는 마음으로 홈페이지를 운영합니다.<br>
                    개선사항이나 문의사항있으시면 언제나 편하게 연락 부탁드립니다.
                </P>
            </div>
        </div>
        <div class="row m-0">
            <div class="col-12">
                <p class="mt-5 mb-0"style="font-size:14px;">
                    Copyright 2021 하이!급식 Corp. All rights reserved
                </p>
            </div>
        </div>
    </div>
</body>
</html>