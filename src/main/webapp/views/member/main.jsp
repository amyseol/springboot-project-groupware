<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 풀캘린더 라이브러리 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<!-- 날짜 및 시간 처리 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>


<title>HoonyMusic</title>
</head>
<style>
.div_inner{
	padding-left: 15%;
	padding-top: 100px; 	
	box-sizing: border-box;
	height: 650px;
	}
.float{
	float:left;
	margin-left:2%;
}
.mainBox{
	height:100%;
}
.float:first-child{margin-left:0;}
.mainLeft{	
	box-sizing: border-box;
	width: 26%;
    height: 100%;
}	
.mainCenter{	
	box-sizing: border-box;
	width: 40%;
    height: 100%;
}	
.mainRight{	
	box-sizing: border-box;
	width: 30%;
    height: 100%;
    overflow:auto;
}	
.mainPageAttend{
	box-sizing: border-box;
	height: 183px;
	margin-bottom:16px;
}
.mainSchedule{
	box-sizing: border-box;
	height: 100%;
}
.mainBoard{
	box-sizing: border-box;
	height: 400px;
	background-color: yellow;
}
.mainMusci{
	box-sizing: border-box;
	height: 100%
}

  #calendar {
    width: 100%;
    height: 100%;
  }
  
  .fc-header-toolbar, .fc-header-toolbar * {
    font-size: 10px; /* 원하는 크기로 조절 */
}

</style>
<body>
<%@ include file="/views/nav.jsp" %>
<div class="div_inner">
	<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainPageAttend" id="mainAttendContainer"></div>
				<div class="mainSchedule" id="mainCalContainer">
					<div id='calendar-container'>
						<div id="calendar"></div>
					</div>
				</div>
			</div>
			
			<div class="mainCenter float">
				<div class="mainBoard">게시판</div>
			</div>
			<div class="mainRight float">
				<div class="mainMusci" id="mList"></div>
			</div>
	</div>
</div>
</body>
<script>
$(document).ready(function () {
    // 출퇴근 박스
    $('#mainAttendContainer').load('attend.html');
 });
 
 //달력
	var titleData;
	var startData;
	var endData;
	var contentData;
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : "ko",
			initialView : 'dayGridMonth'
			
		});

		calendar.render();
		fetchEvents();

		
		// db 에서 값을 SELECT해오는거 
		function fetchEvents() {
			var state = 0;
			$.ajax({
				type : 'get',
				url : 'schedule/list',
				data : {
					'sch_state' : state
				},
				dataType : 'json',
				success : function(data) {
					eventList = data.eventList;
					// eventList의 각 이벤트 객체에서 sch_no 값을 뽑아내기

					console.log(data.eventList);
					//풀캘린더 자체내에서 제공하는 일종의 함수? 이벤트추가할수있는거 
					calendar.removeAllEvents();
					calendar.addEventSource(eventList);
				},
				error : function(xhr, status, error) {
					console.error('에러 발생:', status, error);
				}
			});
		}

	});
	// 음원차트
	 $(document).ready(function() {
         $('#mList').load('mainMusicChart.html');
     });
</script>
</html>