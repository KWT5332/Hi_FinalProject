<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
	#meal{background-color: #124352;}
	*{text-align:center;}

    /* 메인 스타일 */
    .custom-file-label::after {
        content: "파일찾기";
    }
    #first{background-color:#dff1e4;border-radius: 12px;;}
    #addmeal{background-color:white;}
    input{text-align: left;}
    input[id^="menu"]{width:94.5%;}
    #submit{border: 1px solid #114E60;background-color: #114E60;color:white;width:200px;}   
    #submit:hover{border: 1px solid #114E60;background-color:white;color:#114E60;}

    #second{background-color:#dff1e4;border-radius: 12px;}
    #history{background-color:white;}
    #test:hover{background-color: rgb(233, 236, 239);}

    .use{background-color:#dff1e4;color:rgb(70, 70, 70);}
        #use{background-color:#dff1e4;color:rgb(70, 70, 70);}
    .use:hover{font-weight:700;border:1px solid #114E60;color:#114E60;}
    .menu{line-height:38px;}
    .date{line-height:38px;}
    

</style>
<script>
    $(function(){
    	if(${login.name != null}){
    		alert("dd");
    	}
    	
		$("#inputGroupFile").on("change", function(){ // 값이 변경되면 
//            if(window.FileReader){ // modern browser 
//            var filename = $(this)[0].files[0].name; 
//            } else { // old IE 
//            var filename = $(this).val().split("/").pop().split("\\").pop(); // 파일명만 추출 
//            } 
			var file = $(this)[0].files[0];
			
			if(file.size >= 1048576) {
			    alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
			    return false;
			}

			let regex = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
			if(!regex.test(file.name)){
			    alert("이미지 파일만 업로드 가능합니다.");
			    return false;
			}
			
            $("#fileName").text(file.name); // 추출한 파일명 삽입
            
            if(this.files && this.files[0]){
            	var reader = new FileReader;
            	reader.onload = function(data){
            		$("#img").attr("src",data.target.result).width(500);
            	}
            	reader.readAsDataURL(this.files[0]);
            }
            
        });
    	
        // 식단 메뉴 추가
        let i = 2;
        $("#button-addon2").on("click",function(){
            if(i<7){
                let menu = $("#menu");

                let input = $("<input>");
                input.attr("type","text");
                input.addClass("pl-2 mb-2 form-control");
                input.attr("id","menu"+i);
                input.attr("name","menu"+i);

                menu.append(input);
                $("#menu"+i).focus();
                i++;
            }else{
                alert("식단은 최대 6개 까지만 추가 가능합니다.");
            }
        });

        // 식단 등록하기
        let isDateOk = true;
        $("#meal_date").on("change", function(){ // 값이 변경되면 
         	$.ajax({
        		url:"/meal/isDateOk",
        		data:{"meal_date":$(this).val()}
        	}).done(function(resp){
        		if(resp=="1"){
        			alert("이미 식단이 짜여져 있는 날짜입니다. 다른 날짜를 선택해주세요.");
        			isDateOk = false;
        		}
        	}) 
        })
        
        $("#submit").on("click",function(){
        	if(!isDateOk){
        		alert("이미 식단이 짜여져 있는 날짜입니다. 다른 날짜를 선택해주세요.");
        	}else if($("#meal_date").val() == null || $("#meal_date").val() == "") {
        		alert("날짜를 선택해주세요.");
        	}else if($("#menu1").val() == null || $("#menu1").val() == "" || $("#menu1").val() == " " 
        			|| $("#menu2").val() == null || $("#menu2").val() == "" || $("#menu2").val() == " ") {
        		alert("식단 메뉴를 2개 이상 등록해 주세요.");
        	}else{
      			$("#frm").attr("action","/meal/addmealProc");
      			$("#frm").submit();
        	}
        	
        })
        
        // 최근저장한 식단 사용
        $("body").on("click",".use",function(){
            for(let i=2;i<7;i++){
                $("#menu"+i).remove();
            }

            let str = $(this).parent().siblings(".menu").html();
            let menus = str.split(",");

            for(let i=0;i<menus.length;i++){
                $("#menu" + (i+1)).val(menus[i]);

                if(i<(menus.length-1)){
                    let menu = $("#menu");

                    let input = $("<input>");
                    input.attr("type","text");
                    input.addClass("pl-2 mb-2 form-control");
                    input.attr("id","menu"+(i+2));
                    input.attr("name","menu"+(i+2));

                    menu.append(input);
                }
            }
        });
        
        // 무한 스크롤 
        let currentPage = 1;
        let isLoading = false;

        $(window).on("scroll",function(){
        	let scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
        	let windowHeight =  $(window).height(); // 웹브라우저 창의 높이
        	let documentHeight = $(document).height(); // 문서 전체 높이
        	let isBottom = scrollTop + windowHeight + 100 >= documentHeight; // 바닥까지 스크롤되었는지 여부
        	
        	if(isBottom) {
        		if(currentPage == ${totalPageCount} || isLoading) { // 마지막 페이지라면 실행하지 않는다.
        			return;
        		}
        		isLoading = true;
        		
        		currentPage++;
        		console.log("inscroll"+currentPage);
        		GetList(currentPage);
        	}
        })
        
        const GetList = function(currentPage){
        	console.log("inGetList"+currentPage);
        	$.ajax({
        		url:"/meal/historyList",
        		method:"GET",
        		data:{"pageNum":currentPage},
        		dataType:"json"
        	}).done(function(resp){
        		console.log(resp[0].menu1);
        		for(var i=0;i<resp.length;i++){
            		let tr = $("<tr>");
            		tr.addClass("test");
            		
            		let date = $("<td>");
            		date.addClass("p-2");
					date.append(resp[i].meal_date);
            		
            		let menu = $("<td>");
            		menu.addClass("p-2 menu");
            		
            		menu.append(resp[i].menu1);
            		menu.append("," + resp[i].menu2);
            		
            		if(resp[i].menu3 != null){
            			menu.append("," + resp[i].menu3);
            		}
            		if(resp[i].menu4 != null){
            			menu.append("," + resp[i].menu4);
            		}
            		if(resp[i].menu5 != null){
            			menu.append("," + resp[i].menu5);
            		}
            		if(resp[i].menu6 != null){
            			menu.append("," + resp[i].menu6);
            		}
            		
            		let foot = $("<td>");
            		foot.addClass("p-2");
            		
            		let btn = $("<button>");
            		btn.addClass("btn use");
            		btn.attr("id","use");
            		btn.append("사용");
            		
    				foot.append(btn);
    				
    				tr.append(date);
    				tr.append(menu);
    				tr.append(foot);
            		
    				$("#history").find("tbody").append(tr);
        		}

        		isLoading = false;
        	})
        }
    })
</script>
</head>
<body>
 <jsp:include page="../layout/header.jsp"/>
    
    <!-- 식단 등록 양식 -->
    <div class="container pt-5 pl-5 pr-5 pb-4">
        <div class="p-4" id="first" style="background-color:#dff1e4;">
            <p>
                <strong style="font-size:25px;color:rgb(70, 70, 70);">식단 등록 양식</strong>
            </p>
            <div class="row m-0 p-3" id="addmeal">               
                <div class="col-12 p-0">
                <form action="" method="POST" enctype="multipart/form-data" id="frm">
                    <table border="1" class="w-100 table table-bordered">
                        <tr>
                            <th class="p-2" width="25%">등록자</th>
                            <td class="p-2" width="75%">${login.name }</td>
                            <!-- 세션에 담긴 이름 출력 -->
                        </tr>
                        <tr>
                            <th class="p-2" style="line-height: 30px;">날짜</th>
                            <td class="p-2"><input type="date" id="meal_date" name="meal_date"></td>
                        </tr>
                        <tr>
                            <td class="p-2">
                                <strong>식단표</strong><br><br><p class="m-0">최소 2개, 최대 6개까지<br>등록 가능합니다.</p>
                            </td>
                            <td class="p-2" id="menu">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" id="menu1" name="menu1" aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <div class="input-group-append">
                                      <button class="btn btn-outline-secondary" type="button" id="button-addon2">+</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="p-2" style="line-height: 38px;">이미지 업로드</th>
                            <td class="p-2">
                            	<div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupFileAddon01"><i class="far fa-image"></i></span>
                                    </div>
                                    <div class="custom-file">
                                        <input type="file" name="file" class="custom-file-input" id="inputGroupFile">
                                        <label class="custom-file-label" for="inputGroupFile" id="fileName">관련 이미지를 업로드 하세요.</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                        	<th class="p-2" >이미지 확인</th>
                        	<td class="p-2">
                        		<img id="img">
                        	</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="p-2" style="text-align:right;">
                                <button class="btn" id="submit">식단 등록하기</button>
                            </td>
                        </tr>
                    </table>
                </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 최근 저장한 식단 목록 -->
    <div class="container pl-5 pr-5 mt-2 mb-5">
        <div class="p-4" id="second" style="background-color:#114E60;">
            <p>
                <strong style="font-size:22px;color:#FDFAF6;">최근에 저장한 식단 목록</strong>
            </p>
            <div class="row m-0 p-3" id="history">               
                <div class="col-12 p-0">
                    <table class="w-100 table table-bordered">
                        <tr>
                            <th class="p-2" width="20%">등록 날짜</th>
                            <th class="p-2" width="65%">식단 메뉴</th>
                            <th class="p-2" width="15%">사용 여부</th>
                        </tr>
                        <c:forEach var="list" items="${list }" varStatus="s">
                        <tr id="test">
                            <td class="p-2 date">${list.meal_date }</td>
                            <td class="p-2 menu">${list.menu1},${list.menu2}
	                            <c:if test="${not empty list.menu3}">,${list.menu3}</c:if>
								<c:if test="${not empty list.menu4}">,${list.menu4}</c:if>
								<c:if test="${not empty list.menu5}">,${list.menu5}</c:if>
								<c:if test="${not empty list.menu6}">,${list.menu6}</c:if>
                            </td>
                            <td class="p-2"><button class="btn use" id="use">사용</button></td>
                        </tr>	
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
 <jsp:include page="../layout/footer.jsp"/>
</body>
</html>