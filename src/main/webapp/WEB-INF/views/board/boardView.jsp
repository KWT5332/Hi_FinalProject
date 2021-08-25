<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
 #btnDelete{background-color:#356979;border:1px solid #356979;}
 #btnUpdate{background-color:rgb(255, 196, 119);border:1px solid rgb(255, 196, 119);}
 .replylist li{position:relative;}
 .replylist li:after{
 	content:'';
	display:block;
	width:105%;
	height:1px;
	position:absolute;
	bottom:-15px;
	left:-20px;
	background:#ddd;
 }
 #comDel{background-color:#356979;border:1px solid #356979;}
 #comUp{background-color:rgb(255, 196, 119);border:1px solid rgb(255, 196, 119);}
 #commentsAdd{background-color:#dff1e4;}
 .paginate_button:hover{background-color:gray;}
 .current{background-color:#ddd;} /* 왜 안돼 ㅡㅡ */
</style>
<script>
window.onload = function() {	 // 밑에 바디영역이 실행되기 전에 실행하기위한 윈도우 온로드	
	$("#btnDelete").on("click", function() { // 글 삭제
		Swal.fire({ 
	    	title:'정말 삭제하시겠습니까?', 
	     	text: "한번 삭제한 게시글은 복구가 불가능합니다.",
	     	icon: 'warning', 
	     	showCancelButton: true, 
	     	confirmButtonColor: '#3085d6', 
	     	cancelButtonColor: '#d33', 
	     	confirmButtonText: '삭제', 
	     	cancelButtonText: '취소' 
	    }).then((result) => {
			if(result.value){
	    		location.href = "/bod/boardDelete?seq="+${detail.seq};
	    	}
		})
	})
	       
	// 댓글 ajax
	$("#commentsAdd").click(function() {
		$.ajax({
			type : "POST",
			url : "/bod/addCommnetnsProc",
			data : $("#comments_frm").serialize(),
			success : function() {
				$("#contents").val("");
				location.reload();
			}
		})
	})
	
	//댓글 삭제
	$(".comDel").on("click", function() {  
		let seq = $(this).siblings("#seq").val();

	    $.ajax({
	    	url : "/bod/deleteCommnetns?board_seq="+${detail.seq },
	        data : {"seq" : seq},
	        success : function() {
				location.reload();
			}
		}) 
	});
		
	//댓글 수정
	$("body").on("click", ".comUp", function() {
		let thiss = $(this);
		if (thiss.text() == "수정") {
	    	thiss.text("완료");
	        thiss.parent().siblings(".comCon").children(".contents").attr("contenteditable", "true");
	        thiss.parent().siblings(".comCon").children(".contents").focus();
	   	}else {
	    	let contents = thiss.parent().siblings(".comCon").children(".contents").text();
	        thiss.next(".modifytxt").val(contents);
	        let seq = thiss.siblings("#seq").val();
 		    $.ajax({
		    	url : "/bod/updateCommnetns?board_seq="+ ${detail.seq },
		        data : {"seq" : seq, "contents": contents}
		    });   
 		    thiss.text("수정");
 		    thiss.parent().siblings(".comCon").children(".contents").attr("contenteditable", "false");
		} 
	})
}
</script>
</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>
 
 <!-- 글내용 -->
	<div class="container pt-5 pl-5 pr-5 pb-0">
		<div class="card p-5">
			<div class="row m-0">
				<div class="col-12">
					<h3 class="card-title mb-4">${detail.title }</h3>
				</div>
			</div>
			<div class="row m-0">
				<div class="col-12">
					<h6 class="card-subtitle text-muted mb-4">
						<i class="far fa-user"></i> ${detail.writer } &nbsp;&nbsp;
						<i class="far fa-clock"></i> <fmt:formatDate value="${detail.write_date }" pattern=" HH:mm" /> &nbsp;&nbsp;
						<i class="fas fa-align-justify"></i> ${detail.view_count +1}
					</h6>
				</div>
			</div>						
			<div class="row m-0">
				<div class="col-12" style="min-height:250px;">
					<p class="card-text">${detail.content }</p>
				</div>
			</div>
			<div class="row m-0">
				<div class="col-12">
				<c:choose>
					<c:when test="${login.email == detail.writer}">
						<a href="/bod/updateView?seq=${detail.seq }" id="btnUpdate" class="btn btn-success" role="button">수정</a>
						<a href="javascript:;" id="btnDelete" class="btn btn-info " role="button" style="margin-right:10px;">삭제</a>
					</c:when>
				</c:choose>					
					<a href='<c:url value='/bod/boardList'/>' class="btn btn-secondary" role="button">목록으로</a>
				</div>
			</div>				
		</div>
 	</div>
	
	<!-- 댓글 -->
	<div class="container pl-5 pr-5 pb-5 pt-4">
		<!-- 댓글 불러옴 -->
		<div class="pr-5"  id="reply">
			<ol class="replylist" >
				<c:forEach var="i" items="${commentsList}">
				<!-- style="border-bottom:1px solid #ddd;" -->
				<div class="pt-3 mb-3" id="comDiv">
					<li>
						<p >
							<span class="glyphicon glyphicon-user"></span> ${i.writer} 
							(<fmt:formatDate value="${i.write_date}" pattern="yyyy-MM-dd" />)
						</p>
						<div style="min-height:60px;" class="comCon">
							<p class="bg-link contents">${i.contents}</p> 
						</div>
						<div class="form-group">
						<c:choose>
							<c:when test="${login.email == i.writer}">
							<button type="button" id="comUp" class="replyUpdate btn btn-success btn-sm comUp">수정</button>
							<input type="hidden" class="modifytxt" name="upCmt">
							<button type="button" id="comDel" class="replyDelete btn btn-info btn-sm comDel">삭제</button>
							</c:when>	
						</c:choose>	
							<input type="hidden" value="${i.seq }" id="seq">
						</div>
					</li>
				</div>

				</c:forEach>
			</ol>
		</div>
		
		<!-- 댓글작성 -->
		<form id="comments_frm" class="p-2 pt-3">
			<div class="row m-0 mb-2 form-group">
				<div class="col-sm-12">
					<input type="text" id="writer" name="writer" class="form-control"
						value="${login.email }" readonly>
				</div>
			</div>
			<div class="row m-0 form-group">
				<div class="col-sm-10 pr-0">
					<textarea id="contents" name="contents" class="form-control"></textarea>
					<input type="hidden" name="board_seq" value="${detail.seq }">
				</div>
				<div class="col-sm-2">
					<button type="button" class="repSubmit btn w-100 h-100"
						id="commentsAdd">작성</button>
				</div>
			</div>
		</form>
	</div>

	<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>