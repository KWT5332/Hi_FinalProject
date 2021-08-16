<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 <style>
	#table{width:100%; text-align:center;}
	td{height:200px;}
  </style>
</head>
<body>

	<div class="container" id="calendar">
		<h2 id="calNavi"></h2>
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
		let td = $("<td>");
		
		//첫주
		if(firstDay == 0){
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML = now;
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
				cell.innerHTML = now;
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}
		
		// 중간주
		for(let i=1;i<week-1;i++){
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML = now;
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}
		
		// 마지막주
		if(lastDay == 6){
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0; i<7; i++){ 
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML = now;
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
		}else{
			let row = document.getElementById("table").insertRow(-1); // tr만듬.
			for(let i=0;i<lastDay+1;i++){ // 첫주 첫날 앞 빈칸 만들어주기
				let now = dates.shift();
				let cell = row.insertCell();
				cell.innerHTML = now;
				cell.className = year + "-" + strMonth + "-" + strNum(now);
			}
			for(let j=lastDay; j<6; j++){ 
				row.insertCell().innerHTML = "";
			}
		}
	</script>
</body>
</html>