<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급식비 결제 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>

@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{font-family:'GowunDodum-Regular';} 

* {box-sizing: border-box;}
.container {width:500px; height:400px; position:absolute; top:50%; left:50%; margin:-200px 0px 0px -250px; background:white;}
.box {margin:0 auto; font-size:20px; padding:10px 0px 10px 0px;}
#title {background:#17a2b8; color:#fff;}
.main {margin-top: 10px;}
.title {text-align:right;}
.input {text-align:left;}

input[class=form-control]{width:220px;}
input[id=payment]{width:200px; display:inline-block;}

</style>

<script>

	function iamport(){
		
		let st_name = $("#st_name").val();
		let st_email = $("#st_email").val();
		let st_school = $("#st_school").val();
		let payment = ${pay};
		let month = $("#month").val();
		
		//가맹점 식별코드
		IMP.init('imp47415302');
		IMP.request_pay({
		pg : 'html5_inicis',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '급식비 결제' , //결제창에서 보여질 이름
		amount : payment, //실제 결제되는 가격
		buyer_email : st_email,
		buyer_name : st_name
		
	}, function(rsp) {
		console.log(rsp);
		
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			/* msg += '\n 고유ID : ' + rsp.imp_uid; */
		    msg += '\n 상점 거래ID : ' + rsp.merchant_uid;
		    msg += '\n 결제 금액 : ' + rsp.paid_amount;
		    msg += '\n 카드 승인번호 : ' + rsp.apply_num;
		    
		    $.ajax({
				type : "POST",
				url : "/sdt/payInfo", 
				data:{"st_name":st_name, "st_email":st_email, "st_school":st_school, "payment":payment, "apply_num":rsp.apply_num, "month":month}
				}).done(function(resp) {
					location.href="/sdt/researchHome";}) 
		} else {
			var msg = '결제에 실패하였습니다. \n 결제 페이지로 돌아갑니다.';
			msg += '\n 에러내용 : ' + rsp.error_msg;
			javascript:history.back();}
		alert(msg);
		});
	}

	$(function(){
		$("#pay").on("click", function(){
			let st_name = $("#st_name").val();
			let st_email = $("#st_email").val();
			console.log(st_name+"+"st_email")
			if ($('#st_name').val()==" "){
				alert("이름을 작성해주세요");
				 $('#st_name').focus();
				return;
			}else if ($('#st_email').val()==" "){
				alert("이메일을 입력 해주세요");
				 $('#st_email').focus();
				return;
			}else{
				iamport();
			}
		})
		
		/* let name = $("#st_name").val();
		let email = $("#st_email").val();
		*/
	})

</script>
</head>

<body>

	<div class="container shadow-lg p-3 mb-5 bg-white rounded" align="center">
		<div class="row box">
			<div class="col main">
			<h3 id="title"><strong>${month}월 결제정보</strong>
				<input type="hidden" id="month" value="${month}"></h3>
			</div>
		</div>
		
		<div class="row box">
			<div class="col-4 title">
				학생 이름
			</div>
			<div class="col-8 input">
				<input class="form-control" type="text" name="st_name" id="st_name" required>
			</div>
		</div>
		
		<div class="row box">
			<div class="col-4 title">
				학생 이메일
			</div>
			
			<div class="col-8 input">
				<input class="form-control" type="text" name="st_email" id="st_email" required>
			</div>
		</div>
		
		<div class="row box">
			<div class="col-4 title">
				소속 학교
			</div>
			
			<div class="col-8 input">
				<input class="form-control" type="text" name="st_school" id="st_school" value="${school}" readonly>
			</div>
		</div>
		
		<div class="row box">
			<div class="col-4 title">
				결제 금액
			</div>
			
			<div class="col-8 input">
				<input class="form-control" type="text" id="payment" name="payment" value="${pay}" readonly>  원
			</div>
		</div>
		
		<div class="row box">
			<div class="col-12">
				<button id="pay" class="btn btn-outline-info">결제하기</button>
			</div>
		</div>
	
	</div>

</body>
</html>