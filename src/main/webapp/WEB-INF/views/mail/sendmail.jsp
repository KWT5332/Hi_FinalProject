<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
<style>
#mail{background-color: #124352;}
* {box-sizing: border-box;}
select[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}

input[type]:focus {
	border-color: rgba(184, 223, 216, 0.5);
	box-shadow: 0 1px 1px rgb(184, 223, 216, 0.904) inset, 0 0 20px
		rgb(184, 223, 216, 0.6);
	outline: 0 none;
}
input[type] {border-color: #b2dabd;}
.sendmail_container{overflow: hidden;}
.sendmail_container .incon {overflow: hidden;}
.sendmail_container .studentcon {text-align: center;}
.studentAdd>div{width:100%;}
.studentAdd>div>input{width:100%;}
/* 엑셀관련 스타일 */
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
    .btn_sendmail{background-color:rgb(255, 241, 224);border:1px solid rgb(255, 241, 224);color:rgb(70, 70, 70);}
    .btn_sendmail:hover{background-color:rgb(255, 196, 119);border:1px solid rgb(255, 196, 119);}
    #add{background-color:#dff1e4;color:rgb(105, 105, 105);border:1px solid #dff1e4;}
    #add:hover{font-weight:700;color:rgb(94, 94, 94);background-color:#cbebd4;}
    .modify{border:1px solid rgb(255, 196, 119);color:black;}
    .modify:hover{background-color:rgb(255, 196, 119);border:1px solid rgb(255, 196, 119);color:white;}
    .delete{background-color:#114E60;color:white;border:1px solid #114E60;}
    .delete:hover{background-color: #356979;color:white;}
    .modal input[type] {border-color: rgb(170, 170, 170);}
    .modal input[type]:focus {
        border-color: rgb(170, 170, 170);
        box-shadow: 0 1px 1px rgb(170, 170, 170) inset, 0 0 3px
        rgb(170, 170, 170);
        outline: 0 none;
    }
    td{height:25px;}
</style>
<script>
	$(function() {
      	$('#dataTable').DataTable({ // DataTables API 적용
   		    "language": {
     		   "emptyTable": "등록된 학생 주소록이 없습니다.",
  	   		   "search": "검색 : ",
  	           "zeroRecords": "일치하는 데이터가 업ㄱ습니다.",
  	           "paginate": {
  	               "next": "다음",
  	               "previous": "이전"
  	           }
     		},
      		"columns":[
      			{"data" : "번호"},
      			{"data" : "학생이름"},
      			{"data" : "소속학교"},
      			{"data" : "이메일"},
      			{"data" : "수정"},
      			{"data" : "삭제"}
      		],
   			order:[0,"desc"], // 정렬 초기화 작업 "asc"
   			ordering:false,
   			lengthMenu:[10,20,30], // 표시 건수 단위
   			lengthChange:false, // 표시건수 기능 숨기기
   			displayLength:10 // 기본적으로 1페이지당 표시될 게시물의 개수

      	});
		
	    function strNum(num){ // 8월달 08로 출력하기 만드는 함수.
	        if(num<10){
	            return "0" + num;
	        }else{
	             return num;
	        }
	    }
		/* 메일전체발송 */
		$(".btn_sendmail").click(function() {
			$("#modal").modal("show");
			
			$("#send").on("click",function(){
				//alert("전체 학생에게 메일을 발송합니다.\n발송 완료 후 메일보내기 작은 창이 나가게 됩니다. \n잠시 기다려 주세요.");
				Swal.fire({
					icon:'success',
					title:'전체 학생에게 메일을 발송합니다.\n발송 완료 후 메일보내기 작은 창이 나가게 됩니다.',
					text:'잠시 기다려 주세요.',
					showConfirmButton: false,
					timer: 2000
				})
				let month = $("#month").val();
				let strMonth = strNum(month);

                $("#content").val($("#textarea").val());

  				$.ajax({
					type : "GET",
					url : "/mail/sendMailProc", 
					data:{"title":$("#title").val(), "content":$("#content").val(), "month":strMonth, "payment":$("#payment").val()}
 				}).done(function(resp) {
 						$("#modal").modal("hide");
						console.log("확인");
				}) 
			})
		})
		/* 학생정보추가 */
		$("#add").click(function(){
			$.ajax({
				type : "POST",
				url : "/mail/addStudentProc",
				data: $("#frm").serialize(),
				success : function(){
					$("#stu_name").val("");
					$("#stu_email").val("");
					location.reload();
				}
			})
		})
		
		/*$(".delete").click(function(){
			if(confirm("정말로 학생을 삭제하시겠습니까?")){
				let seq = $(this).parent().siblings(".seq").val();
				$.ajax({
					type:"POST",
					url:"/mail/deleteStudentProc",
					data:{"seq" : seq}
				}).done(function() {
					location.reload();
				})
			}
		})*/
		$(".delete").click(function(){
			Swal.fire({ 
	    		  title:'정말로 학생을 삭제하시겠습니까?', 
	    		  icon: 'warning', 
	    		  showCancelButton: true, 
	    		  confirmButtonColor: '#3085d6', 
	    		  cancelButtonColor: '#d33', 
	    		  confirmButtonText: '삭제', 
	    		  cancelButtonText: '취소' 
	    	}).then((result) => {
	    		if(result.value){
	    			let seq = $(this).parent().siblings(".seq").val();
					$.ajax({
						type:"POST",
						url:"/mail/deleteStudentProc",
						data:{"seq" : seq}
					}).done(function() {
						location.reload();
					})	
	    		}
	    	})
		})
		
		$(".modify").click(function(){
			if($(this).text() == "수정"){
				$(this).text("완료");
				$(this).parent().siblings(".name").attr("contenteditable", "true");
				$(this).parent().siblings(".email").attr("contenteditable", "true");
				$(this).parent().siblings(".name").focus();
			}else{
				$(this).text("수정");
				$(this).parent().siblings(".name").attr("contenteditable", "false");
				$(this).parent().siblings(".email").attr("contenteditable", "false");
				
				let seq = $(this).parent().siblings(".seq").val(); 
				let stu_name = $(this).parent().siblings(".name").text();
				let stu_email = $(this).parent().siblings(".email").text();
				$.ajax({
					type:"POST",
					url:"/mail/updateStudentProc",
					data:{"seq" : seq, "name" : stu_name, "email" : stu_email}
				}).done(function() {
					location.reload();
				})
			} 
		})

		// 엑셀 업로드 양식 다운받기
		$("#excelform").on("click", function() {
			location.href = "/excel/excelformMail";
		});
		// 파일이름 출력
		var fileTarget = $(".filebox .upload-hidden");

		fileTarget.on("change", function() { // 값이 변경되면 
			// 추출한 파일명 삽입 
			//jsp에서 FORM을 생성하여 넘기지 않았을때 스크립트에서 formData로 file을 가져올 수 있다.
			var form = $("#excelfrm")[0];
			var formData = new FormData(form);
			//formData.append("file", $(this)[0].files[0]); //배열로 되어있음 / formData는 Map과 같은 형태

			var fileName = formData.get('file').name;
			// 추출한 파일명 삽입 
			$(this).siblings(".upload-name").val(fileName);

			if (formData.get('file').size >= 1048576) {
				//alert("업로드 할 수 있는 파일 사이즈를 초과했습니다.");
				 Swal.fire({
					icon: 'warning',
					title: '업로드 할 수 있는 \n파일 사이즈를 초과했습니다.',
					text: '파일크기를 확인해주세요.'
				 })
				return false;
			}

			let regex = /(.*?)\.xlsx/;
			if (!regex.test(fileName)) {
				//alert("확장자가 .xlsx인 파일만 업로드 가능합니다.");
				Swal.fire({
					icon: 'warning',
					title: '확장자가 .xlsx인 파일만 업로드 가능합니다.'
				 })
				return false;
			}

			/*if (confirm("선택하신 파일을 업로드 하시겠습니까?")) {
				$.ajax({
					type : "POST",
					url : "/excel/exceluploadMail",
					data : formData,
					processData : false, // data가 서버에 전달될때 String 형식아니고 "multipart/form-data"로 보내야됨
					contentType : false, // "application/x-www-form-urlencoded; charset=UTF-8"이것이 아니라 "multipart/form-data"로 보내야됩니다.
					cache : false
				}).done(function(resp) {
					console.log(resp);
					$(".upload-name").val("파일선택");
				})
			}*/
			Swal.fire({ 
	    		  title:"선택하신 파일을\n업로드 하시겠습니까?",
	    		  icon: 'question', 
	    		  showCancelButton: true, 
	    		  confirmButtonColor: '#3085d6', 
	    		  cancelButtonColor: '#d33', 
	    		  confirmButtonText: '업로드', 
	    		  cancelButtonText: '취소' 
	    		}).then((result) => {
	    			if(result.value){
	    				$.ajax({
	    					type : "POST",
	    					url : "/excel/exceluploadMail",
	    					data : formData,
	    					processData : false, // data가 서버에 전달될때 String 형식아니고 "multipart/form-data"로 보내야됨
	    					contentType : false, // "application/x-www-form-urlencoded; charset=UTF-8"이것이 아니라 "multipart/form-data"로 보내야됩니다.
	    					cache : false
	    				}).done(function(resp) {
	    					console.log(resp);
	    					$(".upload-name").val("파일선택");
	    				})	
	    			}
	    		})
		});
	})
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />

<div class="sendmail_container container pt-5 pi-5 pr-5 mb-3">
        <div class="row m-0 mb-3 mt-5">
			<div class="col-6 ">
				<button class="btn btn_sendmail">전체학생에게 이메일 보내기</button>
			</div>
			<div class="col-6 " id="excleupload">
			<!-- <div class="col-12 col-sm-12 col-md-6 col-lg-4 p-0" id="excleupload"> -->
	        	<form id="excelfrm" name="excelfrm" method="POST" enctype="multipart/form-data">
	        	<div class="filebox" style="text-align: right;">
                    <button class="btn btn-outline-secondary btn " id="excelform" type="button">학생 정보 엑셀 업로드양식 다운</button>
	         	     <input type="hidden" class= "upload-name " value="파일선택" disabled="disabled">
	           		 <label for="excelName" class="mb-0">엑셀 업로드</label>
	            	 <input type="file" id="excelName" name="file" class="upload-hidden">
	            </div>
	        	</form>
	        </div>
        </div>
		<form id="frm">
		<div class="studentAdd row m-0">
			<div class="col-4">
				<input type="text" class="form-control" name="stu_name" id="stu_name" placeholder="학생이름을 입력하세요" style="text-align: center;">
			</div>
			<div class="col-4">
				<input type="text" class="form-control" name="stu_email" id="stu_email" placeholder="학생이메일을 입력하세요" style="text-align: center;">
			</div>
			<div class="col-4">
				<!-- 사용자 학교 정보 넣기 -->
				<!-- <input type="hidden" name="school" value="무학중"> -->
				<input type="button" class="btn btn-outline-success" id="add" value="학생 등록">
			</div>
		</div>
        </form>
    </div>
		
	<div class="container studentcon p-5" style="text-align:center">
		<h2 class="mb-3">학생 이메일 주소록</h2>
		<table class="table m-0 mb-1 w-100" id="dataTable">
			<thead>
			<tr>
				<td scope="col">번호</td>
				<td scope="col">학생이름</td>
				<td scope="col">소속학교</td>
				<td scope="col">이메일</td>
				<td scope="col">수정</td>
				<td scope="col">삭제</td>
			</tr>
			</thead>
<%--  			<c:choose>
				<c:when test="${not empty studentList }" > --%>
					<tbody>
					<c:forEach var="i" items="${studentList}" varStatus="status">
						<tr class="student_list pt-1 pb-1">
							<td scope="col" style="line-height:35px;">${status.count}</td>
							<input type="hidden" class="seq" name="seq" value="${i.seq }">
							<td scope="col" class="name" style="line-height:35px;">${i.stu_name}</td>
							<td scope="col" class="school" style="line-height:35px;">${i.school}</td>
							<td scope="col" class="email" style="line-height:35px;">${i.stu_email}</td>
							<td scope="col"><button type="button" class="modify btn">수정</button></td>
							<td scope="col"><button type="button" class="delete btn">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	
	<!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메일보내기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row m-0">
                        <div class="col-3"><p class="m-0" style="line-height:38px;font-weight:700;font-size:17px;">메일제목</p></div>
                        <div class="col-9"><input type="text" class="form-control" id="title" name="title"></div>
                    </div>
                    <hr>
                    <div class="row m-0 mb-3">
                        <div class="col-6"><p class="m-0" style="text-align:left;line-height:38px;font-size:15px;">몇월달 식단표를 보낼까요?</p></div>
                        <div class="col-6"><input type="text" class="pl-2 form-control" id="month" name="month"></div>
                    </div>
                    <div class="row m-0">
                        <div class="col-7 pr-0"><p class="m-0" style="text-align:left;line-height:38px;font-size:15px;">이번달 급식비(숫자로 적어주세요.)</p></div>
                        <div class="col-5"><input type="text" class="pl-2 form-control" id="payment" name="payment"></div>
                    </div>
                    <hr>
                    <div class="row m-0">
                        <p class="col-12">메일 내용</p>
                    </div>
                    <div class="row m-0">
                        <div class="col-12">                                
                            <textarea  style="width:100%;border:1;overflow:visible;text-overflow:ellipsis;" rows=10 id="textarea"></textarea>
                            <input type="hidden" id="content" name="content">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="send">메일보내기</button>
                </div>
            </div>
        </div>
    </div>      

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>


							