<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYket : 스케줄</title>
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<script src='packages/core/locales/ko.js'></script>
<script src='packages/core/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.0/moment.min.js"></script>
<style type="text/css">

body {
	margin: 0 auto;
	width: 1080px;
	min-width: 1080px;
}
</style>
<script>
   document.addEventListener('DOMContentLoaded', function() {
	  
	   var jsondata = document.f.jsonResult.value;
	   

      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
         plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
         locale : 'ko',
         selectable : true,
         header : {
            left : 'title', //년,월
            center : '',
            right : 'today,prev,next' //오늘, 전월, 다음월
         },
         dateClick : function(info) { //빈 날짜 선택
            var dateStr = prompt(info.dateStr);
            var date = new Date(info.dateStr);
            
         },
         eventClick: function(info) { //이벤트 클릭
        	 info.jsEvent.preventDefault();
        	 var op = "width=900, height=600, left=400, top=100";
        	 window.open(info.event.url,"",op);
         }, 
         select: function(info) { //클릭
        	 info.jsEvent.preventDefault();
        	 var op = "width=550, height=500, left=500, top=150";
 		    open("addForm.do?date="+info.startStr+"&id="+document.f.id.value,"",op)
 	    },
 	    
 	  	events: 
 	  		[{"title":"지구를 지켜라","start":"2020-06-16","url":"infoForm.do?no=2","color":"#A2BEE0"},{"title":"오시에 오시게","start":"2020-06-19","url":"infoForm.do?no=3","color":"#A5D07A"},{"title":"렁스","start":"2020-06-13","url":"infoForm.do?no=4","color":"#A2BEE0"},{"title":"미아 파밀리아","start":"2020-06-03","url":"infoForm.do?no=5","color":"#F2CE80"},{"title":"앤 Anne","start":"2020-06-24","url":"infoForm.do?no=6","color":"#F2CE80"},{"title":"어쩌면 해피엔딩","start":"2020-06-13","url":"infoForm.do?no=7","color":"#F2CE80"},{"title":"어쩌면 해피엔딩","start":"2020-06-10","url":"infoForm.do?no=9","color":"#F2CE80"},{"title":"최후진술","start":"2020-06-09","url":"infoForm.do?no=11","color":"#F2CE80"},{"title":"해적","start":"2020-06-22","url":"infoForm.do?no=13","color":"#F2CE80"},{"title":"루드윅","start":"2020-06-23","url":"infoForm.do?no=14","color":"#F2CE80"},{"title":"너를 위한 글자","start":"2020-07-03","url":"infoForm.do?no=15","color":"#F2CE80"},{"title":"브라더스 까라마조프","start":"2020-04-24","url":"infoForm.do?no=16","color":"#F2CE80"},{"title":"적벽","start":"2020-02-02","url":"infoForm.do?no=17","color":"#A5D07A"},{"title":"머더러","start":"2019-11-05","url":"infoForm.do?no=18","color":"#F2CE80"},{"title":"오시에 오시게","start":"2019-10-05","url":"infoForm.do?no=19","color":"#A5D07A"},{"title":"오시에 오시게","start":"2019-10-12","url":"infoForm.do?no=21","color":"#A5D07A"},{"title":"오시에 오시게","start":"2019-10-20","url":"infoForm.do?no=22","color":"#A5D07A"},{"title":"오시에 오시게","start":"2019-10-24","url":"infoForm.do?no=23","color":"#A5D07A"},{"title":"구","start":"2019-07-11","url":"infoForm.do?no=24","color":"#F2CE80"},{"title":"사의찬미","start":"2019-07-12","url":"infoForm.do?no=27","color":"#F2CE80"},{"title":"머더러","start":"2019-11-15","url":"infoForm.do?no=28","color":"#F2CE80"},{"title":"오시에","start":"2020-06-14","url":"infoForm.do?no=33","color":"#A5D07A"},{"title":"오시에 오시게","start":"2020-06-26","url":"infoForm.do?no=34","color":"#A5D07A"},{"title":"여신님이 보고계셔","start":"2019-09-17","url":"infoForm.do?no=35","color":"#F2CE80"},{"title":"오시에 오시게","start":"2020-06-07","url":"infoForm.do?no=36","color":"#A5D07A"}]			
        ,eventLimit: true //event가 많으면 more로 표시
      })
      calendar.render();
   });
</script>
</head>
<body>
<form name="f" style="text-align: center;">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="jsonResult" value="${json}">
   <div class="calmain" style="vertical-align: middle; display: inline-block;">
      <div id="calendar" style="width: 800px; hegiht: 1000px;"></div>
   </div>
</form>
</body>
</html>
