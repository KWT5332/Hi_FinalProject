<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정페이지</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.6.0/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style>
#text{position:relative;}
#text:after{
	content:'';
	display:block;
	width:90%;
	height:15px;
	position:absolute;
	bottom: -2px;
	left:10px;
	background:#dff1e4;
	z-index: -5;
}
#subBtn{background-color:#114E60;height:45px;color:white;}
#backBtn{height:45px;line-height:25px;}
</style>
<script>
	$(function(){
		  $('#summernote').summernote({
	 	    	placeholder: '${detail.content}',
		        minHeight: 370,
		        maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR'
		  });
		  // Summernote에 글 내용 추가하는 코드
		  $("#summernote").summernote('code', '${detail.content}');

		$("#backView").on("click",function(){
			location.href="/bod/viewProc?seq=${list.seq}";
		})
	})
</script>
</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>

	<div class="container p-5">
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-12 col-sm-2 p-0" style="text-align:center;"><h1 class="mb-5" id="text">글 수정</h1></div>
			<div class="col-sm-5"></div>
		</div>
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
			<button type="submit" class="btn" style="float: right;" id="subBtn">수정하기</button>
			<a href='<c:url value='/bod/viewProc?seq=${detail.seq }'/>' class="btn btn-secondary"
					role="button" id="backBtn">뒤로가기</a>
		</form>
	</div>
	<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>