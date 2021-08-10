<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
	#meal{background-color: #124352;}
</style>
<script>
	$(function(){
		$("#addMeal").on("click",function(){
			location.href = "/meal/addmeal";
		})

		$("#download").on("click",function(){
			location.href = "/meal/excelDowload?month=08";
		})
		
      	$("#search").on("keydown",function(e){
        	if(e.keyCode==13 && e.shiftKey == false){ 
            	let keyword = $("#search").val();
              	
            	location.href = "/meal/searchlist?keyword=" + keyword;
            	
                return false;
        	}
      	})
	})
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
    
    <!-- 메인 -->
    <div class="container p-5">
		<div class="row m-0">
	        <div class="col-12 col-sm-6 col-md-6 col-lg-3 p-0 pt-1" style="text-align: left;">
	          <div class="input-group" style="text-align: left;">
	            <div class="input-group-prepend">
	              <span class="input-group-text"><i class="fas fa-search"></i></span>
	            </div>
	            <input type="search" class="form-control" aria-label="Amount (to the nearest dollar)" id="search">
	          </div>
	        </div>
	        <div class="col-sm-6 col-md-6 col-lg-2 p-0 pt-1 pl-2" style="text-align: left;">
	          <button class="btn btn-secondary" id="addMeal">식단 추가</button>
	        </div>
	        <div class="col-sm-12 col-md-6 col-lg-3 pl-4">
	          <h1 style="text-align: left;">&lt; &nbsp; 7월 &nbsp; &gt;</h1>
	        </div>
	        <div class="col-12 col-sm-12 col-md-6 col-lg-4 p-0 pt-1" style="text-align: right;">
	          <button class="btn btn-secondary">액셀 업로드</button>
	          <button class="btn btn-secondary" id="download">엑셀 다운로드</button>
	        </div>
		</div>
    </div>
    
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>