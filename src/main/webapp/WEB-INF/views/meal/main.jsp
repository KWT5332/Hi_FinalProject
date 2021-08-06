<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단관리</title>
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
	})
</script>
</head>
<body>
 <jsp:include page="../layout/header.jsp"/>
    
    <!-- 메인 -->
    <button id="addMeal">추가</button><br><br>
    <button>액셀 업로드</button>
    <button>엑셀 다운로드</button>
    
 <jsp:include page="../layout/footer.jsp"/>
</body>
</html>