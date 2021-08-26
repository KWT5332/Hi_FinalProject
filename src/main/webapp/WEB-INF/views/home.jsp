<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
   $(function(){
      AOS.init();
      
      $("#goMeal").on("click",function(){
    	  if(${login.email==null || login.email==""}){
        	  Swal.fire({ 
        		  title:'로그인이 필요한 서비스 입니다.', 
        		  text: "로그인 화면으로 이동하시겠습니까?",
        		  icon: 'info', 
        		  showCancelButton: true, 
        		  confirmButtonColor: '#3085d6', 
        		  cancelButtonColor: '#d33', 
        		  confirmButtonText: '로그인', 
        		  cancelButtonText: '취소' 
        		}).then((result) => {
        			if(result.value){
        				location.href = "/mem/loginForm";
        			}
        		})
    	  }else {
    		  location.href = "meal/Main";
    	  }
      })
      
	$("#goChat").on("click",function(){
    	  if(${login.email==null || login.email==""}){
         	  Swal.fire({ 
        		  title:'로그인이 필요한 서비스 입니다.', 
        		  text: "로그인 화면으로 이동하시겠습니까?",
        		  icon: 'info', 
        		  showCancelButton: true, 
        		  confirmButtonColor: '#3085d6', 
        		  cancelButtonColor: '#d33', 
        		  confirmButtonText: '로그인', 
        		  cancelButtonText: '취소' 
        		}).then((result) => {
        			if(result.value){
        				location.href = "/mem/loginForm";
        			}
        		})
    	  }else {
    		  location.href = "/chart/chartHome";
    	  }
      })

      $("#goChat").on("click",function(){
    	  if(${login.email==null || login.email==""}){
         	  Swal.fire({ 
        		  title:'로그인이 필요한 서비스 입니다.', 
        		  text: "로그인 화면으로 이동하시겠습니까?",
        		  icon: 'info', 
        		  showCancelButton: true, 
        		  confirmButtonColor: '#3085d6', 
        		  cancelButtonColor: '#d33', 
        		  confirmButtonText: '로그인', 
        		  cancelButtonText: '취소' 
        		}).then((result) => {
        			if(result.value){
        				location.href = "/mem/loginForm";
        			}
        		})/mail/sendmail
    	  }else {
    		  location.href = "/chat/myChatList";
    	  }
      })
      
	$("#goFree").on("click",function(){
    	  if(${login.email==null || login.email==""}){
         	  Swal.fire({ 
        		  title:'로그인이 필요한 서비스 입니다.', 
        		  text: "로그인 화면으로 이동하시겠습니까?",
        		  icon: 'info', 
        		  showCancelButton: true, 
        		  confirmButtonColor: '#3085d6', 
        		  cancelButtonColor: '#d33', 
        		  confirmButtonText: '로그인', 
        		  cancelButtonText: '취소' 
        		}).then((result) => {
        			if(result.value){
        				location.href = "/mem/loginForm";
        			}
        		})/mail/sendmail
    	  }else {
    		  location.href = "/bod/boardList";
    	  }
      })
      
      $("#goStat").on("click",function(){
    	  if(${login.email==null || login.email==""}){
         	  Swal.fire({ 
        		  title:'로그인이 필요한 서비스 입니다.', 
        		  text: "로그인 화면으로 이동하시겠습니까?",
        		  icon: 'info', 
        		  showCancelButton: true, 
        		  confirmButtonColor: '#3085d6', 
        		  cancelButtonColor: '#d33', 
        		  confirmButtonText: '로그인', 
        		  cancelButtonText: '취소' 
        		}).then((result) => {
        			if(result.value){
        				location.href = "/mem/loginForm";
        			}
        		})
    	  }else {
    		  location.href = "/chart/chartHome";
    	  }
      })
   })
