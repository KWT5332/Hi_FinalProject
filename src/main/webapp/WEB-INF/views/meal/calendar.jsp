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
    html {
      height: 100%;
    }

    body {
      height: 100%;
      margin: 0;
      position: relative;
    }

    #calendar {
      height: 99%;
      box-sizing: border-box;
      padding: 0.5%;
    }

    .calendar__day {
      display: inline-block;
      vertical-align: bottom;
      width: calc(97% / 7);
      height: calc(98% / 5);
      box-sizing: border-box;
      border-radius: 5px;
      padding: 20px;
    }

    .horizontalGutter {
      margin-right: 0.5%;
    }

    .verticalGutter {
      margin-top: 0.5%;
    }
  </style>
</head>
<body>

	<div id="calendar"></div>
	<script>
		const today = new Date();
		
		const year = today.getFullYear(); //2021
		const month = today.getMonth() + 1; // 배열이 0번부터 시작해서 +1 을 해준다! = 8
		
		const nowDay = new Date(year, today.getMonth(), 1); // 이번년도, 이번달, 1일 세팅
		const firstDate = 1;
		const firstDay = nowDay.getDay(); // 이번달 1일의 요일구하기
		const lastdate = new Date(year, month, 0).getDate(); // 이번달 마지막 날 구하기
	</script>
</body>
</html>