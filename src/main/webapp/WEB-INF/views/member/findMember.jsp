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
<style>
* {box-sizing: border-box;}
.find_container input[type]:focus, .find_container select[type]:focus {
   border-color: rgba(184, 223, 216, 0.5);
   box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
      rgb(184, 223, 216, 0.6);
   outline: 0 none;
}
.find_container select[type]:hover {
   cursor:pointer
}
.find_container .btn_join:focus, .find_container .btn_email:focus {
         box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
         outline: 0 none;
      }
.find_container .btn_join:hover, .find_container .btn_email:hover{
         background:#7AB08A;
         box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
         outline: 0 none;
      }
.find_container input[type] {border-color: rgba(184, 223, 216, 0.5);}
.find_container select {border-color: rgba(184, 223, 216, 0.5);}
.find_container .incon {overflow: hidden;}
.find_container .btn_css {width: 145px;background-color: #A9CCB3;border: #A9CCB3;color:white;}
.find_container .btn_join {width: 200px;background-color: #A9CCB3;border: #A9CCB3;color:white;height:50px;font-size: 20px;}

.find_container .id_result {border: none;text-align: center;}
.find_container #id_result {border: none;text-align: center;font-size: 18px;}
.find_container .exex {border: none;} 
.find_container #idshow {display: none;}
.find_container #email_num_ck_01 {display: none;}
.find_container #email_num_ck_02 {display: none;}
.find_container #email_num_ck_03 {display: none;}
.find_container #btn_newpw {display: none;}
.find_container .correct {color: green;}
.find_container .incorrect {color: red;}
.find_container .regtest {color: pink;}

</style>

<script>
	$(function(){
		
		/* 아이디 찾기 */
		$("#id_findBtn").on("click",function(){
			$.ajax({
			url:"/mem/findIdProc",
			data:{"name":$("#name_input").val(),"phone": $("#phone_input").val()},
			dataType:"json"
			}).done(function(resp){
				console.log(resp);
				$('#idshow').css("display","inline-block");
				if(resp==0){
					$('.add').remove();
					let div = $("<div>");
					div.attr("class", "add");
					div.html("해당하는 정보의 아이디가 없습니다.");
					$("#id_result").append(div);
				}else{
					$('.add').remove();
					for(var i=0;i<resp.length;i++){
						let div = $("<div>");
						div.attr("class", "add");
						div.append(resp[i].email);
						
						$("#id_result").append(div);
					}
				}
			})
		})
		
		/* 비번찾기 */
		/* 인증번호 이메일 전송 */
		$("#btn_send_email").click(function(){
			$.ajax({
				url:"/mem/findPwProc",
				data:{"name":$("#pw_name_input").val(),"email": $("#pw_email_input").val()},
				dataType:"json"
				}).done(function(resp){
					console.log(resp);
					if(resp==0){
						alert("일치하는 회원정보가 없습니다.");
					}else{
						alert(" 작성 된 이메일로 인증코드가 전송됩니다.\n 아래 인증번호 입력칸이 생길 때까지 잠시 시간이 걸릴 수 있습니다. \n 해당이메일의 인증번호를 확인해주세요.");
					  	 var email = $("#pw_email_input").val();        // 입력한 이메일
						 var cehckBox = $(".mail_check_input");        // 인증번호 입력란
						 var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
						 $('#email_num_ck_01').css("display","inline-block");
						 $('#email_num_ck_02').css("display","inline-block");
							 $.ajax({
							type:"GET",
							url:"/mem/mailCheck?email=" + email,
							success:function(data){
								console.log("data : " + data);//확인 후 삭제
								$('.mail_check_input').focus();
								boxWrap.attr("id", "mail_check_input_box_true");
								code = data;
								}
			   				}); 
					}
				})			
		});
		/* 인증번호 비교 */
		$("#btn_email_ck").on("click",function(){
			var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct"); 
		        $('#email_num_ck_03').css("display","inline-block");
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
	 		
	 		var checkResult = $("#num_check_input_box_warn");    // 비교 결과 
	 		
			if(inp_pw1!=inp_pw2){//불일치
				checkResult.html("비밀번호가 일치하지 않습니다.");
		        checkResult.attr("class", "incorrect"); 
		        $('#btn_newpw').css("display", "none");
			}else{
				if (!(pwReg.test(inp_pw2))){
					checkResult.html("비밀번호가 형식에 맞지 않습니다.");
			        checkResult.attr("class", "regtest"); 
			        $('#btn_newpw').css("display", "none");
				}else{
					checkResult.html("비밀번호가 일치합니다.");
			        checkResult.attr("class", "correct");
			        $('#btn_newpw').css("display","inline-block");
				}
			}
		});
		/* 비번 재설정 */
		$("#btn_newpw").on("click",function(){
			var inp_pw1 = $('.inp_pw1').val();
			var inp_pw2 = $('.inp_pw2').val(); //새비번
			var email= $("#pw_email_input").val();
			let pwReg = /^[a-z0-9]{6,15}$/;
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
		    
		    if (inp_pw1 == inp_pw2) {
				if (!(pwReg.test(inp_pw2))){
					alert("형식에 맞지 않습니다.\n a-z,0-9로만 6~15자로 설정합니다.");
				}else{
				    $.ajax({
						type:"GET",
						url:"/mem/newPwProc",
						data:{"email":email,"pw": inp_pw2},
						dataType:"json"
						}).done(function(resp){
							console.log(resp);
							if(resp>0){
								alert("비밀번호가 재설정 되었습니다.");
							}else{
								alert("비밀번호 제설정에 실패했습니다. \n다시 시도해주세요.");
							}
						})
				}
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		});
		
	})
</script>
</head>
<body>
   <jsp:include page="../layout/header.jsp" />

      <div class="find_container container p-5">
         <!--    <div class="find_container container-fluid"> -->
         <div class="profile">
                <div class="title incon row m-5">
               <h2 class="col-12">아이디 찾기</h2>
               <hr class="col-12">
            </div>
                <div class="id_pw_con incon row m-5">
                    <div class="col-12 mb-3">
                        <h5 class="col-12 mb-4">아이디</h5>
                        <p class="col-12 mb-4">
                            - 아이디를 찾기 위해 회원 정보와 동일한 <mark>이름</mark> 과 <mark>연락처</mark>를 작성해주세요.
                        </p>
                  <div class="row">
                     <div class="col-6 col-md-3 p-3">
                        <input type="text" class="form-control name_inp " id="name_input" placeholder="이름"> 
                     </div>
                     <div class="col-10 col-md-4 p-3"><input type="text" class="form-control phone_inp " id="phone_input" placeholder="010-1234-5678" >
                     </div>
                            <div class="col-12 col-md-5  p-3">
                        <button type="button" class="btn btn_id btn_css" id="id_findBtn">아이디 찾기</button>
                     </div>
                  </div>
               </div>
                    <div class="col-12 mt-5 " id="idshow">
                        <h5 class="col-12 ">등록된 아이디</h5>
                   
                  <div class="row">
                     <div class="col-12 p-3" id="id_result">
                     </div>
                  </div>
               </div>
            </div>
                <div class="title incon row m-5">
               <h2 class="col-12">비밀번호 재설정</h2>
               <hr class="col-12">
            </div>
                <div class="id_pw_con incon row m-5">
                    <div class="col-12 mb-3">
                        <h5 class="col-12 mb-4">비밀번호</h5>
                        <p class="col-12 mb-4">
                            - 비밀번호 재설정을 위해 회원 정보와 동일한 <mark>이름</mark> 과 <mark>이메일(아이디)</mark>를 작성해주세요.
                        </p>
                  		<div class="row">
                     		<div class="col-6 col-md-3 p-3">
                        		<input type="text" class="form-control  " id="pw_name_input" placeholder="이름"> 
                     		</div>
                     		<div class="col-10 col-md-4 p-3">
                     			<input type="text" class="form-control mail_input" id="pw_email_input" placeholder="example@example.com" >
                     		</div>
                            <div class="col-12 col-md-5  p-3">
                        		<button type="button" class="btn btn_css  " id="btn_send_email">인증번호 발송</button>
                     		</div>
                            
                            <div class="col-6 col-md-3 p-3 mail_check_input_box" id="email_num_ck_01">
                        		<input type="text" class="form-control mail_check_input " id="" placeholder="인증번호"> 
                     		</div>
                     		<div class="col-10 col-md-4 p-3 email_num_ck" id="email_num_ck_02">
                                <button type="button" class="btn btn_css  " id="btn_email_ck">인증번호 확인</button>
                     		</div>
                     		<div class="col-12 col-md-12 ">
                        		<div class="form-control  exex" id="mail_check_input_box_warn"></div>
                     		</div>
                  		</div>
                	</div>
                    <div class="col-12 mt-5 email_num_ck" id="email_num_ck_03">
                    
                        <h5 class="col-12 ">새로운 비밀번호 설정</h5>
                   		<div class="id_pw_con incon row p-3" id="">
                   		<p class="col-12 mb-4">
						- 비밀번호는 <mark>a-z</mark> 그리고 <mark>0-9</mark>로만<mark>6자에서 15자 사이</mark>로 설정합니다.
						</p>
                            <div class="col-12">
                                <div class="row mail_check_wrap">
                                    <div class="col-12 col-md-5  p-3 " id="">
                                        <input type="password" class="form-control  inp_pw1" id="" >
                                    </div>
                                    <div class="col-d-none col-md-5  p-3 ">
                                    </div>
                                    <div class="col-12 col-md-5 mt-2 p-3" id="">
                                        <input type="password" class="form-control  inp_pw2" id="" >
                                    </div>
                                    <div class="col-12 col-md-5  p-3">
                                        <div class="form-control  exex" id="num_check_input_box_warn"></div>
                                    </div>
                                    <div class="col-12 col-md-5  p-3">
                                        <button type="button" class="btn btn_css" id="btn_newpw">비밀번호 재설정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
               		</div>
            </div>
         </div>
      </div>

   <jsp:include page="../layout/footer.jsp" />
</body>
</html>