<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '${detail.content}',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  // Summernote에 글 내용 추가하는 코드
	  $("#summernote").summernote('code',  '${detail.content}');
	});
</script>
<script>
	$(function(){
		$("#backView").on("click",function(){
			location.href="/bod/viewProc?seq=${list.seq}";
		})
	})
</script>
</head>
<body>
<h2 style="text-align: center;">글 수정</h2><br><br>

	<div class="container col-md-6" >
		<form action='<c:url value='/bod/modifyProc'/>' method="post">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					style="width: 40%;" class="form-control" id="exampleFormControlInput1" name="title"
					value="${detail.title }">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">작성자</label> <input type="text"
					style="width: 20%;" class="form-control" id="exampleFormControlInput1" name="writer"
					value="${detail.writer }" readonly>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea class="form-control" id="summernote"
					rows="10" name="content">${detail.content }</textarea>
			</div>
			<input type="hidden" name="seq" value="${detail.seq }">
			<input type="hidden" name="write_date" value="${detail.write_date }">
			<input type="hidden" name="view_count" value="${detail.view_count -1}">
			<button type="submit" class="btn btn-info" style="float: right;">수정하기</button>
			<a href='<c:url value='/bod/viewProc?seq=${detail.seq }'/>' class="btn btn-secondary"
					role="button">뒤로가기</a>
		</form>
	</div>
</body>
</html>