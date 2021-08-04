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
  
  본인바디 영역 컨테이너주고 그안에서 하시면 됩니다<br><br>
  
   스타일은 선택자 지정할 때 무조건 가장큰 부모 컨테이너를 잡고 <br><br>
  
  
  .나만의클래스이름 (자손중) .스타일줄아이 {<br>
  스타일스티일<br>
  }<br><br>
  
  이렇게 지정해주시면 됩니당 그래야 나중에 안엉키고 좋다고합니당<br>
  
  이기본 JSP틀은복붙!!<br><br>
  
  
  
  
   
   <jsp:include page="../layout/footer.jsp"/>
  
</body>
</html>