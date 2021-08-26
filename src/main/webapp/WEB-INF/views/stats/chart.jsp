<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<style>

@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{font-family:'GowunDodum-Regular';} 

.info{
	margin:20px 0px 20px 0px;
	padding-top:10px;
	font-size:20px;
	border:1px solid #1A8763;
}
.chart {margin: 50px 0px 50px 0px;}

</style>

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {'packages':['corechart']});
      
	google.charts.setOnLoadCallback(allPay);
	google.charts.setOnLoadCallback(feedback);
	google.charts.setOnLoadCallback(taste);
	google.charts.setOnLoadCallback(amount);
	google.charts.setOnLoadCallback(bestmenu);
      
	function allPay() {
		var data = google.visualization.arrayToDataTable([
	        ['people', 'count', { role: 'style' } ],
	        ['전체인원', ${allStd}, 'color: #f5cebe'],
	        ['결제인원', ${allPay}, 'color: #e4efe7'],
		]);

		var options = {
			title:'전체인원 대비 결제인원',
			width:500, height:500,
			chartArea:{width:"80%", height:"80%"}, /* 여백 */
			pieSliceText:'label',
			legend:'none'
		};

		var chart = new google.visualization.ColumnChart(document.getElementById('allPay'));
		chart.draw(data, options);
	}

	
	function feedback() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([
			['매우 만족', ${feed01}],
			['만족', ${feed02}],
			['보통', ${feed03}],
      		['불만족', ${feed04}],
			['매우 불만족', ${feed05}]
		]);

		var options = {
			title:'[질문] 학교 급식에 대하여 어떻게 생각하십니까?',
			width:500, height:500,
			pieSliceText:'label',
			chartArea:{width:"80%",height:"80%"}, /* 여백 */
			legend: { position: 'bottom' },
			is3D:'true',
			slices: {
				0: {color: '#f7786b', opacity: 0.6}, 
				1: {color: '#f7cac9', offset: 0.1}, 
				2: {color: '#91a8d0', opacity: 0.6}, 
				3: {color: '#034f84', offset: 0.3}, 
				4: {color: '#f3e7db', opacity: 0.6}
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('feedback'));
		chart.draw(data, options);
		}
      

	function taste() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([
			['적당하다', ${taste01}],
			['짜다', ${taste02}],
			['싱겁다', ${taste03}]
		]);

		var options = {
			title:'[질문] 음식의 간은 적당합니까?',
			width:500, height:500,
			pieHole: 0.3,
			pieSliceText:'label',
			chartArea:{width:"80%",height:"80%"}, /* 여백 */
			legend: { position: 'bottom' },
			slices: {
				0: {color: '#ffe194', opacity: 0.6}, 
				1: {color: '#b8dfd8', offset: 0.1}, 
				2: {color: '#4c4c6d', offset: 0.1}
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('taste'));
		chart.draw(data, options);
	}

      
	function amount() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows([
			['매우 만족', ${amount01}],
			['만족', ${amount02}],
			['보통', ${amount03}],
			['불만족', ${amount04}],
			['매우 불만족', ${amount05}]
		]);

		var options = {
			title:'[질문] 급식되는 양은 만족스럽습니까?',
			width:500, height:500,
			pieSliceText:'label',
			chartArea:{width:"80%",height:"80%"}, /* 여백 */
			legend: { position: 'bottom' },
			is3D:'true',
			slices: {
				0: {color: '#0c4c8a', opacity: 0.6}, 
				1: {color: '#5587a2', opacity: 0.6}, 
				2: {color: '#f6d258', offset: 0.1}, 
				3: {color: '#d1af94', opacity: 0.6}, 
				4: {color: '#97d5e0', offset: 0.2}
			}
		};

		var chart = new google.visualization.PieChart(document.getElementById('amount'));
		chart.draw(data, options);
	}
      
	function bestmenu() {
           
		/* var jsonData = $.ajax({
			url:"/chart/chartData",
			dataType:"json"
		}).done(function(resp){
			[resp[0].rnum, resp[0].count, resp[0].bestmenu];
			console.log(resp);
		});
		
		var data = new google.visualization.DataTable(jsonData); */
		
		$.ajax({
			url:"/chart/chartData",
			dataType:"json"
		}).done(function(resp){
			var data = new google.visualization.DataTable();

			data.addColumn('string','Topping');
			data.addColumn('number','Slices');s
			
			for(var i=0; i<resp.length;i++){
				resp[i].rnum, resp[i].count, resp[i].bestmenu;
			}
			console.log(resp);
		});
          
        var options = {title:'[질문] 이번 달 선호 급식',
                       width:1000,
                       height:1000,
                       legend: { position: "none" },
                       series: [{'color': '#1A8763'}]
                       };
        
        var chart = new google.visualization.PieChart(document.getElementById('bestmenu'));
        chart.draw(data, options);
      
        }
      
	/*function bestmenu() {
          
		var data = google.visualization.arrayToDataTable([
			['no', 'counting', { role: 'style' }, { role: 'annotation' } ],
            ['01', ${best01}, 'opacity: 0.5', '${menu01}'], ['02', ${best02}, 'opacity: 0.8', '${menu02}'],
            ['03', ${best03}, 'opacity: 0.5', '${menu03}'], ['04', ${best04}, 'opacity: 0.8', '${menu04}'],
            ['05', ${best05}, 'opacity: 0.5', '${menu05}'], ['06', ${best06}, 'opacity: 0.8', '${menu06}'],
            ['07', ${best07}, 'opacity: 0.5', '${menu07}'], ['08', ${best08}, 'opacity: 0.8', '${menu08}'],
            ['09', ${best09}, 'opacity: 0.5', '${menu09}'], ['10', ${best09}, 'opacity: 0.8', '${menu10}'],
            ['11', ${best11}, 'opacity: 0.5', '${menu11}'], ['12', ${best10}, 'opacity: 0.8', '${menu12}'],
            ['13', ${best13}, 'opacity: 0.5', '${menu13}'], ['14', ${best12}, 'opacity: 0.8', '${menu14}'],
            ['15', ${best15}, 'opacity: 0.5', '${menu15}'], ['16', ${best14}, 'opacity: 0.8', '${menu16}'],
            ['17', ${best17}, 'opacity: 0.5', '${menu17}'], ['18', ${best16}, 'opacity: 0.8', '${menu18}'],
            ['19', ${best19}, 'opacity: 0.5', '${menu19}'], ['20', ${best18}, 'opacity: 0.8', '${menu20}'],
            ['21', ${best21}, 'opacity: 0.5', '${menu21}'], ['22', ${best20}, 'opacity: 0.8', '${menu22}'],
            ['23', ${best23}, 'opacity: 0.5', '${menu23}']
		]);
          
		var options = {
			title:'[질문] 이번 달 선호 급식',
			width:1000, height:1000,
			legend: { position: "none" },
			series: [{'color': '#1A8763'}]
		};
          
		var chart = new google.visualization.BarChart(document.getElementById('bestmenu'));
		chart.draw(data, options);
	} */
      
