<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
* {
	box-sizing: border-box;
}

/* div {
            border: 1px solid black;
        } */
select[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}

input[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}

input[type] {
	border-color: rgba(184, 223, 216, 0.5);
}

.sendmail_container .incon {
	overflow: hidden;
}

.sendmail_container .studentcon {
	text-align: center;
}
.studentAdd>div{width:100%;}
.studentAdd>div>input{width:100%;}
</style>
<script>
	$(function() {
		AOS.init();
		$("#main").addClass("active");

		$(".btn_sendmail").click(function() {
			alert("전체 학생에게 메일을 발송합니다.");
			$.ajax({
				type : "GET",
				url : "/mail/sendMailProc",
				success : function() {
					console.log("확인");
				}
			})
		})
		
		$("#add").click(function(){
			$.ajax({
				type : "POST",
				url : "/mail/addStudentProc",
				data: $("#frm").serialize(),
				success : function(){
					$("#stu_name").val("");
					$("#stu_email").val("");
					location.reload();
				}
			})
		})
	})
</script>
</head>

<body>
	<jsp:include page="../layout/header.jsp" />

	<div class="sendmail_container container p-5">
		<form id="frm">
		<div class="studentAdd row">
			<div class="col-4">
				<input type="text" name="stu_name" id="stu_name" placeholder="학생이름을 입력하세요">
			</div>
			<div class="col-4">
				<input type="text" name="stu_email" id="stu_email" placeholder="학생이메일을 입력하세요">
			</div>
			<div class="col-4">
				<!-- 사용자 학교 정보 넣기 -->
				<input type="hidden" name="school" value="무학중">
				<input type="button" id="add" value="학생 등록">
			</div>
		</div>
		</form>
		<div class="studentcon row">
			<table class="table m-5">
				<tr>
					<td scope="col">번호</td>
					<td scope="col">학생이름</td>
					<td scope="col">소속학교</td>
					<td scope="col">이메일</td>
				</tr>
				<c:forEach var="i" items="${studentList}" varStatus="status">
				<tr>
					<td scope="col">${status.count}</td>
					<td scope="col">${i.stu_name}</td>
					<td scope="col">${i.school}</td>
					<td scope="col">${i.stu_email}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<button class="btn btn-success btn_sendmail">전체학생에게 이메일 보내기</button>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>


