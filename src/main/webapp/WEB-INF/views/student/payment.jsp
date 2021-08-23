<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
</style>

<script>

	function iamport(){
		
		let st_name = $("#st_name").val();
		let school = $("#school").val();
		let money = $("#money").val();
		let st_email = $("#st_email").val();
		
			//가맹점 식별코드
		IMP.init('imp47415302');
		IMP.request_pay({
		pg : 'html5_inicis',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '급식비 결제' , //결제창에서 보여질 이름
		amount : money, //실제 결제되는 가격
		buyer_email : st_email,
		buyer_name : st_name,
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울 강남구 도곡동',
		buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
		if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
		    msg += '\n 고유ID : ' + rsp.imp_uid;
		    msg += '\n 상점 거래ID : ' + rsp.merchant_uid;
		    msg += '\n 결제 금액 : ' + rsp.paid_amount;
		    msg += '\n 카드 승인번호 : ' + rsp.apply_num;
 		    location.href="/sdt/payInfo?st_name="+st_name+"&school="+school+"&pay="+money+"&st_email="+st_email+"&pay_num="+rsp.apply_num
		} else {
			 var msg = '결제에 실패하였습니다. \n 결제 페이지로 돌아갑니다.';
		     msg += '\n 에러내용 : ' + rsp.error_msg;
		     location.href="/sdt/payHome"
			}
			alert(msg);
			});
		}

	$(function(){
		$("#pay").on("click", function(){
			iamport();
		})
	})

</script>
</head>

<body>

	<table align="center">
		<tr>
			<th colspan="">결제정보
		</tr>
		<tr>
			<td>학생이름
			<td><input type="text" name="st_name" id="st_name">
		</tr>
		<tr>
			<td>소속학교
			<td><input type="text" name="school" id="school">
		</tr>
		<tr>
			<td>결제금액
			<td>${pay}
			<!-- <input type="text" id="money" name="pay"> -->
		</tr>
		
		<tr>
			<td>학생 이메일
			<td><input type="text" name="st_email" id="st_email">
		</tr>
		
		<tr>
			<td><button id="pay">결제하기</button>
		</tr>
	</table>

</body>
</html>