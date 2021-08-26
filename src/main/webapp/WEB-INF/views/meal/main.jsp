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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	#meal{background-color: #124352;}
	*{text-align: center;box-sizing: border-box;}
	#excelName{ 
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
    .upload-name { 
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
	#addMeal{background-color:#dff1e4;color:rgb(70, 70, 70);font-weight:700;border:1px solid #dff1e4;width:100%;height:90%;}
    #addMeal:hover{font-weight:700;border:1px solid #114E60;color:#114E60;}
	#download{background-color:#dff1e4;color:rgb(70, 70, 70);font-weight:700;border:1px solid #dff1e4;width:100%;height:90%;}
    #download:hover{font-weight:700;border:1px solid #114E60;color:#114E60;}
    th{height:40px;font-size: 18px;background-color:rgb(255, 241, 224, 0.8);border: 1px solid rgb(130, 130, 130);}
	td{height:200px;max-width: 25px;position:relative;padding:0px;border:1px solid rgb(130, 130, 130);}
    .date{border-bottom: 1px solid rgb(130, 130, 130);border-right: 1px solid rgb(130, 130, 130);padding:0px;position:absolute;top:0px;height:30px;line-height:29px;}
    .menu{position:absolute;bottom:1px;width: 100%;padding-bottom: 15px;}.menu:hover{cursor:pointer;}
    #pre:hover{cursor:pointer;}#next:hover{cursor:pointer;}
    .custom-file-label::after {
        content: "파일찾기";
    }
    #fileName{padding-left:60px;}
    tr>*:nth-child(1)>div:nth-child(1){color:tomato;}
    tr>*:nth-child(7)>div:nth-child(1){color:rgb(68, 122, 223);}
    #calendar{
    	width:100%; text-align:center;
    	border-collapse: collapse;
		border-radius: 10px;
  		border-style: hidden;
  		box-shadow: 0 0 0 1px rgb(130, 130, 130);
  		overflow:hidden;
  	}
