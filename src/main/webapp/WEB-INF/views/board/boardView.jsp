<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
	window.onload = function() {		

		
		document.getElementById("btnDelete").onclick = function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				frm.action = "deletereview";
				frm.submit();
			}
		}
	}
</script>
</head>
<body>
	<div class="container col-md-6">
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
					class="btn btn-outline-secondary btn-sm" role="button">수정</a> <a
					href="/bod/boardDelete?seq=${detail.seq }" id="btnDelete"
					class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
			</div>
			<div class="card-body">
				<a href='<c:url value='/bod/boardList'/>' class="btn btn-info"
					role="button">목록으로</a>
			</div>
		</div>
	</div>

</body>
</html>