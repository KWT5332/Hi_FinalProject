<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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
<style>
.container {
	border: 1px solid #ddd;
	margin: auto;
	align: center;
}

#doardcon #main {
	width: 100%;
}

#doardcon h2 {
	width: 100%;
	text-align: center;
}
#doardcon table {
	width: 90%;
	text-align: center;
}

#doardcon #head {
	height: 50px;
	background-color: rgba(100, 148, 237, 0.699);
}

#doardcon #body {
	height: 40px;
}

#doardcon #footer {
	width: 90%;
	margin: auto;
}


#doardcon #navi {
	line-height: 35px;
}

#doardcon #backdiv {
	text-align: right;
}

#doardcon #search {
	text-align: right;
}

#free{background-color: #124352;}

#doardcon .hit {
	animation-name: blink;
	animation-duration: 1.0s;
	animation-timing-function: ease;
	animation-iteration-count: infinite; /* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}
/* 애니메이션 지점 설정하기 */ /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
 @keyframes blink { from {color: white;} 30% {color: yellow;} to {color: red; font-weight: bold;} /* 0% {color:white;} 30% {color: yellow;} 100% {color:red; font-weight: bold;} */ }

</style>
<script>
	$(function(){
		$("#addwrite").on("click",function(){
			location.href="/bod/boardWrite";
		})
		
	})
</script>
</head>
<body>

<div id="doardcon">
	<div class="container p-3 mb-5 mt-5">
		<div class="row pt-4" id="main">
			<h2>
				<strong>자유게시판</strong>
			</h2>
		</div>
		<div class="row p-2">
			<div class="col-5 pt-2">
				<c:choose>
					<c:when test="${key!=null}">
				${key} : ${word} 를 검색한 결과 입니다.
			</c:when>
				</c:choose>
			</div>
			<div class="col-7 pt-2" id="search">
				<form action="/bod/boardList" method="get">
					<select id="searchKey" name="key">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select> <input id="searchcontent" name="word" type="text"> <input
						type="submit" value="검색 "> <input type="hidden"
						name="cpage" value="1">
				</form>
			</div>
		</div>
		<table border="1" align="center">
			<tr id="head">
				<th width=10%>번호</th>
				<th align="center" width=50%>제목</th>
				<th align="center" width=15%>작성자</th>
				<th align="center" width=15%>작성일</th>
				<th align="center" width=10%>조회</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr id="body">
					<td>${list.seq}</td>
					<td id="title"><a href="/bod/viewProc?seq=${list.seq}">${list.title}</a>
						<c:if test="${list.view_count >= 10 }">
							<span class="hit">hit!</span>
						</c:if></td>
					<td>${list.writer}</td>
					<td>${list.write_date}</td>
					<td>${list.view_count}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="footer" class="row pt-2">
			<div class="col-12 p-0" id="write" style="text-align: right;">
				<input type="button" value="글 쓰기" id="addwrite"
					class="btn btn-primary">
			</div>
		</div>
	</div>
	</div>

</body>
</html>