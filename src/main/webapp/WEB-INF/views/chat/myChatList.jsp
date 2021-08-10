<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 채팅방</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script>
   $(function(){
      AOS.init();
      $("#main").addClass("active");
   })
</script>
<style>

    

</style>
</head>
<body>
  <jsp:include page="../layout/header.jsp"/>
  <div class="container p-3" id="container">
		<div class="row m-0 header">
            <div class="col-12 box_title"><h4 id="title">나랑 채팅한 사람 목록</h4></div>
        </div>
   </div>
   
   <jsp:include page="../layout/footer.jsp"/>
  
</body>
</html>