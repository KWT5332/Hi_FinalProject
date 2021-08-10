<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 검색</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
	#meal{background-color: #124352;}
	#searchList .col-12{border: 1px solid silver;}
</style>
<script>
$(function(){
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
	        <div class="col-12 col-sm-6 col-md-6 col-lg-3 pb-2 " style="text-align: left;">
	          <div class="input-group" style="text-align: left;">
	            <div class="input-group-prepend">
	              	<span class="input-group-text"><i class="fas fa-search"></i></span>
	            </div>
	            <input type="search" class="form-control" aria-label="Amount (to the nearest dollar)" id="search">
	          </div>
	        </div>
	   </div>
	   <div class="row m-0">
	   		<div class="col-12">
	   			<P> '${keyword }' 를 검색한 결과입니다. </P>
	   		</div>
	   </div>

       <div class="pt-3" id="searchList">
		<c:forEach var="list" items="${list }">
			<div class="row m-0 p-2 mb-2">
                <div class="col-12 p-3">
                    <p>${list.school } &nbsp; | &nbsp; ${list.writer } &nbsp; | &nbsp; ${list.meal_date } </p>
                    <h5>
	                    <strong>${list.menu1} , ${list.menu2}
	                    <c:if test="${not empty list.menu3}"> , ${list.menu3}</c:if>
						<c:if test="${not empty list.menu4}"> , ${list.menu4}</c:if>
						<c:if test="${not empty list.menu5}"> , ${list.menu5}</c:if>
						<c:if test="${not empty list.menu6}"> , ${list.menu6}</c:if>
					</strong></h5>
                </div>
            </div>
		</c:forEach>	
        </div>    
    </div>
    
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>