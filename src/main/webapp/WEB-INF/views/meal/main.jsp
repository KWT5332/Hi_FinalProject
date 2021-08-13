<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
	#meal{background-color: #124352;}
	*{text-align: center;box-sizing: border-box;}
	
	.filebox input[type="file"] { 
		position: absolute; width: 1px; height: 1px; 
	    padding: 0; margin: -1px; 
	    overflow: hidden; 
	    clip:rect(0,0,0,0); border: 0; 
    } 
    .filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: white;
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: darkgray;
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
    } 
    
    /* named upload */ 
    .filebox .upload-name { 
		display: inline-block; 
		padding: .5em .75em; /* label의 패딩값과 일치 */ 
		font-size: inherit; 
		font-family: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: white;
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
    }
</style>
<script>
	$(function(){
	    // 검색
	    $("#search").on("keydown",function(e){
	        if(e.keyCode==13 && e.shiftKey == false){ 
	              let keyword = $("#search").val();
	              console.log(keyword);
	              location.href = "/meal/searchlist?keyword="+keyword;
	       /*        return false; */
	        }
	    });
	    
	    // 파일이름 출력
	    var fileTarget = $(".filebox .upload-hidden"); 
	      
		fileTarget.on("change", function(){ // 값이 변경되면 
	        //if(window.FileReader){ // modern browser 
			//	var filename = $(this)[0].files[0].name; 
	        //} else { // old IE 
	        //    var filename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출 
	       // } 
	        
	        // 추출한 파일명 삽입 
			//jsp에서 FORM을 생성하여 넘기지 않았을때 스크립트에서 formData로 file을 가져올 수 있다.
		    var formData = new FormData(); 
		    formData.append("file", $(this)[0].files[0]); //배열로 되어있음 / formData는 Map과 같은 형태
		        
		    var fileName = formData.get('file').name;
		    // 추출한 파일명 삽입 
	        $(this).siblings(".upload-name").val(fileName); 
		    
		    if(formData.get('file').size >= 1048576) {
		    	alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
		    	return false;
		    }
		    
		    let regex = new RexExp("(.*?)\.xlsx");
		    if(!regex.test(fileName)){
		    	alert("확장자가 .xlsx인 파일만 업로드 가능합니다.");
		    	return false;
		    }

	        if(confirm("선택하신 파일을 업로드 하시겠습니까?")){
	            $.ajax({
	            	type:"POST",
	            	url:"/excel/excelupload",
	            	data:{"fileName" : fileName},
	            	dataType:"json"
	            }).done(function(resp){
	            	
	            })
	        }
		});

	    // 엑셀 업로드 양식 다운받기
		$("#excelform").on("click",function(){
			location.href = "/excel/excelform";
		});

		// 식단추가페이지 이동
		$("#addMeal").on("click",function(){
			location.href = "/meal/addmeal";
		});

		// 한달 식단표 다운로드
		$("#download").on("click",function(){
			location.href = "/excel/excelDowload?month=07";
		});
	})
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
    
    <!-- 메인 -->
    <div class="container p-5">
      <div class="row m-0 mb-4">
        <div class="col-12 col-sm-6 col-md-6 col-lg-3 p-0" style="text-align: left;">
          <div class="input-group" style="text-align: left;">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-search"></i></span>
            </div>
            <input type="search" class="form-control" aria-label="Amount (to the nearest dollar)" id="search">
          </div>
        </div>
        
        <div class="col-12 col-sm-12 col-md-6 col-lg-9 p-0" id="excleupload">
			<div class="filebox" style="text-align: right;">
				<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="excelName" class="mb-0">엑셀 업로드</label>
	            <input type="file" id="excelName" class="upload-hidden">
                <button class="btn btn-outline-secondary btn-sm ml-4 mt-1" id="excelform">엑셀 업로드양식 다운</button>
          	</div>
        </div>

      </div>
      <div class="row m-0">
        <div class="col-sm-6 col-md-6 col-lg-2 p-0 pt-1" style="text-align: left;">
          <button class="btn btn-secondary" id="addMeal">식단 추가하기</button>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-8 pl-4 pt-1">
          <h1>&lt; &nbsp; 7월 &nbsp; &gt;</h1>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-2 p-0 pt-1" style="text-align: right;">
          <button class="btn btn-secondary" id="download">엑셀 다운로드</button>
        </div>
      </div>
    </div>
    
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>