</script>
<style>
    *{text-align: center;}
	#main{background-color: #124352;}
    
    /* 메인 페이지 */
    /* .main-two div{border:1px solid black;}   */
    .carousel-caption{background-color: rgba(206, 206, 206, 0.5);}
    #imgbox{max-width:230px;min-width:230px;height:230px;border-radius:50%;background-color: #fff8f4;}
    .main-two>h1{font-weight:1000;color:#4e4e4e;}
    .main-two>div>h1{color:#1a5b6e;line-height: 160%}
    .contents>p{font-size: 20px;font-weight: 700;color:#535353;}

    .main-three{
        width: 100%;
        background-image:url(/resources/img_home/8-1.jpg);
        background-size: 100%;
        filter: contrast(160%),grayscale(50%);
        opacity: 0.9;
    }
/*     .main-three::before{
        backdrop-filter: opacity(20%);
        -webkit-backdrop-filter: opacity(20%);
    } */
    .main-three>.content{color: white;}
    #threeimg{width:375px;}
    #strong{position: relative;}
    #strong:after{
      content:'';
      display:block;
      background:#114E60;
      height:46px;
      width:110%;
      position:absolute;
      top:-3px;
      left: -40px;
      z-index: -5;
    }

    .main-four{min-height:600px;}
    .main-four *{text-align: left;}
    #goMeal{
        text-align:center;
        background-color: #114E60;
        width:160px;height:50px;
        color:white;font-size: 15px;
        line-height: 50px;
    }
    #goMeal:hover{background-color: #dff1e4;color:rgb(0, 0, 0);cursor:pointer;}

    .main-five{min-height:600px;background-color:#FDFAF6;}
    .main-five *{text-align:right;}
    #goChat{
        text-align:center;
        background-color: #114E60;
        width:180px;height:50px;
        color:white;font-size: 15px;
        line-height: 50px;
        position:absolute;
        right: 190px;
    }
    #goChat:hover{background-color: #dff1e4;color:rgb(0, 0, 0);cursor:pointer;}
    #goFree{
        text-align:center;
        background-color: #114E60;
        width:160px;height:50px;
        color:white;font-size: 15px;
        line-height: 50px;
        position:absolute;
        right:20px;
    }    
    #goFree:hover{background-color: #dff1e4;color:rgb(0, 0, 0);cursor:pointer;} 

    .main-six{min-height:600px;}
    .main-six *{text-align: left;}
    #goStat{
        text-align:center;
        background-color: #114E60;
        width:160px;height:50px;
        color:white;font-size: 15px;
        line-height: 50px;
    }
    #goStat:hover{background-color: #dff1e4;color:rgb(0, 0, 0);cursor:pointer;}
