<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
<style>
.container {align: center;}
#free{background-color: #124352;}
#doardcon #main {width: 100%;}
#doardcon h2 {width: 100%; text-align: center;}
#doardcon table {width: 90%; text-align: center;}
#doardcon #head {height: 50px; background-color: rgb(255, 241, 224, 0.8);}
#doardcon #body {height: 50px;}
#doardcon #footer {width: 90%;margin: auto;}
#doardcon #navi {line-height: 35px;}
#doardcon #backdiv {text-align: right;}
#doardcon #search {text-align: right;}
#doardcon .hit {
	animation-name: blink;
	animation-duration: 1.0s;
	animation-timing-function: ease;
	animation-iteration-count: infinite; /* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}
/* 애니메이션 지점 설정하기 */ /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
 @keyframes blink { from {color: white;} 30% {color: yellow;} to {color: red; font-weight: bold;} /* 0% {color:white;} 30% {color: yellow;} 100% {color:red; font-weight: bold;} */ }
#dataTable_filter{width:100%;padding-right:2px;margin-bottom:7px;}
#addwrite{height:40px;background-color:#dff1e4;color:rgb(90, 90, 90);border:1px solid #dff1e4;font-weight:700;margin-left:30px;width:150px;}
#addwrite:hover{font-weight:700;color:rgb(94, 94, 94);background-color:#cbebd4;}
.seqlink{color:black;}
#text{position:relative;}
#text:after{
	content:'';
	display:block;
	width:105%;
	height:10px;
	position:absolute;
	bottom:3px;
	left:-5px;
	background:rgb(255, 196, 119, 0.8);
	z-index: -5;

}
.seqlink:hover{font-weight:700;text-decoration:none;}
</style>
<script>
	$(function(){
      	$('#dataTable').DataTable({
   		    "language": {
      		   "emptyTable": "등록된 글이이 없습니다.",
   	   		   "search": "검색 : ",
   	           "zeroRecords": "일치하는 데이터가 없습니다.",
   	           "paginate": {
   	               "next": "다음",
   	               "previous": "이전"
   	           }
      		},
      		"columns":[
      			{"data" : "번호"},
      			{"data" : "제목"},
      			{"data" : "작성자"},
      			{"data" : "작성일"},
      			{"data" : "조회수"}
      		],
   			order:[0,"desc"], // 정렬 초기화 작업 "asc"
   			lengthMenu:[10,20,30], // 표시 건수 단위
   			lengthChange:false, // 표시건수 기능 숨기기
   			displayLength:10 // 기본적으로 1페이지당 표시될 게시물의 개수
      	});
      	
      	let btn = $("<button>");
      	btn.addClass("col-6 ml-0");
      	btn.append("글 작성하기");
      	btn.attr("id","addwrite");
      	
      	$("#dataTable_filter").addClass("col-6");
      	$("#dataTable_filter").after(btn);
      	
		$("#addwrite").on("click",function(){
			location.href="/bod/boardWrite";
		})
		
	
		
	})
</script>
</head>
<body>
<!-- header -->
 <jsp:include page="../layout/header.jsp"/>
 
	<div id="doardcon">
	<div class="container p-5 mb-5">
		<div class="row pt-4" id="main">
			<h1 class="col-12 mb-5" style="text-align:center" >
				<strong id=text>자유게시판</strong>
			</h1>
		</div>
		
<!-- 			<div class="col-12 pr-0 pb-2" style="text-align:right;">
				<button class="btn" id="addwrite">글 작성하기</button>
			</div> -->
<%-- 		<div class="row p-2">
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
		</div> --%>
		<table class="m-0 w-100 hover" align="center" id="dataTable">
			<thead style="border-top:1px solid black;">
			<tr id="head">
				<th width=10%>번호</th>
				<th align="center" width=45%>제목</th>
				<th align="center" width=20%>작성자</th>
				<th align="center" width=15%>작성일</th>
				<th align="center" width=10%>조회</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list}">
				<tr id="body">
					<td>${list.seq}</td>
					<td id="title"><a class="seqlink" href="/bod/viewProc?seq=${list.seq}">${list.title}</a>
						<c:if test="${list.view_count >= 30 }">
							<span class="hit">hit!</span>
						</c:if></td>
					<td>${list.writer}</td>
					<td>${list.write_date}</td>
					<td>${list.view_count}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div id="footer" class="row pt-2">
			<div class="col-12 p-0" id="write" style="text-align: right;">
				
			</div>
		</div>
	</div>
	</div>
<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>