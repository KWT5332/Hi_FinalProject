<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상대방과 채팅하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
	/* */
    .container{margin:auto; max-width:1000px;}
    div{border:1px solid black;}
    .box{height:500px;}
    #send{width:100%; height:100%;}
    #message{resize:none; width:100%; height:100%;}
    .chat_contents{overflow: hidden; height:500px; overflow-y:auto ;}

    /* 말풍선*/
    .message_box {
	position: relative;
	background: #88b7d5;
	border: 4px solid #c2e1f5;
}
.message_box:after, .message_box:before {
	top: 100%;
	left: 90%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.message_box:after {
	border-color: rgba(136, 183, 213, 0);
	border-top-color: #88b7d5;
	border-width: 20px;
	margin-left: -20px;
}
.message_box:before {
	border-color: rgba(194, 225, 245, 0);
	border-top-color: #c2e1f5;
	border-width: 26px;
	margin-left: -26px;
}
</style>
<script>
    $(function(){
        
        function updateScroll(){
			var element = document.getElementById("chat_contents");
			element.scrollTop = element.scrollHeight;
		}
        $("#send").on("click",function(e){
            $("#message").focus();
            let message = $("#message").val();
            if(message==""){
                return false;
            }else if(message.replace(/\s|　/gi, '').length == 0){
                alert("내용을 입력해주세요");
                $("#message").focus();
                return false;
            }else{
                $("#message").val("");
            let message_box = $("<div>");
                message_box.addClass("row mb-4 message_box")

            let message_contents = $("<div>");
                message_contents.addClass("col-12")
                message_contents.css("text-align","right");
                message_contents.append(message);

                message_box.append(message_contents);
                $("#chat_contents").append(message_box);
                updateScroll(); 
            }
                   
        })

        $("#message").on("keydown",function(e){
            if(e.keyCode==13 && e.shiftKey == false){
                let message = $("#message").val();
            if(message==""){
                return false;
            }else if(message.replace(/\s|　/gi, '').length == 0){
                alert("내용입력");
                return false;
            }else{
                $("#message").val("");
            let message_box = $("<div>");
                message_box.addClass("row mb-4 message_box")

            let message_contents = $("<div>");
                message_contents.addClass("col-12")
                message_contents.css("text-align","right");
                message_contents.append(message);

                message_box.append(message_contents);
                $("#chat_contents").append(message_box);
                updateScroll(); 
            }    
        }
    })     
})
</script>
<body>
<!-- header -->
<jsp:include page="../layout/header.jsp"/>
<div class="container">
        <div class="row box">
            <div class="col-12 chat_contents" id="chat_contents">
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