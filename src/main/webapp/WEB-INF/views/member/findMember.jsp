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
.find_container .exex {border: none;} 


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
                        <h5 class="col-12 mb-4">비밀번호</h5>
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
                    <div class="col-12 mt-5">
                        <h5 class="col-12 ">등록된 아이디</h5>
                   
                  <div class="row">
                     <div class="col-12 p-3">
                        <input type="text" class="form-control id_result " id="id_result"> 
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
                        <input type="text" class="form-control  " id="" placeholder="이름"> 
                     </div>
                     <div class="col-10 col-md-4 p-3"><input type="text" class="form-control " id=""placeholder="example@example.com" >
                     </div>
                            <div class="col-12 col-md-5  p-3">
                        <button type="button" class="btn btn_css  " id="btn_email_ck">인증번호 발송</button>
                     </div>
                            <div class="col-6 col-md-3 p-3">
                        <input type="text" class="form-control  " id="" placeholder="인증번호"> 
                     </div>
                     <div class="col-10 col-md-4 p-3">
                                <button type="button" class="btn btn_css  " id="btn_email_ck">인증번호 확인</button>
                     </div>
                            <div class="col-12 col-md-5  p-3">
                     </div>
                  </div>
               </div>
                    <div class="col-12 mt-5">
                        <h5 class="col-12 ">새로운 비밀번호 설정</h5>
                   	<div class="id_pw_con incon row p-3" id="email_num_ck">
                            <div class="col-12">
                                <div class="row mail_check_wrap">
                                    <div class="col-12 col-md-5  p-3 " id="">
                                        <input type="text" class="form-control  mail_check_input" id="inp_num_ck" >
                                    </div>
                                    <div class="col-d-none col-md-5  p-3 ">
                                    </div>
                                    <div class="col-12 col-md-5  p-3" id="">
                                        <input type="text" class="form-control  mail_check_input" id="inp_num_ck" >
                                    </div>
                                    <div class="col-12 col-md-5  p-3">
                                        <div class="form-control  exex pw_input_reg_1">비밀번호 형식에 맞게작성해주세요.</div>
                                <div class="form-control  exex pw_input_re_1">비밀번호가 일치합니다.</div>
                                <div class="form-control  exex pw_input_re_2">비밀번호가 불일치합니다.</div>
                                    </div>
                                    <div class="col-12 col-md-5  p-3">
                                        <button type="button" class="btn btn_css" id="btn_num_ck">비밀번호 재설정</button>
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