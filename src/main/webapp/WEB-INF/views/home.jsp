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
   })
</script>
<style>
    *{text-align: center;}
	#main{background-color: #124352;}
    
    /* 메인 페이지 */
    .main-one{
       height:88vh;width: 100%;
       background-image:url(/resources/img_home/1-1.jpg);
       background-size: 105%;
       padding-top:270px;
    }
    #mainContents{text-align:center;}
    #title{
      font-size: 50px;font-weight: 1000;color:#145c72;
      text-shadow:4px 4px 3px rgb(160, 160, 160);
    }

    /* .main-two div{border:1px solid black;}   */
    #imgbox{max-width:230px;min-width:230px;height:230px;border-radius:50%;background-color: #fff8f4;}
    .main-two>h1{font-weight:1000;color:#4e4e4e;}
    .main-two>div>h1{color:#1a5b6e;line-height: 160%}
    .contents>p{font-size: 20px;font-weight: 700;color:#535353;}

    .main-three{
        height: 100vh;
        background-image:url(/resources/img_home/5-1.jpg);
        background-size: 110%;
        filter: contrast(160%),grayscale(50%);
        opacity: 0.9;
    }
/*     .main-three::before{
        backdrop-filter: opacity(20%);
        -webkit-backdrop-filter: opacity(20%);
    } */
    .main-three>.content{color: white;}
    #threeimg{width: 300px;}

    .main-four{height:70vh;background-color:#FDFAF6;}
    .main-four *{text-align: left;}
    .look{
        text-align:center;
        background-color: #114E60;
        width:120px;height:50px;
        color:white;font-size: 14px;
        line-height: 50px;
    }
    .look:hover{background-color: #dff1e4;color:rgb(0, 0, 0);cursor:pointer;}
</style>
</head>
<body>
  <jsp:include page="layout/header.jsp"/>

  <!-- 메인 페이지 -->
    <div class="main-one">
        <%-- <img src="<spring:url value='/resources/img/1-1.jpg'/>" class="d-block w-100"> --%>
        <div class="row m-0">
           <div class="col-12" id="mainContents">
              <p id="title" class="mb-4 pb-2">하이! 급식</p>
               <h5 style="line-height:130%;font-weight: 600;">
                개인 및 단체에 균형잡힌 급식 서비스를 제공하기 위해<br>
                식단을 계획하고 조리 및 공급을 감독하는 등 급식을 담당하느라<br>
                고생하시는 전국 영양사들을 위한 식단표, 메신저, 커뮤니티,<br>
                메일, 매달 식단에 대한 통계를 제공하는 영양사 페이지입니다.<br> 
               </h5>
           </div>
        </div>
    </div>

    <div class="main-two p-3 pt-5 pb-5" data-aos="fade-up" data-aos-duration="1500">
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
        <div class="row m-0 pt-5 pb-2" data-aos="fade-up" data-aos-duration="1000">
            <h1 class="col-12">
                식단전문업체 "하이!급식"이<br>
                <strong>맞춤형 식단관리 솔루션</strong>을 제공합니다.
            </h1>
        </div>    
    </div>  

    <div class="main-three p-5">
        <div class="row m-0 img w-100" data-aos="fade-up" data-aos-duration="500">
           <div class="col-12 mt-3 pt-5" style="text-align: center;">
              <img src="<spring:url value='/resources/img_home/logo01_light.png'/>" id="threeimg">
           </div>
        </div>
        <div class="row m-0">
           <div class="col-none col-md-1"></div>
           <div class="col-12 col-md-10">
              <hr class="m-0" style="width:100%;height:42px;background-color:#124352;
                    position: relative;top:142px;">
           </div>
           <div class="col-none col-md-1"></div>
      </div>
        <div class="content row w-100 m-0 mt-3">
           <div class="col-12" style="text-align: center;">
              <h4 style="font-weight:550;font-size:22px;line-height:130%;">
                    매달 식단표 짜기 어려우셨죠?<br>
                    어떤 메뉴가 인기 많은지.. 어떻게 조합을 해야 반응이 좋을지..<br>
                </h4>
                <br>
                <h3>
                    <strong>
                        이제 고민하지 마시고 검색을 통해 공유된 식단표를 구경해 보세요!
                    </strong>
                </h3>
                <br><br><br>
                <p style="font-weight:550;line-height:150%;font-size: 19px;">
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
            <div class="col-8 p-2">
                <p style="color:#aedfbc;font-weight:500;letter-spacing: 2px;">THE PREMIUM MEAL SERVICE</p>
                <h3 class="mb-5" style="letter-spacing: 2px;"><strong>하이!급식</strong></h3>
                <p style="color:rgb(80, 80, 80);">다양한 메뉴개발을 통한 프리미엄화 & 건강하고 신선한 재료를 통한 프리미엄화</p>
                <div class="look">
                    자세히보기
                </div>
            </div>
            <div class="col-4 p-0 pt-2">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="<spring:url value='/resources/img_home/2.jpg'/>" class="d-block w-100">
                      </div>
                      <div class="carousel-item">
                        <img src="<spring:url value='/resources/img_home/6.jpg'/>" class="d-block w-100">
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