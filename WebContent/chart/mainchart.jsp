<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 관극 분석</title>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
body {
	margin: 0 auto;
	width: 1080px;
	min-width: 1080px;
}
.cmain_div{
	text-align: center;
	display: inline-block;
	height: auto;
}
.chart_div{
	border: 1px solid black;
	margin: 50px;
	width: 70%;
	height: auto;
	display: inline-block;
	
1}
.main_title{
	display: inline-block;
	width: 70%;
	text-align: center;
	font-family: GodoB;
	font-size: 35px;
	background-color: #6594BE;
	color: white;
	padding:20px;
	margin-top: 10px;
}
.title{
	text-align: center;
	font-family: GodoB;
	font-size: 25px;
	padding: 20px;
}
</style>
<script type="text/javascript">

$(function() {
	var id = $("#id").val();
	chart1(id);
	chart2(id);
	chart3(id);
})


function chart1(id) {
	$.ajax({
		url:"${path}/chart/chart1.do",
		type: 'POST',
		data: "id="+id,
		success : function(data) {
			chart1Print(data);
		},
		error : function(e) {
			alert("서버오류: " + e.status);
		}
	})
}
function chart2(id) {
	$.ajax({
		url:"${path}/chart/chart2.do",
		type: 'POST',
		data: "id="+id, 
		success : function(data) {
			chart2Print(data);
		},
		error : function(e) {
			alert("서버오류: " + e.status);
		}
	})
}
function chart3(id) {
	$.ajax({
		url:"${path}/chart/chart3.do",
		type: 'POST',
		data: "id="+id, 
		success : function(data) {
			chart3Print(data);
		},
		error : function(e) {
			alert("서버오류: " + e.status);
		}
	})
}

//월별 관극 횟수
function chart1Print(data){
	var rows = JSON.parse(data);
	var names = []
	var datas = []
	var colors = ["#F2CE80", "#A2BEE0", "#A5D07A", "#EABCDC", 
		"#B1EAE0", "#FFBBC5", "#E9E3CD", "#F6F69F",
		"#ACCDFF", "#E78A83", "#C3E0A6", "#CCCCCC"]
	$.each(rows, function(index, item) {
		names[index] = item.date;
		datas[index] = item.cnt;
		colors[index];
	})
	var ctx = document.getElementById('canvas1').getContext('2d');
	new Chart(ctx, {
		type : 'bar',
		data : {
			datasets : [ {
				data : datas,
				backgroundColor : colors
			} ],
			labels : names
		},
		options : {
			responsive : true,
			legend : {
				display : false
			},
			scales : {
				xAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : '날짜'
					},
					stacked : true
				} ],
				yAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : '관극 횟수'
					},
					stacked : true
				} ]
			}
		}
	})
}

//월별 사용 금액
function chart2Print(data){
	var rows = JSON.parse(data);
	var names = []
	var datas = []
	var colors = ["#F2CE80", "#A2BEE0", "#A5D07A", "#EABCDC", 
		"#B1EAE0", "#FFBBC5", "#E9E3CD", "#F6F69F",
		"#ACCDFF", "#E78A83", "#C3E0A6", "#CCCCCC"];
	$.each(rows, function(index, item) {
		names[index] = item.date;
		datas[index] = item.price;
		colors[index];
	})
	var ctx = document.getElementById('canvas2').getContext('2d');
	new Chart(ctx, {
		type : 'bar',
		data : {
			datasets : [ {
				data : datas,
				backgroundColor : colors
			} ],
			labels : names
		},
		options : {
			responsive : true,
			legend : {
				display : false
			},
			scales : {
				xAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : '날짜'
					},
					stacked : true
				} ],
				yAxes : [ {
					display : true,
					scaleLabel : {
						display : true,
						labelString : '금액'
					},
					stacked : true
				} ]
			}
		}
	})
}
//요일별 관극 횟수
function chart3Print(data) {
	var rows = JSON.parse(data);
	var names = ["일","월","화","수","목","금","토"]
	var datas = []
	var colors = ["#A5D07A", "#F2CE80", "#A2BEE0", "#EABCDC", "#B1EAE0", "#FFBBC5", "#F6F69F"];
	$.each(rows, function(index, item) {
		names[index];
		datas[index] = item.cnt;
		colors[index];
	})
	var config = {
		type : 'pie',
		data : {
			datasets : [ {
				data : datas,
				backgroundColor : colors
			} ],
			labels : names
		},
		options : {
			responsive : true,
			legend : {
				position : 'top'
			},
			title : {
				display : true,
				text : '요일별 관극 횟수',
				position : 'bottom'
			}
		}
	}
	var ctx = document.getElementById("canvas3").getContext("2d");
	new Chart(ctx, config);
}

</script>
</head>
<body>
<form name="f">
<input type="hidden" name="id" id="id" value="${param.id }">
</form>

<div class="cmain_div">
	<div class="main_title">나의 관극 분석</div>
	<div class="c1_div chart_div" >
	<div class="title">최근 12개월 간 월별 관극 횟수</div>
		<div id="c1_container" >
			<canvas id="canvas1"></canvas>
		</div>
	</div>
	<div class="c2_div chart_div" >
	<div class="title">최근 12개월 간 월별 관극 지출</div>
		<div id="c2_container" >
			<canvas id="canvas2"></canvas>
		</div>
	</div>
	<div class="c3_div chart_div" >
	<div class="title">요일별 관극 횟수</div>
		<div id="c3_container" >
			<canvas id="canvas3" ></canvas>
		</div>
	</div>
</div>
</body>
</html>