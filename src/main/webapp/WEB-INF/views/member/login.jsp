<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		* {box-sizing: border-box;}
		input[type]:focus {
			border-color: rgba(194, 224, 219, 0);
			box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
			outline: 0 none;
		}
		button[type]:focus {
			border-color: #FAF1E6;
			box-shadow: 0 1px 1px #FAF1E6 inset, 0 0 20px #FAF1E6;
			outline: 0 none;
		}
		.btn_rogin:focus {
			border-color: #FAF1E6;
			box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
			outline: 0 none;
		}
		input[type] {border-color: rgba(184, 223, 216, 0.5);}
		.join_container .incon {overflow: hidden;}
		.join_container {background-color: #FDFAF6;}
		.join_container .rogo {height: 60px;}
		.join_container .rogocon {text-align: center;}
		.join_container .rogincon {text-align: center;}
		.join_container .empty {height: 150px;}
		.join_container .innercon {width: 400px;margin: auto;}
		.join_container .minicon {width: 75%;margin: auto;}
		.join_container .btn_rogin {
			width: 100%;
			margin: auto;
			height: 50px;
			font-size: 20px;
			background-color: #E4EFE7;
			border: 1px solid #E4EFE7;
			color: #064420;
			font-weight: 600
		}
		.join_container .btn_rogin:hover {
			width: 100%;
			margin: auto;
			height: 50px;
			font-size: 20px;
			background-color: #d0e4d5;
			border: 1px solid #d0e4d5;
			color: #064420;
			font-weight: 600
		}
		.join_container .under{
			width: 100%;
			margin: auto;
			font-size: 13px;
			color: #064420;
		}
		.join_container .under_home{
			width: 100%;
			margin: auto;
			font-size: 15px;
			color: #064420;
			background-color: #FDFAF6;
		}
		.join_container .under_home:hover{
			width: 100%;
			margin: auto;
			font-size: 15px;
			color: #064420;
			background-color: #FAF1E6;
			border-left: 1px solid #FAF1E6;
		}
	</style>
	<script>
	$(function(){
		$("#btn_home").on("click",function(){
			location.href="/";
		})
		
	})
	</script>
</head>
<body>
	<form action="/mem/loginProc">
		<div class="join_container container-fluid">
			<div class="innercon">
				<div class="empty"></div>
				<div class="rogocon mb-5">
					<img class="rogo" src="/img/logo01_light.png">
				</div>
				<div class="rogincon">
					<div class="minicon p-2">
						<input type="text" class="form-control inp_id " name="email" placeholder="example@mail.com">
					</div>
					<div class="minicon p-2">
						<input type="text" class="form-control inp_id" name="pw" placeholder="비밀번호">
					</div>
					<div class="minicon p-2">
						<button class="btn  btn_rogin">로그인</button>
					</div>
					<div class="minicon p-2">
						<a style="cursor:pointer" class="under" href="/mem/findMember">아이디 / 비밀번호 찾기</a>
						<span>|</span>
						<a style="cursor:pointer" class="under"href="/mem/joinForm">회원가입</a>
					</div>
					<div class="minicon p-2">
						<button type="button" class="btn  under_home" id="btn_home">홈으로 가기</button>
					</div>
				</div>
				<div class="empty"></div>
				<div class="empty"></div>
			</div>
		</div>
	</form>
</body>
</html>