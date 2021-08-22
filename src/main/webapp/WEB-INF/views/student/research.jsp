<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<style>

.box-radio-input input[type="radio"]{
  display:none;
}

.box-radio-input input[type="radio"] + span{
  display:inline-block;
  background:none;
  border:1px solid #dfdfdf;  
  padding:0px 10px;
  text-align:center;
  height:35px;
  line-height:33px;
  font-weight:500;
  cursor:pointer;
}

.box-radio-input input[type="radio"]:checked + span{
  border:1px solid #23a3a7;
  background:#23a3a7;
  color:#fff;
}

.container{
	border:1px solid black;
	border-radius:5px;
	margin-top:50px;
	padding:10px;
}

</style>

<script>
	
</script>
</head>

<body>

	<form action="/sdt/researchResult" method="post" align="center">
		<div class="container">
		
			<div class="row">
				<div class="col">
					<h1>급식 설문조사</h1>
					<hr>
					지난 달 급식 설문조사를 진행합니다.
					<br> 설문조사 종료 뒤, 다음달 급식비 결제 링크로
					넘어갑니다.
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					담당 영양사 <input type="text" name="parent_email">
				</div>
				<div class="col">
					해당 학교 <input type="text" name="school">
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					<strong>학교 급식에 대하여 어떻게 생각하십니까?</strong>
				</div>
			</div>
	
			<div class="row">
				<div class="col">					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="very_good" checked="checked"><span>매우 좋음</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="good"><span>좋음</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="normal"><span>보통</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="bad"><span>나쁨</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="feedback" value="very_bad"><span>매우 나쁨</span>
					</label>
				</div>
			</div>
	
			<hr>
			<div class="row">
				<div class="col">
					<strong>학교 급식에서 좋아하는 메뉴는 어떤 것입니까?</strong>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<label class="box-radio-input">
						<input type="radio" name="bestmenu" value="korean" checked="checked"><span>한식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="bestmenu" value="japanese"><span>일식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="bestmenu" value="chinese"><span>중식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="bestmenu" value="western"><span>양식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="bestmenu" value="etc"><span>기타</span>
					</label>
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					<strong>학교 급식에서 싫어하는 메뉴는 어떤 것입니까?</strong>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<label class="box-radio-input">
						<input type="radio" name="worstmenu" value="korean" checked="checked"><span>한식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="worstmenu" value="japanese"><span>일식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="worstmenu" value="chinese"><span>중식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="worstmenu" value="western"><span>양식</span>
					</label>
					
					<label class="box-radio-input">
						<input type="radio" name="worstmenu" value="etc"><span>기타</span>
					</label>
				</div>
			</div>
			
			<hr>
			<div class="row">
				<div class="col">
					<input type="submit" value="설문완료">
				</div>
			</div>
	
		</div>
	</form>

</body>
</html>