</style>
</head>
<body>
  <jsp:include page="layout/header.jsp"/>

  <!-- 메인 페이지 -->
    <div class="main-one">
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
              <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="<spring:url value='/resources/img_home/5.jpg'/>" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h2><strong>영양사의 영양사들을 위한 영양사들에 의한</strong></h2><img src="<spring:url value='/resources/img_home/logo01_light.png'/>" style="width:33%;">
                </div>
              </div>
              <div class="carousel-item">
                <img src="<spring:url value='/resources/img_home/6-1.jpg'/>" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h2><strong>영양사의 영양사들을 위한 영양사들에 의한</strong></h2><img src="<spring:url value='/resources/img_home/logo01_light.png'/>" style="width:33%;">
                </div>
              </div>
              <div class="carousel-item">
                <img src="<spring:url value='/resources/img_home/4.jpg'/>" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h2><strong>영양사의 영양사들을 위한 영양사들에 의한</strong></h2><img src="<spring:url value='/resources/img_home/logo01_light.png'/>" style="width:33%;">
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
    </div>

    <div class="main-two mt-5 p-3 pt-5 pb-5" data-aos="fade-up" data-aos-duration="1500">
        <h1 class="p-3">매달 식단표, 고민이신가요?</h1>
        <div class="row m-0 p-2 pb-3 pt-4">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="mb-5 ml-auto mr-auto" id="imgbox" style="background-color: #124352;">
                    <i class="fas fa-utensils fa-5x" style="line-height:230px;color:#FDFAF6;"></i>
                </div>
                <div class="contents"><p>영양사들을 위한<br>영양사들에 의한 웹사이트!</p></div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="mb-5 ml-auto mr-auto" id="imgbox" >
                    <i class="far fa-calendar-alt fa-5x" style="line-height:230px;color: rgb(65, 65, 65);"></i>
                </div>
                <div class="contents"><p>쉽게 확인 가능한<br>매달 식단표</p></div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="mb-5 ml-auto mr-auto" id="imgbox" style="background-color: #124352;">
                    <i class="far fa-envelope fa-5x" style="line-height:230px;color:#FDFAF6;"></i>
                </div>
                <div class="contents"><p>전체메일로 학생들에게<br>식단표를 공유 가능!</p></div>
            </div>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <div class="mb-5 ml-auto mr-auto" id="imgbox">
                    <i class="fas fa-comments-dollar fa-5x" style="line-height:230px;color:rgb(65, 65, 65);"></i>
                </div>
                <div class="contents"><p>결제비율, 만족도평가에 대한<br>통계를 마음 껏 누리자</p></div>
            </div>
        </div> 
        <div class="row m-0 pt-5 pb-2 mb-5" data-aos="fade-up" data-aos-duration="1000">
            <h1 class="col-12">
                식단전문업체 "하이!급식"이<br>
                <strong>맞춤형 식단관리 솔루션</strong>을 제공합니다.
            </h1>
        </div>    
    </div>  

    <div class="main-three p-5">
        <div class="row m-0 img w-100" data-aos="fade-up" data-aos-duration="500">
           <div class="col-12 pt-5" style="text-align: center;">
              <img src="<spring:url value='/resources/img_home/logo01_light.png'/>" id="threeimg">
           </div>
        </div>
        <div class="content row w-100 m-0 mt-3 pb-5">
           <div class="col-12 d-none d-sm-block" style="text-align: center;">
              <h4 style="font-weight:550;font-size:24px;line-height:130%;">
                    매달 식단표 짜기 어려우셨죠?<br>
                    어떤 메뉴가 인기 많은지.. 어떻게 조합을 해야 반응이 좋을지..<br>
              </h4>
            </div>
        </div>
        <div class="row">
          <div class="col-12 pb-5 mb-2 d-none d-sm-none d-md-none d-lg-block">
            <h3>
              <strong id="strong" style="color: white;">
                  이제 고민하지 마시고 검색을 통해 공유된 식단표를 구경해 보세요!
              </strong>
          </h3>
          </div>
        </div>
        <div class="row">
          <div class="col-12 d-none d-sm-none d-md-none d-lg-block">
            <p style="font-weight:550;line-height:150%;font-size: 22px;color: white;">
              저희 하이!급식은 전국 영양사들을 위한 영양사들에 의한 페이지입니다.<br>
              검색을 통해서 같은 학교내 영양사분들 뿐만 아니라 주변 학교 영양사분들이나,<br>
              친한 영양사분들끼리 채팅할 수 있고, 편하게 식단표 공유가 가능합니다.<br>
              또한 다양한 정보를 주고 받을 수 있는 커뮤니티인 자유게시판도 있습니다.<br>
          </p>
          </div>
        </div>     
      </div>    

