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

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

	// Load the Visualization API and the corechart package.
	google.charts.load('current', {'packages':['corechart']});
      
      google.charts.setOnLoadCallback(chart_div);
      google.charts.setOnLoadCallback(feedback);
      google.charts.setOnLoadCallback(bestmenu);
      google.charts.setOnLoadCallback(worstmenu);
      

      function chart_div() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 1],
          ['Onions', 1],
          ['Olives', 2],
          ['Zucchini', 2],
          ['Pepperoni', 1]
        ]);

        var options = {title:'How Much Pizza Sarah Ate Last Night',
                       width:500,
                       height:400,
                       /* pieHole: 0.3, */
                       pieSliceText:'label',
                       /* legend:'none' */};

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }


      function feedback() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
        	['매우 좋음', ${feed01}],
      		['좋음', ${feed02}],
      		['보통', ${feed03}],
      		['나쁨', ${feed04}],
      		['매우 나쁨', ${feed05}]
        ]);

        var options = {title:'feedback',
                       width:500,
                       height:400,
                       pieHole: 0.3,
                       pieSliceText:'label'};

        var chart = new google.visualization.PieChart(document.getElementById('feedback'));
        chart.draw(data, options);
      }
      

      function bestmenu() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
        	['한식', ${best01}],
        	['일식', ${best02}],
    		['중식', ${best03}],
    		['양식', ${best04}],
    		['기타', ${best05}]
        ]);

        var options = {title:'bestmenu',
                       width:500,
                       height:400,
                       pieSliceText:'label'};

        var chart = new google.visualization.PieChart(document.getElementById('bestmenu'));
        chart.draw(data, options);
      }

      
      function worstmenu() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
        	['한식', ${worst01}],
      		['일식', ${worst02}],
      		['중식', ${worst03}],
      		['양식', ${worst04}],
      		['기타', ${worst05}]
        ]);

        var options = {title:'worstmenu',
                       width:500,
                       height:400,
                       pieSliceText:'label'};

        var chart = new google.visualization.PieChart(document.getElementById('worstmenu'));
        chart.draw(data, options);
      }
      
    </script>
  </head>

<body>
<jsp:include page="../layout/header.jsp"/>

			<table class="columns" align="center">
				<tr>
					<th>${login.email}님의 통계입니다.
				</tr>
		      <tr>
		        <td><div id="chart_div" style="border: 1px solid #ccc"></div></td>
		        <td><div id="feedback" style="border: 1px solid #ccc"></div></td>
		      </tr>
		      <tr>
		        <td><div id="bestmenu" style="border: 1px solid #ccc"></div></td>
		        <td><div id="worstmenu" style="border: 1px solid #ccc"></div></td>
		      </tr>
		    </table>
        
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>