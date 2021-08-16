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
</head>
<style>
	/* 채팅방 header, container main */
    .main{margin:auto; max-width:1000px;}
    .main .box{height:500px; border:1px solid black;}
    .main #send{width:100%; height:100%;}
    .main #message{resize:none; width:100%; height:100%;}
    .main .chat_contents{overflow: hidden; height:500px; overflow-y:auto ;}

	.chatRoom_name{text-align:center; max-width:950px; }
	.chatRoom{border:1px solid black; background-color:rgb(255, 225, 148, 0.5); display:inline-block; width:400px; border-radius:20px;}
    
.right{text-align:right; list-style: none; }
.my_name{text-align:center; width:10%; border:0px; font-size:20px; font-weight: bold; background:#dff1e4;}
.my_contents{display: inline-block; word-break:break-all; border:0px;}

.left{list-style: none;}
.other_name{width:10%; border:0px; font-size:20px; font-weight: bold;}
.other_contents{display: inline-block; word-break:break-all; border:0px;}
</style>
<script>
    $(function(){
    	
    	// url이 상대방 이메일일때 웹소켓 연결되는 코드
    	//let user2 = '${user2}';
    	//let ws = new WebSocket("ws://59.6.83.84/toChat/user2/"+ user2);
    	
    	let room_number = '${room_number}';
    	let ws =  new WebSocket("ws://59.6.83.84/toChat/room_number/"+ room_number);
    	
    	// 현재 시간 출력
    	var today = new Date();

    	var year = today.getFullYear();
    	var month = ('0' + (today.getMonth() + 1)).slice(-2);
    	var day = ('0' + today.getDate()).slice(-2);
    	var hours = ('0' + today.getHours()).slice(-2); 
    	var minutes = ('0' + today.getMinutes()).slice(-2);
    	var seconds = ('0' + today.getSeconds()).slice(-2); 

    	var dateString = year + '-' + month  + '-' + day;
    	var timeString = hours + ':' + minutes  + ':' + seconds;
        
        function updateScroll(){
			var element = document.getElementById("chat_contents");
			element.scrollTop = element.scrollHeight;
		}
        
        $("#send").on("click",function(e){
            $("#message").focus();
            let message = $("#message").val();
            
            if(message.replace(/\s|　/gi, '').length == 0){
                alert("내용을 입력해주세요");
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

        $("#message").on("keyup",function(e){
            if(e.keyCode==13 && e.shiftKey == false){
               	let message = $("#message").val();
             	if(message.replace(/\s|　/gi, '').length == 0){
                	alert("내용입력");
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
    
    ws.onmessage = function(event){
        	console.log(event.data);
        	let data = JSON.parse(event.data);
        	
        	let ul = $("<ul>");
        	let li_left = $("<li>");
        	li_left.addClass("left pr-4")
        	
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
<div class="container chatRoom_name">
	<div class="row pl-3 pt-5">
		<div class="chatRoom"><h3><i class="far fa-envelope"></i>&nbsp;&nbsp;${receiver_name}님과의 채팅방</h3></div>
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
            					<button class="my_name" data-toggle="tooltip" data-placement="left" title="${i.time}">${login.name}</button>
            					<div class="col-12 my_contents"><sub class="p-1"><fmt:formatDate value="${i.time}" pattern="HH:mm"/></sub>${i.contents}</div>
            				</li>
            			</ul>	
            		</c:when>
            		<c:otherwise>
            			<ul>
            				<li class="left">
            					<button class="other_name" data-toggle="tooltip" data-placement="right" title="${i.time}">${receiver_name}</button>
            					<div class="col-12 other_contents">${i.contents}<sub class="p-1"><fmt:formatDate value="${i.time}" pattern="HH:mm"/></sub></div>
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
        <div class="row">
            <div class="col-10 p-0"><textarea id="message" placeholder="메세지를 입력하세요"></textarea></div>
            <div class="col-2 p-0"><button id="send">전송</button></div>
        </div>
    </div>
<!-- footer -->
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>