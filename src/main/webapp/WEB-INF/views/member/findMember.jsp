<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일/비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	$(function(){
		$("#id_findBtn").on("click",function(){
			$.ajax({
			url:"/mem/findIdProc",
			data:{"name":$("#name_input").val(),"phone": $("#phone_input").val()},
			dataType:"json"
			}).done(function(resp){
				console.log(resp);
				if(resp==0){
					$("#id_result").val("해당하는 정보의 아이디가 없습니다.")
				}else{
					for(var i=0;i<resp.length;i++){
						$("#id_result").val(resp[i].email);
					}
					
				}
			})
		})
	})
</script>
</head>
<style>
input[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}
input[type] {border-color: rgba(184, 223, 216, 0.5);}
</style>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="findMember_container container p-5">
	<div class="innercon">
		<div class="title incon row">
			<h2 class="col-12">아이디 찾기</h2>
			<hr class="col-12">
		</div>
		<div class="id_find incon row">
			<h4 class="col-12 p-2">이름과 연락처</h4>
			<h6 class="col-12 p-2">- 아이디를 찾기 위해서는 회원가입시 등록한 이름과 연락처가 필요합니다.</h6>
		</div>
		<div class="id_find incon row">
			<div class="col-12">
				<input type="text" class="form-control name_inp" id="name_input" placeholder="이름을 입력하세요">
			</div>
			<div class="col-12">
				<input type="text" class="form-control phone_inp" id="phone_input" placeholder="핸드폰 번호를 입력하세요">
			</div>
			<div class="col-sm-5 col-md-3 col-lg-2 ">
				<button type="button" class="btn btn-success btn_id" id="id_findBtn">아이디 찾기</button>
			</div>
			<hr class="col-12">
		</div>
	</div>
	<div class="id_box">
		<div class="row id_find_result">
			<input type="text" class="col-12 form-control" id="id_result">
		</div>
	</div>
</div>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>