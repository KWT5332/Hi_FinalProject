<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
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

body{
	font-family:'GowunDodum-Regular';
} 

/* @font-face {
    font-family: 'SpoqaHanSansNeo-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{
	font-family: 'SpoqaHanSansNeo-Regular';
} */
</style>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {'packages':['corechart']});
      
      google.charts.setOnLoadCallback(chart_div);
      google.charts.setOnLoadCallback(feedback);
      google.charts.setOnLoadCallback(taste);
      google.charts.setOnLoadCallback(amount);
      google.charts.setOnLoadCallback(bestmenu);
      
      function chart_div() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['전체인원', ${allStd}],
          ['결제인원', ${allPay}]
        ]);

        var options = {title:'전체인원 대비 결제인원',
                       width:500,
                       height:400,
                       pieHole: 0.3,
                       pieSliceText:'label',
                       legend:'none' };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        
        /* var data = google.visualization.arrayToDataTable([
            ['month', '전체인원', '결제인원'],
            ['07월', 10, 4],
            ['08월', 17, 6]
          ]);

          var options = {
            chart: {title:'전체인원 대비 결제인원',
              subtitle: 'Sales, Expenses',
            },
            bars: 'horizontal' // Required for Material Bar Charts.
          };

          var chart = new google.charts.Bar(document.getElementById('chart_div'));

          chart.draw(data, google.charts.Bar.convertOptions(options)); */
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

        var options = {title:'학교 급식에 대하여 어떻게 생각하십니까?',
        				width:500,
                		height:400,
                       pieHole: 0.3,
                       pieSliceText:'label'};

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

        var options = {title:'음식의 간은 적당합니까?',
                       width:500,
                       height:400,
                       pieSliceText:'label'};

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

        var options = {title:'급식되는 양은 만족스럽습니까?',
                       width:500,
                       height:400,
                       pieSliceText:'label'};

        var chart = new google.visualization.PieChart(document.getElementById('amount'));
        chart.draw(data, options);
      }
      
      function bestmenu() {

          /* var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['${menu01}', ${best01}], ['${menu02}', ${best02}], ['${menu03}', ${best03}], ['${menu04}', ${best04}],
            ['${menu05}', ${best05}], ['${menu06}', ${best06}], ['${menu07}', ${best07}], ['${menu08}', ${best08}],
            ['${menu09}', ${best09}], ['${menu10}', ${best10}], ['${menu11}', ${best11}], ['${menu12}', ${best12}],
            ['${menu13}', ${best13}], ['${menu14}', ${best14}], ['${menu15}', ${best15}], ['${menu16}', ${best16}],
            ['${menu17}', ${best17}], ['${menu18}', ${best18}], ['${menu19}', ${best19}], ['${menu20}', ${best20}],
            ['${menu21}', ${best21}], ['${menu22}', ${best22}], ['${menu23}', ${best23}], ['${menu24}', ${best24}],          
          ]); */
          
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
          
          var options = {title:'이번 달 선호 급식',
                         width:1000,
                         height:1000,
                         legend: { position: "none" },
                         series: [{'color': '#1A8763'}]
                         };
          
          
          var chart = new google.visualization.BarChart(document.getElementById('bestmenu'));
          chart.draw(data, options);
        }
      
    </script>
<script>
    $(function(){
    	$("#btn").on("click", function(){
			$("#modal").modal("show");
    	})
    })
</script>
    
<style>
.info{
	margin:20px 0px 20px 0px;
	padding-top:10px;
	font-size:20px;
	background-color:pink;
}
    	
</style>
    
  </head>

<body>
<jsp:include page="../layout/header.jsp"/>

	<div class="container">
	
		<div class="container info">
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
					결제 인원 목록
				</button>
			</div>
			<div class="col-6">
				<button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#staticBackdrop02" style="width:100%;">
					기타 의견
				</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-6">
				<div id="chart_div"></div>
			</div>
			
			<div class="col-6">
				<div id="feedback"></div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-6">
				<div id="taste"></div>
			</div>
			
			<div class="col-6">
				<div id="amount"></div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-12">
				<div id="bestmenu"></div>
			</div>
		</div>
	</div>
	
	<!-- Scrollable modal -->
	<!-- Button trigger modal -->
	
	<!-- Modal -->
	<div class="modal fade pay" id="staticBackdrop01" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">결제인원 목록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        	<strong>결제 인원 목록입니다.</strong>	        
				<%-- <table class="table table-hover">
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
								<th scope="row">1</th>
								<td>${a.count}
								<td>${p.st_name}
								<td>${p.st_email}
								<td>${p.st_school}
								<td>${p.payment}
								<td>${p.apply_num}
								<td>${p.pay_date}
								<td>${p.month}
							</tr>
						</c:forEach>
					</tbody>
				</table> --%>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Understood</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade etc" id="staticBackdrop02" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">기타 의견</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <ul class="list-group list-group-flush">
	        	<strong>학교 급식과 관련하여 의견이 있다면 적어주시기 바랍니다.</strong>	        
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