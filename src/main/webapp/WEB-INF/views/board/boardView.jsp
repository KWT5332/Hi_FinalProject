<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>

<script type="text/javascript">
	window.onload = function() {	 // 밑에 바디영역이 실행되기 전에 실행하기위한 윈도우 온로드	

		
		document.getElementById("btnDelete").onclick = function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				frm.action = "deletereview";
				frm.submit();
			}
		}
		
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
	
	      $(".comDel").on("click", function() {  
	          let seq = $(this).siblings("#seq").val();
	          console.log(seq);
	          $.ajax({
	              url : "/bod/deleteCommnetns?board_seq="+${detail.seq },
	              data : {"seq" : seq},
	           success : function() {
					location.reload();
				}
	           }) 
	        });
		
		 $("body").on("click", ".comUp", function() {
			 let thiss = $(this);
			 if (thiss.text() == "수정") {
	            thiss.text("완료");
	            thiss.parent().siblings(".contents").attr("contenteditable", "true");
	            thiss.parent().siblings(".contents").focus();

	         }  else {
	        	 let contents = thiss.parent().siblings(".contents").text();
	             thiss.parent().siblings(".modifytxt").val(contents);
	             let seq = thiss.siblings("#seq").val();
 		           $.ajax({
		              url : "/bod/updateCommnetns?board_seq="+ ${detail.seq },
		              data : {"seq" : seq, "contents": contents}
		           });   
 		            thiss.text("수정");
 		            thiss.parent().siblings(".contents").attr("contenteditable", "false");
	         } 
	      })
		
		
	}
	

</script>

</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>
 
 <!-- 글내용 -->
	<div class="container p-5">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title mb-3">${detail.title }</h4>
				<h6 class="card-subtitle text-muted mb-4">
					<i class="far fa-user"></i> ${detail.writer } · <i
						class="far fa-clock"></i>
					<fmt:formatDate value="${detail.write_date }" pattern=" HH:mm" />
					<i class="fas fa-align-justify"></i> ${detail.view_count +1}
				</h6>
				<p class="card-text">${detail.content }</p>
			</div>
			<div class="card-body">
				<a href="/bod/updateView?seq=${detail.seq }" id="btnUpdate"
					class="btn btn-success" role="button">수정</a> <a
					href="/bod/boardDelete?seq=${detail.seq }" id="btnDelete"
					class="btn btn-info " role="button">삭제</a>
			</div>
			<div class="card-body">
				<a href='<c:url value='/bod/boardList'/>' class="btn btn-secondary"
					role="button">목록으로</a>
			</div>
		</div>
	</div>
	
	<!-- 댓글 -->
	<div class="container pb-4">
		<!-- 댓글 불러옴 -->
		<div id="reply">
			<ol class="replylist">
				<c:forEach var="i" items="${commentsList}">
					<li>
						<p>
							<span class="glyphicon glyphicon-user"></span> ${i.writer} (
							<fmt:formatDate value="${i.write_date}" pattern="yyyy-MM-dd" />
							)
						</p>
						<p class="bg-link contents">${i.contents}</p> 
						<input type="hidden" class="modifytxt" name="upCmt">
						<div class="form-group">
							<button type="button" id="comUp"
								class="replyUpdate btn btn-success btn-sm comUp">수정</button>
							<button type="button" id="comDel"
								class="replyDelete btn btn-info btn-sm comDel">삭제</button>
							<input type="hidden" value="${i.seq }" id="seq">
						</div>
				</c:forEach>
			</ol>
		</div>
		
		<!-- 댓글자성 -->
		<form id="comments_frm" class="p-2">
			<div class="row m-0 mb-2 form-group">
				
				<div class="col-sm-12">
					<input type="text" id="writer" name="writer" class="form-control"
						value="${detail.writer }" readonly>
				</div>
			</div>
			<div class="row m-0 form-group">
				
				<div class="col-sm-12">
					<textarea id="contents" name="contents" class="form-control"></textarea>
					<input type="hidden" name="board_seq" value="${detail.seq }">
				</div>
			</div>
			<div class="row m-0 form-group">
				<div class="col-sm-offset-2 col-sm-12">
					<button type="button" class="repSubmit btn btn-success"
						id="commentsAdd" style="float: left;">작성</button>
				</div>
			</div>
		</form>
		
	
	</div>
	

	
	<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>