</style>
<script>
	$(function(){
        const today = new Date(); // 처음 달력 세팅
        calendar(today);
        calAjax(strNum(today.getMonth()+1));
		
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
        	var form = $("#frm")[0];       
		    var formData = new FormData(form); 
		    //formData.append("file", $(this)[0].files[0]); //배열로 되어있음 / formData는 Map과 같은 형태
		        
		    var fileName = formData.get('file').name;
		    
		    if(formData.get('file').size >= 1048576) {
		    	//alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
		    	Swal.fire({
					icon: 'warning',
					title: '업로드 할 수 있는 \n파일 사이즈를 초과했습니다.',
					text: '파일크기를 확인해주세요.'
				 })
		    	return false;
		    }

		    let regex = /(.*?)\.xlsx/;
		    if(!regex.test(fileName)){
		    	//alert("확장자가 .xlsx인 파일만 업로드 가능합니다.");
		    	Swal.fire({
					icon: 'warning',
					title: '확장자가 .xlsx인 파일만 업로드 가능합니다.'
				 })
		    	return false;
		    }
		    
		    // 추출한 파일명 삽입 
	        $(this).siblings(".upload-name").val(fileName); 
			
	        /* if(confirm("선택하신 파일을 업로드 하시겠습니까?")){
	            $.ajax({
	            	type:"POST",
	            	url:"/excel/excelupload",
	            	data:formData,
	    			processData: false, // data가 서버에 전달될때 String 형식아니고 "multipart/form-data"로 보내야됨
	    			contentType: false, // "application/x-www-form-urlencoded; charset=UTF-8"이것이 아니라 "multipart/form-data"로 보내야됩니다.
	    			cache:false
	            }).done(function(resp){
	            	console.log(resp);
		            $(".upload-name").val("파일선택");
		            $(".menu").remove(); // menu내용지우고
			       	calAjax(resp); // 다시 내용 넣기
	            })
	        }*/
	        
	        Swal.fire({ 
	    		  title:'선택하신 파일을 업로드 하시겠습니까?', 
	    		  icon: 'question', 
	    		  showCancelButton: true, 
	    		  confirmButtonColor: '#3085d6', 
	    		  cancelButtonColor: '#d33', 
	    		  confirmButtonText: '업로드', 
	    		  cancelButtonText: '취소' 
	    	}).then((result) => {
	    		if(result.value){
					$.ajax({
						type:"POST",
		            	url:"/excel/excelupload",
		            	data:formData,
		    			processData: false, // data가 서버에 전달될때 String 형식아니고 "multipart/form-data"로 보내야됨
		    			contentType: false, // "application/x-www-form-urlencoded; charset=UTF-8"이것이 아니라 "multipart/form-data"로 보내야됩니다.
		    			cache:false
					}).done(function(resp) {
						console.log(resp);
			            $(".upload-name").val("파일선택");
			            $(".menu").remove(); // menu내용지우고
				       	calAjax(resp); // 다시 내용 넣기
					})	
	    		}
	    	})
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
	        let str = $("#calNaviTitle").text();
            let arr = str.split(" "); // 띄어쓰기로 문자열 자르기;
            let month = arr[1].substr(0,2);

			location.href = "/excel/excelDowload?month="+month;
		});
		
		$("#cal").on("click",function(){
			location.href = "/meal/calendar";
		});
		
		// '<' 눌렀을때
		$("#pre").on("click",function(){ 
            let str = $("#calNaviTitle").text();
            let arr = str.split(" "); // 띄어쓰기로 문자열 자르기
            
            let year; let month;
            if(arr[1].substr(0,2)=='01') { // 1월일때는 전년도 12월 세팅
                year = arr[0].substr(0,4) -1;
                month = 12;
            }else{
                year = arr[0].substr(0,4);
                month = arr[1].substr(0,2) -1; // 전달 세팅
            }
            const changeCal = new Date(year, month-1, 1); // 배열이여서 1개 더 빼줘야 한다.
            
            $("#calNaviTitle").text(""); // title 지우고
            $("#calendar > tbody > tr").remove(); // tbody밑에 tr다 지우고
            
            calendar(changeCal); // 다시 생성
            calAjax(strNum(month)); // 다시 내용 넣기
        })

        // '>' 눌렀을때
        $("#next").on("click",function(){ 
            let str = $("#calNaviTitle").text();
            let arr = str.split(" "); // 띄어쓰기로 문자열 자르기
            
            let year; let month; let changeCal;
            if(arr[1].substr(0,2)=='12') { // 12월일때는 내년 1월 세팅
                year = arr[0].substr(0,4)-1; // +1은 왜진지 모르지만 숫자로 인식을 안해서 -1로 숫자로 인식되게 하고
                month = 0; // 1월은 배열로 0이다.
                changeCal = new Date(year+2, month, 1); // +2해준다.
            }else{
                year = arr[0].substr(0,4);
                month = arr[1].substr(0,2); // 다음달 세팅(+1은 역시나 문자열로 인식되서 어짜피 배열이여서)
                changeCal = new Date(year, month, 1);  // 여기서 -1해줘야하기 때문에 그냥 가지고 간다.
            }
            console.log(year+"-"+month);
            console.log(changeCal);

            $("#calNaviTitle").text(""); // title 지우고
            $("#calendar > tbody > tr").remove(); // tbody밑에 tr다 지우고
            
            calendar(changeCal); // 다시 생성
            let newMonth = month -1 + 2;
            calAjax(strNum(newMonth));
        })
        
        // 등록되어 있는 식단 수정, 삭제 Modal띄우기
        $(document).on("click",".menu",function(){
        	let data = "";
        	$(".modal-title").text(""); 
        	
        	let thismenu = $(this);
        	let str = $(this).html();
            let arr = str.split("<br>");
            
            for(let i=0;i<arr.length;i++){ // 메뉴 input에 넣어주기
                $("#menu"+(i+1)).val(arr[i]);
            }

            let date = $(this).parent("td").attr("class"); // 날짜가져오기
            let darr = date.split("-");

            $(".modal-title").text(date); // 날짜 모달title에 넣어주기
            $("#modal_meal_date").val(date);
            
            let sysname = $(this).next(".sysname");

            $("#modal_img").children("img").remove(); // 사진 넣어주기
            let img = $("<img>");
            img.addClass("saveImg");
            img.attr("src","/meal/display?fileName="+sysname.val()).width(352);
            if(sysname.val()!=""){
            	$("#modal_img").append(img);
            }
            
            $("#fileName").text("이미지 업로드"); // 초기화
            
            $("#modal").modal("show");
        })
        
		// 수정버튼
		$("#update").on("click",function(){ 
       		let form = $("#modal_frm")[0];
            let formData = new FormData(form);
            	
            $.ajax({
            	url:"/meal/update",
            	type:"POST",
            	data:formData,
            	processData: false, // data가 서버에 전달될때 String 형식아니고 "multipart/form-data"로 보내야됨
	    		contentType: false, // "application/x-www-form-urlencoded; charset=UTF-8"이것이 아니라 "multipart/form-data"로 보내야됩니다.
	    		cache:false
            }).done(function(resp){
            	alert("수정완료");
            	location.reload();
            }) 
       })

		$("#delete").on("click",function(){ // 삭제버튼
			let date = $("#exampleModalLabel").text(); // 날짜가져오기
			console.log(date);
        	/* if(confirm("정말 삭제 하시겠습니까?")){
            	$.ajax({
                	url:"/meal/delete",
                	data:{"meal_date":date},
                	cache:false,
                	success : function() {
                		$("."+date).children(".menu").remove();
        			}
                })
            }else {
            	$("#modal").modal("hide");
            }*/
            Swal.fire({ 
	    		  title:'정말 삭제 하시겠습니까?', 
	    		  icon: 'warning', 
	    		  showCancelButton: true, 
	    		  confirmButtonColor: '#3085d6', 
	    		  cancelButtonColor: '#d33', 
	    		  confirmButtonText: '삭제', 
	    		  cancelButtonText: '취소' 
	    	}).then((result) => {
	    		if(result.value){
	    			$.ajax({
	                	url:"/meal/delete",
	                	data:{"meal_date":date},
	                	cache:false,
	                	success : function() {
	                		$("."+date).children(".menu").remove();
	        			}
	                })
	    		}else{
	    			$("#modal").modal("hide");
	    		}
	    	})
		})
		
		// 모달 사진 변경
		$("#inputGroupFile").on("change", function(){ // 값이 변경되면 
			var file = $(this)[0].files[0];
			
			if(file.size >= 1048576) {
			    //alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
			    Swal.fire({
					icon: 'warning',
					title: '업로드 할 수 있는 \n파일 사이즈를 초과했습니다.',
					text: '파일크기를 확인해주세요.'
				 })
			    return false;
			}

			let regex = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
			if(!regex.test(file.name)){
			    //alert("이미지 파일만 업로드 가능합니다.");
			     Swal.fire({
					icon: 'warning',
					title: '이미지 파일만 업로드 가능합니다.',
					text: '파일 형식을 확인해주세요'
				})
			    return false;
			}
			
          $("#fileName").text(file.name); // 추출한 파일명 삽입
          
          if(this.files && this.files[0]){
          	var reader = new FileReader;
          	reader.onload = function(data){
          		$(".saveImg").remove();
          		
                let img = $("<img>");
                img.attr("src",data.target.result).width(352);
                $("#modal_img").append(img);
          	}
          	reader.readAsDataURL(this.files[0]);
          }
      });
	})
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
    
    <!-- 메인 -->
    <div class="container p-5">
      <div class="row m-0 mb-4 mt-3">
        <div class="col-12 col-sm-6 col-md-6 col-lg-3 p-0" style="text-align: left;">
          <div class="input-group" style="text-align: left;">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-search"></i></span>
            </div>
            <input type="search" class="form-control" aria-label="Amount (to the nearest dollar)" id="search">
          </div>
        </div>
        
        <div class="col-12 col-sm-12 col-md-6 col-lg-9 p-0" id="excleupload">
        <form id="frm" name="frm" method="POST" enctype="multipart/form-data">
			<div class="filebox w-100" style="text-align: right;">
				<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="excelName" class="mb-0">엑셀 업로드</label>
				<input type="file" id="excelName" name="file" class="upload-hidden">
                <button class="btn btn-outline-secondary btn-sm ml-4 mt-1" id="excelform" type="button">엑셀 업로드양식 다운</button>
          	</div>
        </form>
        </div>
      </div>
      
      <div class="row m-0 mb-3">
        <div class="col-sm-12 col-md-6 col-lg-2 p-0 pt-1" style="text-align: left;">
          <button class="btn btn-secondary" id="addMeal">식단 추가하기</button>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-8 pl-4 pt-1">
        	<h1 id="calNavi">
            	<span id="pre">&lt; &nbsp; </span>
                <span id="calNaviTitle"></span>
                <span id="next">&nbsp; &gt;</span>
            </h1>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-2 p-0 pt-1" style="text-align: right;">
          <button class="btn btn-secondary" id="download">엑셀 다운로드</button>
        </div>
      </div>
      
      <div>
		<table id="calendar" align="center">
        	<thead>
            	<tr>
                	<th style="color:tomato;">일
                    <th>월
                    <th>화
                    <th>수
                    <th>목
                    <th>금
                    <th style="color:rgb(68, 122, 223);">토
                </tr>
 			</thead> 
            <tbody id="tbody">
            </tbody>
        </table>
      </div>
    </div>
    
     <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="" enctype="multipart/form-data" id="modal_frm">
    	<div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel"></h5>
	            <input type="hidden" id="modal_meal_date" name="meal_date">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	            </button>
	            </div>
	            <div class="modal-body row m-0">
	            	<div class="col-6" style="border-right:1px solid #ddd;">
		            	<p style="text-align:left;">메뉴 (최소2개, 최대6개까지 등록 가능합니다.)</p>
		                <input type="text" class="pl-2 mb-2 form-control" id="menu1" name="menu1">
		                <input type="text" class="pl-2 mb-2 form-control" id="menu2" name="menu2">
		                <input type="text" class="pl-2 mb-2 form-control" id="menu3" name="menu3">
		                <input type="text" class="pl-2 mb-2 form-control" id="menu4" name="menu4">
		                <input type="text" class="pl-2 mb-2 form-control" id="menu5" name="menu5">
		                <input type="text" class="pl-2 form-control" id="menu6" name="menu6">
	            	</div>
	            	<div class="col-6">
						<div class="input-group">
	                    <div class="input-group-prepend">
	                    	<span class="input-group-text" id="inputGroupFileAddon01"><i class="far fa-image"></i></span>
	                    </div>
		                    <div class="custom-file">
		                    	<input type="file" name="file" class="custom-file-input" id="inputGroupFile">
		                        <label class="custom-file-label" for="inputGroupFile" id="fileName" style="text-align:left;">이미지 업로드</label>
		                   	</div>
	                    </div>
	            		<div class="pt-3" id="modal_img">
	            			<!-- 이미지 넣기 -->
	            		</div>
	            	</div>
	            </div>
	            <div class="modal-footer">
		            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="delete">삭제</button>
		            <button type="button" class="btn btn-primary" id="update">수정</button>
	            </div>
	        </div>
        </div>
    </form>
    </div>    
    
    
	<script>
	    function strNum(num){ // 8월달 08로 출력하기 만드는 함수.
	        if(num<10){
	            return "0" + num;
	        }else{
	             return num;
	        }
	    }
	    
		// 달력 내용 넣어주기
		function calAjax(month){
			$.ajax({
				url:"/meal/calendar",
				data:{"month":month},
				dataType:"json"
			}).done(function(resp){
				for(let i=0;i<resp.length;i++){
					let menu = $("<div>");
					menu.addClass("menu");
			        menu.append(resp[i].menu1+"<br>"+resp[i].menu2);
			        
            		if(resp[i].menu3 != null){
            			menu.append("<br>"+resp[i].menu3);
            		}else{menu.append("<br>");}
            		
            		if(resp[i].menu4 != null){
            			menu.append("<br>"+resp[i].menu4);
            		}else{menu.append("<br>");}
            		
            		if(resp[i].menu5 != null){
            			menu.append("<br>"+resp[i].menu5);
            		}else{menu.append("<br>");}
            		
            		if(resp[i].menu6 != null){
            			menu.append("<br>"+resp[i].menu6);
            		}else{menu.append("<br><br>");}

            		let hidden = $("<input>");
            		hidden.attr("type","hidden");
            		hidden.addClass("sysname");
            		hidden.attr("value", resp[i].sysName);
            		
            		$("."+resp[i].meal_date).append(menu);
            		$("."+resp[i].meal_date).append(hidden);
				}
			})
		}
  
	    // 달력만들기 함수
	    function calendar(today) {
	        const year = today.getFullYear(); //2021
	        const month = today.getMonth()+1; // 배열이 0번부터 시작해서 +1 을 해준다! = 8
	            
	        let strMonth = strNum(month); 
	        console.log(strMonth);
	            
	        const nowDay = new Date(year, today.getMonth(), 1); // 이번년도, 이번달, 1일 세팅
	        const firstDate = 1;
	        const firstDay = nowDay.getDay(); // 1일의 요일 구하기
	        const lastDate = new Date(year, month, 0).getDate(); // 마지막 날 구하기
	        const lastDay = new Date(year, month, 0).getDay(); // 마지막날의 요일 구하기
	            
	        var dates = []; // 그 달의 날짜 뽑기
	        for(let i=1;i<lastDate+1;i++){
	            dates.push(i);
	        }
	
	        let week = Math.ceil(lastDate/7); // 몇주인지 구하기
	
	        $("#calNaviTitle").append(year + "년 " + strMonth + "월 "); // title
	            
	        // 일, 월, 화, 수, 목, 금, 토 로 만들거임.
	        //첫주
	        if(firstDay == 0){
	            let row = document.getElementById("tbody").insertRow(-1); // tr만듬.
	            for(let i=0; i<7; i++){ 
	                let now = dates.shift();
	                let cell = row.insertCell();
	                cell.innerHTML="<div class='row m-0 w-100'><div class='col-12 col-sm-3 date'>"+now+"</div></div>";
	                cell.className = year + "-" + strMonth + "-" + strNum(now);
	            }
	        }else{
	            let row = document.getElementById("tbody").insertRow(-1); // tr만듬.
	            for(let i=0;i<firstDay;i++){ // 첫주 첫날 앞 빈칸 만들어주기
	                row.insertCell().innerHTML = "";
	            }
	            for(let j=firstDay; j<7; j++){ 
	                let now = dates.shift();
	                let cell = row.insertCell();
	                cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
	                cell.className = year + "-" + strMonth + "-" + strNum(now);
	            }
	        }
	            
	        // 중간주
	        for(let i=1;i<week-1;i++){
	            let row = document.getElementById("tbody").insertRow(-1); // tr만듬.
	            for(let i=0; i<7; i++){ 
	                let now = dates.shift();
	                let cell = row.insertCell();
	                cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
	                cell.className = year + "-" + strMonth + "-" + strNum(now);
	            }
	        }
	            
	        // 마지막주
	        if(lastDay == 6){
	            let row = document.getElementById("tbody").insertRow(-1); // tr만듬.
	            for(let i=0; i<7; i++){ 
	                let now = dates.shift();
	                let cell = row.insertCell();
	                cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
	                cell.className = year + "-" + strMonth + "-" + strNum(now);
	            }
	        }else{
	            let row = document.getElementById("tbody").insertRow(-1); // tr만듬.
	            for(let i=0;i<lastDay+1;i++){ // 첫주 첫날 앞 빈칸 만들어주기
	                let now = dates.shift();
	                let cell = row.insertCell();
	                cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
	                cell.className = year + "-" + strMonth + "-" + strNum(now);
	            }
	            for(let j=lastDay; j<6; j++){ 
	                row.insertCell().innerHTML = "";
	            }
	        }
	    }
	</script>
    
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>