<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
* {box-sizing: border-box;}
.container {position: relative;}
button[type]:focus {box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);outline: 0 none;}
button[type]:hover {background: #7AB08A;box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);outline: 0 none;color: white;}
.error_btn_home {width: 270px;height: 70px;font-weight: 600;font-size: 25px;line-height: 47px;}
button[type] {width: 250px;background-color: #A9CCB3;border: #A9CCB3;color: white;}
.error_ment {font-size: 25px:font-weight: 600;color: #064420;left: 22%;top: 570px;}
.error_body {width: 100%;text-align: center;padding: 150px;height: 1200px;}
.error_btn_con {text-align: center;left: 40%;top: 500px;}
.error_con {width: 50%;margin: auto;text-align: center;}
input[type] {border-color: rgba(184, 223, 216, 0.5);}
#back {z-index: -100;top: 200px;left: 30%;}
.join_container .incon {overflow: hidden;}
.error_con .error_rogo {width: 50%;}
.error_rogo {opacity: 0.4;top: 130px;}
.container * {position: absolute;}
.ff {top: 300px;}
</style>
</head>
<body>
	<div class="error_body container ">
		<img class="error_rogo" src="/img/404.png" id="back">
		<div class="error_con ">
			<img class="error_rogo" src="/img/logo01_light.png" id="logo">
		</div>
		<div class="error_ment">
			존재하지 않는 주소이거나,<br>요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.
		</div>

		<div class="error_btn_con ">
			<a href="">
				<button type="button" class="btn  error_btn_home ff">홈으로 돌아가기</button>
			</a>
		</div>
	</div>
</body>
</html>