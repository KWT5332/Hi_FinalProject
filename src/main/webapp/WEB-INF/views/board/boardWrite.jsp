<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>글쓰기</title>
<style>
.subBtndiv{text-align:left;}
.listBtndiv{text-align:right;}
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
#subBtn{background-color:#114E60;height:45px;}
#listBtn{height:45px;}
</style>
<script>
$(function(){
	  $('#summernote').summernote({
	    	placeholder: '내용을 입력하세요.',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  })

	$("#listBtn").on("click",function(){
		location.href="/bod/boardList";
	})
})
</script>
</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>
 
	<div class="container p-5 mt-4">
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-12 col-sm-2 p-0" style="text-align:center;"><h1 class="mb-5" id="text">글 작성</h1></div>
			<div class="col-sm-5"></div>
		</div>
	<form method="post" action="/bod/writeProc">
	<div class="row m-0 mb-3">
		<div class="col-2" style="text-align:right;"><h5 class="mb-0" style="line-height:35px;">제 목 : </h5></div>
		<div class="col-10 pr-5">
			<input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." required />
		</div>
	</div>
	<div class="row m-0">
		<div class="col-12">
			<textarea id="summernote" name="content" required></textarea>
		</div>
	</div>
		
		<div class="row m-0 pt-3">
			<div class="col-6 subBtndiv">
				<input id="subBtn" type="submit" value="글 작성하기" class="btn btn-info" onclick="goWrite(this.form)"/>
			</div>
			<div class="col-6 listBtndiv">
				<input id="listBtn" type="button" value="목록으로 돌아가기" class="btn btn-secondary"/>
			</div>
		</div>
	</form>
</div>
	<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
<script>
$('.summernote').summernote({
	  // 에디터 높이
	  height: 150,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        //콜백 함수
        callbacks : { 
        	onImageUpload : function(files) {
      			let editor = this;
      			
      			let file = file[0];
    			var data = new FormData(form);
    			data.append("file", file);
    			
    			$.ajax({
    				data : data,
    				type : "POST",
    				url : "/bod/uploadSummernoteImageFile",
    				contentType : false,
    				enctype : 'multipart/form-data',
    				processData : false,
    				success : function(data) {
    					$(editor).summernote('insertImage', data);
    				}
        		})
		
      		}
		}			
});

</script>
</html>