</script>
<script>
	
	$(function(){
		
	})
	
</script>
</head>

<body>
<jsp:include page="../layout/header.jsp"/>

	<div class="container">
		<div class="container info">
			<div class="row">
				<div class="col-12">
					통계
				</div>
			</div>
			
			<div class="row">
				<div class="col-6">
					<p class="font-weight-bold text-center">소속학교 : ${login.school}</p>
				</div>
				<div class="col-6">
					<p class="font-weight-bold text-center">${login.email} 님의 급식 통계 정보입니다.</p>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-6">
				<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#staticBackdrop01" style="width:100%;">
					급식비 결제 인원 목록
				</button>
			</div>
			<div class="col-6">
				<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#staticBackdrop02" style="width:100%;">
					기타 의견 모아보기
				</button>
			</div>
		</div>
		
		<hr>
		<div class="row chart">
			<div class="col-6">
				<div id="allPay"></div>
			</div>
			
			<div class="col-6">
				<div id="feedback"></div>
			</div>
		</div>
		
		<hr>
		<div class="row chart">
			<div class="col-6">
				<div id="taste"></div>
			</div>
			
			<div class="col-6">
				<div id="amount"></div>
			</div>
		</div>
		
		<hr>
		<div class="row chart">
			<div class="col-12">
				<div id="bestmenu">여기 차트가 떠야해요ㅠㅠ</div>
			</div>
		</div>
	</div>
	
	<!-- 결제인원 목록 모달-->
	<div class="modal fade pay" id="staticBackdrop01" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-xl text-center">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">결제인원 목록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">	        
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
						    <th scope="col">이름</th>
						    <th scope="col">이메일</th>
						    <th scope="col">학교</th>
						    <th scope="col">결제금액</th>
						    <th scope="col">승인번호</th>
						    <th scope="col">결제일자</th>
						    <th scope="col">급식예정 달</th>
				    	</tr>
					</thead>
				  	<tbody>
				  		<c:forEach var="p" items="${payList}" varStatus="a">
					    	<tr>
								<td>${a.count}
								<td>${p.st_name}
								<td>${p.st_email}
								<td>${p.st_school}
								<td>${p.payment} 원
								<td>${p.apply_num}
								<td>${p.pay_date}
								<td>${p.month}
							</tr>
						</c:forEach>
					</tbody>
				</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Understood</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 기타의견 모달 -->
	<div class="modal fade etc" id="staticBackdrop02" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable text-center">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">기타 의견 모아보기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <ul class="list-group list-group-flush">
	        	<strong>[질문] 학교 급식과 관련하여 의견이 있다면 적어주시기 바랍니다.</strong>
	        	<br><h6>아래는 학생들의 의견입니다.</h6>
	        	<hr>	        
	        	<c:forEach var="i" items="${etcList}" varStatus="s">
					<c:if test="${not empty i.etc}">
						<li class="list-group-item">${i.etc}</li>
					</c:if>
				</c:forEach>
			</ul>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Understood</button> -->
	      </div>
	    </div>
	  </div>
	</div>
        
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>