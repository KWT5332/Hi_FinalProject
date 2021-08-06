<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시로그인</title>
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
* {
	box-sizing: border-box;
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

.join_container .incon {
	overflow: hidden;
}

.join_container .btn_email {
	width: 127px;
}
</style>
</head>
<body>
	<form action="/mem/loginProc">
		<div class="join_container container-fluid">
			<div class="profile">
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12  mb-4">임시 로그인 이메일</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-sm-6 col-md-2 col-lg-2">
								<input type="text" class="form-control inp_id " name="email">
							</div>
						</div>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12  mb-4">비밀번호</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-sm-6 col-md-2 col-lg-2">
								<input type="text" class="form-control inp_id" name="pw">
							</div>
							<div class="col-sm-5 col-md-3 col-lg-2 ">
								<button class="btn btn-success btn_email">로그인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>