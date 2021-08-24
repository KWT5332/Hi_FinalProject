<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
.join_container input[type]:focus, .join_container select[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}
.join_container select[type]:hover {
	cursor:pointer
}
.join_container .btn_join:focus, .join_container .btn_email:focus {
			box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
			outline: 0 none;
		}
.join_container .btn_join:hover, .join_container .btn_email:hover{
			background:#7AB08A;
			box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
			outline: 0 none;
		}
.join_container input[type] {border-color: rgba(184, 223, 216, 0.5);}
.join_container select {border-color: rgba(184, 223, 216, 0.5);}
.join_container .incon {overflow: hidden;}
.join_container .btn_email {width: 145px;background-color: #A9CCB3;border: #A9CCB3;color:white;}
.join_container .btn_join {width: 200px;background-color: #A9CCB3;border: #A9CCB3;color:white;height:50px;font-size: 20px;}
.join_container .exex {border: none;}
.join_container .con_btn_join {text-align: center;}
.join_container .empty {height: 150px;} 
/* 이메일번호체크 */
.join_container #email_num_ck {display: none;}
/* 이메일 전송 버튼 */
.join_container #btn_send_email {display: none;}
/* 이메일형식 맞지않는경우 */
.join_container .id_input_reg_1 {color: pink;display: none;}
/* 비밀번호형식 맞지않는경우 */
.join_container .pw_input_reg_1 {color: pink;display: none;}
/* 중복아이디 존재하지 않는경우 */
.join_container .id_input_re_1 {color: green;display: none;}
/* 중복아이디 존재하는 경우 */
.join_container .id_input_re_2 {color: green;display: none;}
/* 비번일치 */
.join_container .pw_input_re_1 {color: green;display: none;}
/* 비번불일치 */
.join_container .pw_input_re_2 {color: red;display: none;}
.join_container #mail_check_input_box_false {background-color: #ebebe4;}
.join_container #mail_check_input_box_true {background-color: white;}
.join_container .correct {color: green;}
.join_container .incorrect {color: red;}
.join_container h2 {font-weight: 600;}
</style>
<script>
   $(function(){
      var code = "";                //이메일전송 인증번호 저장위한 코드
   //이메일 체크
	//$('#Email_input').on("propertychange change keyup paste input", function(){
	$('#btn_email_ck').on("click", function(){
		var memberId = $('#Email_input').val();			// .id_input에 입력되는 값
		var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		let emailReg = /^[A-Za-z0-9_]+@[a-z]+[.][a-z]{2,3}$/;//이메일 정규식
		if (!(emailReg.test(memberId))){
			$('.id_input_reg_1').css("display","inline-block");
			$('.id_input_re_1').css("display", "none");
			$('.id_input_re_2').css("display", "none");
		}else{
			$.ajax({
			type : "post",
			url : "/mem/EmailChk",
			data : data,
			success : function(result){
				 console.log("성공 여부" + result);
				 if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");	
						$('.id_input_reg_1').css("display", "none");
						$('#btn_send_email').css("display", "inline-block");
						$('#btn_email_ck').css("display", "none");
						var result = confirm("사용가능한 이메일 입니다. 해당 이메일로 인증을 하시겠습니까?");
						if(result){
							$('#email').val($('#Email_input').val());
							$('#Email_input').attr("disabled",true);
							$('#btn_send_email').click();
						}else{
							$('#btn_send_email').css("display", "none");
							$('#btn_email_ck').css("display", "inline-block");
							$('.id_input_re_1').css("display", "none");
							$('#Email_input').val("").focus();
						}
					} else {//사용중인 이메일
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");	
						$('.id_input_reg_1').css("display", "none");
					 }
				}
		  }); 
		}
	});
	/* 인증번호 이메일 전송 */
	$("#btn_send_email").click(function(){
		 alert(" 작성 된 이메일로 인증코드가 전송됩니다.\n 아래 인증번호 입력칸이 생길 때까지 잠시 시간이 걸릴 수 있습니다. \n 해당이메일의 인증번호를 확인해주세요.");
			 var email = $(".mail_input").val();        // 입력한 이메일
			 var cehckBox = $(".mail_check_input");        // 인증번호 입력란
			 var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
			 $('#email_num_ck').css("display","inline-block");
				 $.ajax({
				type:"GET",
				url:"/mem/mailCheck?email=" + email,
				success:function(data){
					console.log("data : " + data);//확인 후 삭제
					//$('#email_num_ck').css("display","inline-block");
					$('.mail_check_input').focus();
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
		   });
	});
	/* 인증번호 비교 */
	$("#btn_num_ck").on("click",function(){
		var inputCode = $(".mail_check_input").val();        // 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct"); 
	        $('#num_ck').val($('#inp_num_ck').val());
	       // $('#Email_input').attr("disabled",true);
	        $('#inp_num_ck').attr("disabled",true);
	        //$('#email').val($('#Email_input').val());
	        alert("회원가입 시 인증된 해당 이메일이 사용됩니다.\n다른 이메일을 원할시 새로고침 해주세요.")
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }   
	});
	//비번일치여부
 	$(".inp_pw2,.inp_pw1").on("propertychange change keyup paste input", function(){
 		var inp_pw1 = $('.inp_pw1').val();
 		var inp_pw2 = $('.inp_pw2').val();
 		let pwReg = /^[a-z0-9]{6,15}$/;
		if(inp_pw1!=inp_pw2){//불일치
			$('.pw_input_re_2').css("display","inline-block");
			$('.pw_input_re_1').css("display", "none");	
			$('.pw_input_reg_1').css("display","none");
		}else{
			if (!(pwReg.test(inp_pw2))){
				$('.pw_input_reg_1').css("display","inline-block");
				$('.pw_input_re_1').css("display", "none");
				$('.pw_input_re_2').css("display", "none");
			}else{
				$('.pw_input_reg_1').css("display","none");
				$('.pw_input_re_1').css("display", "inline-block");
				$('.pw_input_re_2').css("display", "none");
			}
		}
	});
	$("#btn_join").on("click",function(){
		let nameReg = /^[가-힣]{2,10}$/;
		let schoolReg = /^[가-힣]+[초중고대]$/;
		let phoneReg = /^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/;
		let pwReg = /^[a-z0-9]{6,15}$/;
		var name = $('#name').val();
		var school = $('#school').val();
		var phone = $('#phone').val();
		var pw = $('#inp_pw2').val()
		if ($('#email').val()==""){
			alert("이메일을 작성해주세요");
			 $('#Email_input').focus();
			return;
		}else if ($('#num_ck').val()==""){
			alert("인증완료 해주세요");
			 $('#inp_num_ck').focus();
			return;
		}else if ($('#inp_pw1').val()!=$('#inp_pw2').val()){
			alert("비밀번호가 일치하지 않습니다.");
			 $('#inp_pw1').focus();
			return;
		}else if (($('#inp_pw1').val()=="")||($('#inp_pw2').val()=="")){
			alert("비밀번호를 확인해주세요");
			 $('#inp_pw1').focus();
			return;
		}else if (!(pwReg.test(pw))){
			alert("비밀번호는 알파벳 소문자 와 숫자 로만 6~15자 로 설정합니다");
			 $('#inp_pw1').focus();
			return;
		}else if (!(nameReg.test(name))){
			alert("이름은 한글로 2~10자로 작성해주세요");
			 $('#name').focus();
			return;
		}else if ($('#gender').val()==null){
			alert("성별을 선택해주세요");
			 $('#gender').focus();
			return;
		}else if (!(schoolReg.test(school))){
			alert("학교명을 공백없이 초, 중, 고, 대 로 끝나도록 작성해주세요");
			$('#school').focus();
			return;
		}else if ($('#age').val()==null){
			alert("나이대를 선택해주세요");
			 $('#age').focus();
			return;
		}else if (!(phoneReg.test(phone))){
			alert("연락처가 형식에 맞지 않습니다.\n예시 010-1234-1234");
			$('#phone').focus();
			return;
		}
		alert("회원가입 되었습니다\n하이!급식에 가입해주셔서 감사합니다\n로그인 후 이용해주세요\n홈으로 이동합니다");
		$("#frm_join").submit();
	}); 
})   
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<form action="/mem/joinProc" id="frm_join">
		<div class="join_container container p-5">
			<!--    <div class="join_container container-fluid"> -->
			<div class="profile">
				<!-- <div class="profile mr-5 ml-5"> -->
				<div class="title incon row m-5">
					<h2 class="col-12">회원가입</h2>
					<hr class="col-12">
				</div>
				<div class="id_pw_con incon row m-5 ">
					<h5 class="col-12">이메일</h5>
					<p class="col-12 mb-4">
					- 인증을 마친 이메일은<mark>하이!급식</mark>에서 아이디로 사용됩니다
					</p>
					<div class="col-12">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-4">
								<input type="text" class="form-control inp_id mail_input"id="Email_input" >
							</div>
							<div class="col-sm-5 col-md-3 col-lg-2 ">
								<button type="button" class="btn btn_email mail_check_button " id="btn_email_ck">중복 확인</button>
								<button type="button" class="btn btn_email mail_check_button " id="btn_send_email">인증번호 재발송</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-control  exex id_input_reg_1">이메일 형식에 맞게작성해주세요.</div>
								<div class="form-control  exex id_input_re_1">사용 가능한이메일입니다.</div>
								<div class="form-control  exex id_input_re_2">이미 사용중인 이메일입니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="id_pw_con incon row m-5" id="email_num_ck">
					<h5 class="col-12  mb-4">이메일 인증 번호 입력</h5>
					<div class="col-12">
						<div class="row mail_check_wrap">
							<div class="col-6 mail_check_input_box"
								id="mail_check_input_box_false">
								<input type="text" class="form-control inp_id mail_check_input" id="inp_num_ck" >
							</div>
							<div class="col-6 ">
								<button type="button" class="btn btn_email" id="btn_num_ck">인증번호 확인</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-control  exex" id="mail_check_input_box_warn"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="title incon row m-5">
					<h2 class="col-12"></h2>
					<hr class="col-12">
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">비밀번호</h5>
					<p class="col-12 mb-4">
						- 비밀번호는 <mark>알파벳 소문자</mark> 와 <mark>숫자</mark> 로만 <mark>6~15자 </mark>로 설정합니다.
					</p>
					<div class="col-12">
						<div class="row">
							<div class="col-12 col-sm-5 col-lg-5">
								<input type="password" class="form-control inp_id inp_pw1" id="inp_pw1">
							</div>
							<div class="col-12 col-sm-7 col-lg-6">
							</div>
						</div>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">비밀번호 확인</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-12 col-sm-5 col-lg-5">
								<input type="password" class="form-control inp_id inp_pw2" id="inp_pw2" name="pw" >
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-7 col-lg-6">
								<div class="form-control  exex pw_input_reg_1">비밀번호 형식에 맞게작성해주세요.</div>
								<div class="form-control  exex pw_input_re_1">비밀번호가 일치합니다.</div>
								<div class="form-control  exex pw_input_re_2">비밀번호가 불일치합니다.</div>
								<div class="col-md-1 col-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="privacy pt-4">
				<div class="title incon row m-5">
					<h2 class="col-12">개인 정보</h2>
					<hr class="col-12">
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">이름</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-sm-5 col-md-3 ">
								<input type="text" class="form-control" id="name" name="name" >
							</div>
						</div>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">성별</h5>
					<div class="input-group row">
						<select type="select" class=" custom-select col-sm-5 col-md-2 ml-4" id="gender" name="gender" >
							<option value="" selected disabled>선택</option>
							<option value="man">남성</option>
							<option value="woman">여성</option>
						</select>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">소속 학교 정보</h5>
					<div class="col-12">
						<div class="row">
							<div class="col-12 mt-3">
								<div class="row">
									<div class="col-10 col-md-6">
										<input type="text" class="form-control" id="school" name="school" >
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-md-12">
										<div class="form-control  exex pb-5">예시 - 무학여고, 마산중 (공백없이 입력해주세요)</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">나이대</h5>
					<div class="input-group row">
						<select type="select" name="age" id="age" class=" custom-select col-sm-5 col-md-2 ml-4" >
							<option value="" selected disabled>선택</option>
							<option value="20대">20대</option>
							<option value="30대">30대</option>
							<option value="40대">40대</option>
							<option value="50대">50대</option>
							<option value="60대">60대</option>
						</select>
					</div>
				</div>
				<div class="id_pw_con incon row m-5">
					<h5 class="col-12 mb-4">연락처</h5>
					<p class="col-12">
						-<mark>비밀번호 찾기</mark>시 이용 됩니다
					</p>
					<div class="col-12">
						<div class="row">
							<div class="col-3 col-md-5">
								<input type="text" class="form-control" name="phone" id="phone"   placeholder="010-1234-1234">
							</div>
						</div>
						</div>
						<div class="row">
						<div class="col-12 col-md-12">
							<!-- <div class="form-control  exex">
								연락처 형식 일치 여부
							</div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="empty"></div>
			<div class="con_btn_join m-5">
				<button type="button" class="btn  btn_join" id="btn_join">회원가입 하기</button>
			</div>
			<div class="empty">
				<input type="hidden" name="email" id="email">
				<input type="hidden" id="num_ck">
			</div>
		</div>
	</form>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>


