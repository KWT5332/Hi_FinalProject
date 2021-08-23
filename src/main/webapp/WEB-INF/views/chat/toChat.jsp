<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상대방과 채팅하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<style>
	/* 채팅방 header, container main */
	.main{margin:auto; max-width:1000px;}
	.main .box{height:500px; background-color:#a9ccb3; border-radius:20px;}
	.main #send{width:100%; height:100%;}
	.main #message{resize:none; width:100%; height:100%;}
	.main .chat_contents{overflow:hidden; height:500px; overflow-y:auto ;}
	.chatRoom_name{max-width:950px;}
	.chatRoom{
	background-color:#FDFAF6; 
	width:500px; 
	border-radius:20px;
	}
	.chatRoom .profile_img{
	max-width:70px;
    min-width:70px;
    height:70px;
    border-radius:50%;
    background-color:gray;
    text-align:center;}
	.chatRoom h3{line-height:70px;}
	.right{text-align:right; list-style: none; }
	.my_name{
	text-align:center; 
	width:10%; 
	border:0px; 
	font-size:15px; 
	font-weight:bold; 
	background:#dff1e4;
	border-radius:20px;}
	.my_contents{display: inline-block; word-break:break-all; border:0px;}
	.left{list-style: none;}
	.other_name{width:10%; border:0px; font-size:15px; font-weight: bold;border-radius:20px;}
	.other_contents{display: inline-block; word-break:break-all; border:0px;}
	.profile_img{
	max-width:50px;
    min-width:50px;
    height:50px;
    border-radius:50%;
    background-color:gray;
    text-align:center;}
</style>
<script>
    $(function(){
    	
    	// url이 상대방 이메일일때 웹소켓 연결되는 코드
    	// let user2 = '${user2}';
    	// let ws = new WebSocket("ws://59.6.83.84/toChat/user2/"+ user2);
    	
    	let room_number = '${room_number}';
    	let ws =  new WebSocket("ws://59.6.83.84/toChat/room_number/"+ room_number);
    	
    	// 브라우저에 현재 시간 출력
    	var today = new Date();

    	var year = today.getFullYear();
    	var month = ('0' + (today.getMonth() + 1)).slice(-2);
    	var day = ('0' + today.getDate()).slice(-2);
    	var hours = ('0' + today.getHours()).slice(-2); 
    	var minutes = ('0' + today.getMinutes()).slice(-2);
    	var seconds = ('0' + today.getSeconds()).slice(-2); 

    	var dateString = year + '-' + month  + '-' + day;
    	var timeString = hours + ':' + minutes  + ':' + seconds;
        
    	// 채팅 창에서 스크롤바 가장 끝으로 가는 함수 
        function updateScroll(){
			var element = document.getElementById("chat_contents");
			element.scrollTop = element.scrollHeight;
		}
        
    	// 메세지 입력하고 전송버튼 '클릭'으로 채팅방에 나타내는 함수
        $("#send").on("click",function(e){
            $("#message").focus();
            let message = $("#message").val();
            
            // shift만 입력 막는 것
            if(message.replace(/\s|　/gi, '').length == 0){
                Swal.fire({
                	icon:'warning',
                	title:"내용을 입력해주세요",
                	text:"빈칸은 입력이 불가능합니다.",
                });
                return false;
            }else{
                $("#message").val("");
                let name = "${login.name}";
                
            	let ul = $("<ul>");
            	let li_right = $("<li>");
            	li_right.addClass("right pr-4")
            	
            	let button = $("<button>");
            	button.addClass("my_name");
            	button.attr("data-toggle","tooltip");
                button.attr("data-placement","left");
                button.attr("title",dateString);

            	button.append(name);
            	
            	let div = $("<div>");
            	div.addClass("col-12 my_contents");
            	
            	let sub = $("<sub>");
            	sub.addClass("p-1");
            	sub.text(timeString);
            	
            	div.append(sub);
            	div.append(message);
            	
            	li_right.append(button);
            	li_right.append(div);
            	
            	ul.append(li_right);
            	$("#chat_contents").append(ul);
            	 
                updateScroll(); 
                
                ws.send(message);
            }       
        })
	
        // 메세지 입력하고 엔터로 채팅방에 나타내는 함수
        $("#message").on("keyup",function(e){
            if(e.keyCode==13 && e.shiftKey == false){
               	let message = $("#message").val();
             	if(message.replace(/\s|　/gi, '').length == 0){
             		Swal.fire({
                    	icon:'warning',
                    	title:"내용을 입력해주세요",
                    	text:"빈칸은 입력이 불가능합니다.",
                    });
                	return false;
            	}else{
                	$("#message").val("");
                	let name = "${login.name}";
                    
                	let ul = $("<ul>");
                	let li_right = $("<li>");
                	li_right.addClass("right pr-4")
                	
                	let button = $("<button>");
                	button.addClass("my_name");
                	button.attr("data-toggle","tooltip");
                    button.attr("data-placement","left");
                    button.attr("title",dateString);

                	button.append(name);
                	
                	let div = $("<div>");
                	div.addClass("col-12 my_contents");
                	
                	let sub = $("<sub>");
                	sub.addClass("p-1");
                	sub.text(timeString);
                	
                	div.append(sub);
                	div.append(message);
                	
                	li_right.append(button);
                	li_right.append(div);
                	
                	ul.append(li_right);
                	$("#chat_contents").append(ul);
                	updateScroll();
                
                	ws.send(message);
            }    
        }
    })
    
    // 상대방 메세지 받아오는 웹소켓 함수
    ws.onmessage = function(event){
        	let data = JSON.parse(event.data);
        	
        	let ul = $("<ul>");
        	let li_left = $("<li>");
        	li_left.addClass("left pr-4")
        	
        	let img = $("<img class='profile_img'>");
        	
        	if(data.sysName != null){
        	    img.attr("src","/mem/display?fileName="+data.sysName);
        	}else{
        	    img.attr("src","/img/profile.png");
        	}
        	
        	let button = $("<button>");
        	button.addClass("other_name");
        	button.attr("data-toggle","tooltip");
            button.attr("data-placement","right");
            button.attr("title",dateString);

        	button.append(data.name);
        	
        	let div = $("<div>");
        	div.addClass("col-12 other_contents");
        	
        	let sub = $("<sub>");
        	sub.addClass("p-1");
        	sub.text(timeString);
        	
        	div.append(data.message);
        	div.append(sub);
        	
        	li_left.append(img);
        	li_left.append(button);
        	li_left.append(div);
        	
        	ul.append(li_left);
        	$("#chat_contents").append(ul);
        	updateScroll();
        } 
    	
})
</script>
<body>
<!-- header -->
<jsp:include page="../layout/header.jsp"/>
<div class="empty" style="height:50px;"></div>
<div class="container pt-3 chatRoom_name">
		<div class="row p-1 chatRoom">
			<div class="col-3">
			<c:choose>
            	<c:when test="${receiver_sysname != null}">
            		<img class="profile_img" src="/mem/display?fileName=${receiver_sysname}">
            	</c:when>
            	<c:otherwise>
            		<img class="profile_img" src="/img/profile.png">
            	</c:otherwise>
            </c:choose>
            </div>
            <div class="col-9 p-0">
			<h3>${receiver_name}님과의 채팅방&nbsp;&nbsp;<i class="far fa-envelope"></i></h3>
			</div>
		</div>
	</div>
<div class="container main p-5">
	<div class="row box">
	<!-- 과거 채팅방 기록 -->
		<div class="col-12 chat_contents" id="chat_contents">
            <c:forEach var="i" items="${list}">
            	<c:choose>
            		<c:when test="${i.sender == login.email}">
            			<ul>
            				<li class="right pr-4">
            					<button class="my_name" data-toggle="tooltip" data-placement="left" title="${i.time}">
            						${login.name}
            					</button>
            					<div class="col-12 my_contents">
            						<sub class="p-1"><fmt:formatDate value="${i.time}" pattern="HH:mm"/></sub>
            							${i.contents}
            					</div>
            				</li>
            			</ul>	
            		</c:when>
            		<c:otherwise>
            			<ul>
            				<li class="left">
            					<div class="img_box">
            						<c:choose>
            							<c:when test="${receiver_sysname != null}">
            								<img class="profile_img" src="/mem/display?fileName=${receiver_sysname}">
            							</c:when>
            							<c:otherwise>
            								<img class="profile_img" src="/img/profile.png">
            							</c:otherwise>
            						</c:choose>
            						<button type="button" class="other_name" data-toggle="tooltip" data-placement="right" title="${i.time}">
            							${receiver_name}
            						</button>
            					</div>
            					<div class="col-12 ml-5 other_contents">
            						${i.contents}
            							<sub class="p-1"><fmt:formatDate value="${i.time}" pattern="HH:mm"/></sub>
            					</div>
            				</li>
            			</ul>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            <script>
            	$("#chat_contents").scrollTop($("#chat_contents").prop("scrollHeight"));
            </script>
            </div>
	</div>  
	<div class="row pt-3">
		<div class="col-10 p-1"><textarea class="form-control" id="message" placeholder="메세지를 입력하세요"></textarea></div>
		<div class="col-2 p-1"><button id="send" class="btn btn-info">전송</button></div>
	</div>
</div>
<div class="empty" style="height:50px;"></div>
<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>