<!-- #ffcb48 -->
    <div class="main-four pt-5 pl-5 pr-5" >
        <div class="row m-0 p-3 pl-5 pr-5" data-aos="fade-up" data-aos-duration="1000">
            <div class="col-12 col-sm-8 p-3">
                <p style="color:#aedfbc;font-weight:500;letter-spacing: 2px;font-size:23px;">THE PREMIUM MEAL SERVICE</p>
                <h2 class="mb-5" style="letter-spacing: 2px;"><strong>급식표</strong></h2>
                <p class="pt-3 mb-4" style="color:rgb(80, 80, 80);font-size:18px;;">다양한 메뉴개발을 통한 프리미엄화 & 건강하고 신선한 재료를 통한 프리미엄화</p>
                <div id="goMeal">
                    식단 등록하러 가기
                </div>
            </div>
            <div class="col-12 col-sm-4 p-0 pt-2">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="<spring:url value='/resources/img_home/41.png'/>" class="d-block w-100">
                      </div>
                      <div class="carousel-item">
                        <img src="<spring:url value='/resources/img_home/42.png'/>" class="d-block w-100">
                      </div>
                      <div class="carousel-item">
                        <img src="<spring:url value='/resources/img_home/43.jpg'/>" class="d-block w-100">
                      </div>
                      <div class="carousel-item">
                        <img src="<spring:url value='/resources/img_home/44.jpg'/>" class="d-block w-100">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="main-five pt-5 pl-5 pr-5" >
      <div class="row m-0 p-3 pl-5 pr-5" data-aos="fade-up" data-aos-duration="1000">
        <div class="col-12 col-sm-4 p-0 pt-2">
          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
              <div class="carousel-inner">
                <div class="carousel-item active">
					<img src="<spring:url value='/resources/img_home/41.png'/>" class="d-block w-100">
                </div>
                <div class="carousel-item">
					<img src="<spring:url value='/resources/img_home/42.png'/>" class="d-block w-100">
                </div>
                <div class="carousel-item">
                  	<img src="<spring:url value='/resources/img_home/43.jpg'/>" class="d-block w-100">
                </div>
                <div class="carousel-item">
                  	<img src="<spring:url value='/resources/img_home/44.jpg'/>" class="d-block w-100">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
          </div>
        </div>
          <div class="col-12 col-sm-8 p-3">
              <p style="color:#aedfbc;font-weight:500;letter-spacing: 2px;font-size:23px;">THE PREMIUM COMMUNITY SERVICE</p>
              <h2 class="mb-5" style="letter-spacing: 2px;"><strong>커뮤니티</strong></h2>
              <p style="color:black;font-size:18px;;">실시간 채팅과 자유게시판을 통한 정보공유 및 커뮤니티 활성화</p>
              <div id="goChat">실시간 채팅하러 가기</div>
              <div id="goFree">자유게시판 이동</div>
              </div>
          </div>
      </div>

  <div class="main-six pt-5 pl-5 pr-5" >
    <div class="row m-0 p-3 pl-5 pr-5" data-aos="fade-up" data-aos-duration="1000">
        <div class="col-12 col-sm-8 p-3">
            <p style="color:#aedfbc;font-weight:500;letter-spacing: 2px;font-size:23px;">THE PREMIUM STATISTICS SERVICE</p>
            <h2 class="mb-5" style="letter-spacing: 2px;"><strong>피드백</strong></h2>
            <p class="pt-3 mb-4" style="color:rgb(80, 80, 80);font-size:18px;;">학생들의 피드백을 받아 매달마다 제공되는 식단 만족도 통계 서비스</p>
            <div id="goStat">
                통계 확인하러 가기
            </div>
        </div>
        <div class="col-12 col-sm-4 p-0 pt-2">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" >
                <div class="carousel-inner">
                  <div class="carousel-item active">
					<img src="<spring:url value='/resources/img_home/41.png'/>" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
					<img src="<spring:url value='/resources/img_home/42.png'/>" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                  	<img src="<spring:url value='/resources/img_home/43.jpg'/>" class="d-block w-100">
                  </div>
                  <div class="carousel-item">
                  	<img src="<spring:url value='/resources/img_home/44.jpg'/>" class="d-block w-100">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>

  <jsp:include page="layout/footer.jsp"/>
</body>
</html>