<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급식 만족도 조사</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<style>

@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{font-family:'GowunDodum-Regular';}

.box-radio-input input[type="radio"]{display:none;}
.box-radio-input input[type="radio"] + span{
  display:inline-block;
  background:none;
  border:0.5px solid #dfdfdf;
  padding:0px 15px;
  text-align:center;
  height:30px;
  line-height:28px;
  font-weight:500;
  cursor:pointer;
  margin-right:10px;
}
.box-radio-input input[type="radio"]:checked + span{border:1px solid #23a3a7; background:#23a3a7;}

.container{border-radius:5px; margin-top:50px; margin-bottom:50px; padding:10px;}
.question{margin-top:30px; margin-bottom:20px;}
.question > strong{font-size:20px;}
.answer{margin-bottom:50px;}
#title{background:#dfdfdf;}
select > option {text-align:center;}

</style>

<script>
		
	$(function(){
		$('#etc').on('keyup', function() {
			$('#etc_cnt').html("("+$(this).val().length+" / 200)");
			if($(this).val().length > 200) {
				$(this).val($(this).val().substring(0, 200));
				$('#etc_cnt').html("(200 / 200)");
			}
		});
	})
	
</script>
</head>

<body>

	<form action="/sdt/researchResult" method="post" align="center">
		<div class="container shadow-lg p-3 mb-5 bg-white rounded">
		
			<div class="row">
				<div class="col">
					<h1 id="title"><strong>급식 만족도 설문조사</strong></h1>
					<br>
					${b_month}월 급식 만족도 설문조사를 진행합니다.
					<br> 설문조사 종료 뒤, ${month}월 급식비 결제 링크로 넘어갑니다.
					
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					<input type="hidden" name="b_month" value="${b_month}">
					<input type="hidden" name="school" value="${school}">
					<input type="hidden" name="parent_email" value="${parent_email}">
					<input type="hidden" name="month" value="${month}">
					<input type="hidden" name="payment" value="${payment}">
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col question">
					<strong>학교 급식에 대하여 어떻게 생각하십니까?</strong>
				</div>
			</div>
	
			<div class="row answer">
				<div class="col">					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="매우만족" checked="checked"><span>매우 만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="만족"><span>만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="보통"><span>보통</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="불만족"><span>불만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="매우불만족"><span>매우 불만족</span>
					</label>
				</div>
			</div>
	
			<hr>
			<div class="row">
				<div class="col question">
					<strong>음식의 간은 적당합니까?</strong>
				</div>
			</div>
			
			<div class="row answer">
				<div class="col">
					<label class="box-radio-input">
						<input type="radio" name="taste" value="적당하다" checked="checked"><span>적당하다</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="taste" value="짜다"><span>짜다</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="taste" value="싱겁다"><span>싱겁다</span>
					</label>
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col question">
					<strong>급식되는 양은 만족스럽습니까?</strong>
				</div>
			</div>
			
			<div class="row answer">
				<div class="col">					
					<label class="box-radio-input">
						<input type="radio" name="amount" value="매우만족" checked="checked"><span>매우 만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="amount" value="만족"><span>만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="amount" value="보통"><span>보통</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="amount" value="불만족"><span>불만족</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="amount" value="매우불만족"><span>매우 불만족</span>
					</label>
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col question">
					<strong>${b_month}월 급식 중 가장 선호하는 급식은 무엇입니까?</strong>
				</div>
			</div>
	
			<div class="row answer">
				<div class="col">				
					<select class="custom-select" name="bestmenu" style="max-width:700px;">
					  <option selected>${b_month}월 메뉴입니다.</option>
						<c:forEach var="i" items="${bestOp}" varStatus="s">
							<option value="(${s.count})${i.menu1}/${i.menu2}/${i.menu3}/${i.menu4}/${i.menu5}/${i.menu6}">
								${i.menu1}/${i.menu2}/${i.menu3}/${i.menu4}/${i.menu5}/${i.menu6}</option>
						</c:forEach>
					</select>
					
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col question">
					<strong>학교 급식과 관련하여 의견이 있다면 적어주시기 바랍니다.</strong>
				</div>
			</div>
	
			<div class="row answer">
				<div class="col">					
					<lable class="box-radio-input">
						<textarea id="etc" rows="5" cols="95" wrap="hard" name="etc"></textarea>
						<div id="etc_cnt">(0 / 200)</div>
					</lable>
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					<!-- <input type="submit" value="설문완료"> -->
					<button class="btn btn-outline-info">설문완료</button>
				</div>
			</div>
		</div>
	</form>

</body>
</html>