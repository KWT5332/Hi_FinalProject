<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>
        * {box-sizing: border-box;}
        /* div {
            border: 1px solid black;
        } */
        select[type]:focus {
            border-color: rgba(184, 223, 216, 0.5);
            box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
            outline: 0 none;
        }
        input[type]:focus {
            border-color: rgba(184, 223, 216, 0.5);
            box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px rgb(184, 223, 216, 0.6);
            outline: 0 none;
        }
        input[type] { border-color: rgba(184, 223, 216, 0.5);}
        .join_container .incon {overflow: hidden; }
        .join_container .btn_email { width: 127px;}
        .join_container .exex { border: none;}
        .join_container .con_btn_join{text-align: center;}
        .join_container .empty{ height: 150px;}
    </style>
<script>
   $(function(){
      AOS.init();
      $("#main").addClass("active");
   })
   /* 완성후 바꾸기 */
</script>
</head>
<body>
  <jsp:include page="../layout/header.jsp"/>
  <form action="/mem/joinProc">
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
                <p class="col-12 mb-4">- 인증을 마친 이메일은 <mark>하이!급식</mark> 에서 아이디로 사용됩니다</p>
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-6 col-md-4 col-lg-4">
                            <input type="text" class="form-control inp_id " name="email">
                        </div>
                        <div class="col-sm-5 col-md-3 col-lg-2 ">
                            <button type="button" class="btn btn-success btn_email">인증번호 발송</button>

                        </div>
                        <div class="col-sm-12 col-md-4 col-lg-6">
                            <div class="form-control  exex">이메일 맞는지</div>
                            <div class="col-md-1 col-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="id_pw_con incon row m-5">
                <h5 class="col-12  mb-4">이메일 인증 번호 입력</h5>
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-6 col-md-2 col-lg-2">
                            <input type="text" class="form-control inp_id ">
                        </div>
                        <div class="col-sm-5 col-md-3 col-lg-2 ">
                            <button type="button" class="btn btn-success btn_email">이메일 인증</button>

                        </div>
                        <div class="col-sm-12 col-md-4 col-lg-6">
                            <div class="form-control  exex">인증번호 맞는지</div>
                            <div class="col-md-1 col-lg-none"></div>
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
                <div class="col-12">
                    <div class="row">
                        <div class="col-12 col-sm-5 col-lg-5">
                            <input type="text" class="form-control inp_id ">
                        </div>
                        <div class="col-12 col-sm-7 col-lg-6">
                            <div class="form-control  exex">비밀번호 형식</div>
                            <div class="col-md-1 col-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="id_pw_con incon row m-5">
                <h5 class="col-12 mb-4">비밀번호 확인</h5>
                <div class="col-12">
                    <div class="row">
                        <div class="col-12 col-sm-5 col-lg-5">
                            <input type="text" class="form-control inp_id " name="pw">
                        </div>
                        <div class="col-12 col-sm-7 col-lg-6">
                            <div class="form-control  exex">비번일치 여부</div>
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
                        <div class="col-sm-5 col-md-2 ">
                            <input type="text" class="form-control  " name="name">
                        </div>
                    </div>
                </div>
            </div>
            <div class="id_pw_con incon row m-5">
                <h5 class="col-12 mb-4">성별</h5>
                <div class="input-group row">
                    <select type="select" class=" custom-select col-sm-5 col-md-2 ml-4" name="gender" id="inputGroupSelect01">
                        <option selected>선택</option>
                        <option value="man">남성</option>
                        <option value="woman">여성</option>
                    </select>
                </div>
            </div>
            <div class="id_pw_con incon row m-5">
                <h5 class="col-12 mb-4">소속 학교 정보</h5>
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-4 col-md-2 col-lg-2">
                            <input type="text" class="form-control inp_id ">
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-2 ">
                            <button type="button" class="btn btn-success btn_email">우편번호 찾기</button>
                        </div>
                        <div class="col-12 mt-3">
                            <div class="row">
                                <div class="col-10  col-md-6">
                                    <input type="text" class="form-control  ">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-3">
                            <div class="row">
                                <div class="col-10 col-md-4">
                                    <input type="text" class="form-control  " name="school">
                                </div>
                                <div class="col-12 col-md-8">
                                    <div class="form-control  exex">예시 - 무학여고, 마산중 (공백없이 입력해주세요) </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="id_pw_con incon row m-5">
                <h5 class="col-12 mb-4">나이대</h5>
                <div class="input-group row">
                    <select type="select" name="age" class=" custom-select col-sm-5 col-md-2 ml-4" id="inputGroupSelect01">
                        <option selected>선택</option>
                        <option value="20">20대</option>
                        <option value="30">30대</option>
                        <option value="40">40대</option>
                        <option value="50">50대</option>
                        <option value="60">60대</option>
                    </select>
                </div>
            </div>

            <div class="id_pw_con incon row m-5">
                <h5 class="col-12 mb-4">연락처</h5>
                <p class="col-12">- <mark>비밀번호 찾기</mark> 시 이용 됩니다</p>
                <div class="col-12">
                    <div class="row">
                        <div class="col-10 col-md-4">
                            <input type="text" class="form-control  " name="phone">
                        </div>
                        <div class="col-12 col-md-8">
                            <div class="form-control  exex">연락처 형식 일치 여부 </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="empty"></div>
        <div class="con_btn_join m-5">
            <button class="btn btn-success">회원가입 하기</button>
        </div>
        <div class="empty"></div>
    </div>
   </form>
   <jsp:include page="../layout/footer.jsp"/>
  
</body>
</html>