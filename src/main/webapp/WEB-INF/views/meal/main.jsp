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
    #table{width:100%; text-align:center;}
	td{height:200px;max-width: 25px;position: relative;}
    .date{border: 1px solid black;padding:0px;position:absolute;top:1px;}
    .menu{position:absolute;bottom:1px;width: 100%;padding-bottom: 15px;}
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
        	var form = $("#frm")[0];       
		    var formData = new FormData(form); 
		    //formData.append("file", $(this)[0].files[0]); //배열로 되어있음 / formData는 Map과 같은 형태
		        
		    var fileName = formData.get('file').name;
		    // 추출한 파일명 삽입 
	        $(this).siblings(".upload-name").val(fileName); 
		    
		    if(formData.get('file').size >= 1048576) {
		    	alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
		    	return false;
		    }

		    let regex = /(.*?)\.xlsx/;
		    if(!regex.test(fileName)){
		    	alert("확장자가 .xlsx인 파일만 업로드 가능합니다.");
		    	return false;
		    }
			
	        if(confirm("선택하신 파일을 업로드 하시겠습니까?")){
	            $.ajax({
	            	type:"POST",
	            	enctype: "multipart/form-data",
	            	url:"/excel/excelupload",
	            	data:formData,
	    			processData: false,
	    			contentType: false,
	    			cache: false,
	            	dataType:"json"
	            }).done(function(resp){
	            	alert("엑셀 업로드 성공!");
	            	$("#excelName").val("파일선택");
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
		
		$("#cal").on("click",function(){
			location.href = "/meal/calendar";
		});
		
		// 달력 내용 넣어주기
		$.ajax({
			url:"/meal/calendar",
			dataType:"json"
		}).done(function(resp){
			console.log(resp.length);
			for(let i=0;i<resp.length;i++){
				console.log(resp[i].meal_date);
		        $("."+resp[i].meal_date).append(
		        	"<div class='menu'>"+resp[i].menu1+"<br>"+resp[i].menu2+"<br>"+resp[i].menu3+"<br>"
		        	+resp[i].menu4+"<br>"+resp[i].menu5+"<br>"+resp[i].menu6+"</div>"
		       	);
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<button id="cal">캘린더</button>
    
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
      
      <div class="row m-0 mb-4">
        <div class="col-sm-6 col-md-6 col-lg-2 p-0 pt-1" style="text-align: left;">
          <button class="btn btn-secondary" id="addMeal">식단 추가하기</button>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-8 pl-4 pt-1">
          <h1 id="calNavi">&lt; &nbsp; 7월 &nbsp; &gt;</h1>
        </div>
        <div class="col-12 col-sm-12 col-md-6 col-lg-2 p-0 pt-1" style="text-align: right;">
          <button class="btn btn-secondary" id="download">엑셀 다운로드</button>
        </div>
      </div>
      
      <div>
      	 <table border="1" id="table" align="center">
			<tr>
				<th>일
				<th>월
				<th>화
				<th>수
				<th>목
				<th>금
				<th>토
			</tr>
		</table>
      </div>
    </div>
    
	<script>
		function strNum(num){ // 8월달 08로 출력하기 만드는 함수.
			if(num<10){
				return "0" + num;
			}else{
				return month;
			}
		}
		
		// 달력만들기.
		const today = new Date();
		
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
		
		$("#calNavi").text("< " + year + "년 " + strMonth + "월 	>"); // title
		
		// 일, 월, 화, 수, 목, 금, 토 로 만들거임.
		//첫주
		if(firstDay == 0){
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
                cell.innerHTML="<div class='row m-0 w-100'><div class='col-12 col-sm-3 date'>"+now+"</div></div>";
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}else{
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
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
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}
		
		// 마지막주
		if(lastDay == 6){
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML="<div class='row m-0 w-100'><div class='col-3 p-0 date'>"+now+"</div></div>";
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}else{
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
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
	</script>    
    
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>