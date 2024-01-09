<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
.list_title ul {
	width: 100%;
	height: 45px;
}

.list_title ul li {
	float: left;
	border-top: 1px solid #999;
	border-bottom: 1px solid #222;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.list_title ul li:first-child {
	width: 20%;
	padding-left: 50px;
}

.list_title ul li:nth-child(2) {
	width: 20%;
}

.list_title ul li:nth-child(3) {
	width: 20%;
}

.list_title ul li:nth-child(4) {
	width: 20%;
}

.list_title ul li:last-child {
	width: 20%;
}

.list_content ul {
	width: 100%;
	height: 45px;
}

.list_content ul li {
	float: left;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.list_content ul li:first-child {
	width: 20%;
	padding-left: 50px;
}

.list_content ul li:nth-child(2) {
	width: 20%;
}

.list_content ul li:nth-child(3) {
	width: 20%;
}

.list_content ul li:nth-child(4) {
	width: 20%;
}

.list_content ul li:last-child {
	width: 20%;
}
.div_inner {
	padding-left: 15%;
	padding-top: 100px;
	box-sizing: border-box;
	height: 550px;
}

.float {
	float: left;
	margin-left: 2%;
}

.float:first-child {
	margin-left: 0;
}

.mainLeft {
	box-sizing: border-box;
	width: 96%;
	height: 100%;
}

.mainAttend {
	box-sizing: border-box;
	height: 150px;
	background-color: #FFC0CB;
	margin-bottom: 16px;
		margin-left:2%;
	margin-right: 2%; 
}

.mainSchedule {
	box-sizing: border-box;
	height: 234.5px;
	background-color: #FFC0CB;
		margin-left:2%;
	margin-right: 2%; 
}
</style>
<body>
<%@ include file="/views/nav.jsp" %>
	<div class="div_inner">
		<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainAttend">
					<ul>
						<li class="list_title">
							<ul>
								<li>발생 연차</li>
								<li>발생 월차</li>
								<li>총 연차</li>
								<li>사용 연차</li>
								<li>잔여 연차</li>
							</ul>
						</li>
						<li class="list_content" id="calLeaveList"></li>
					</ul>
				</div>
				<div class="mainSchedule">내일정
				</div>
			</div>
		</div>
	</div>
</body>
<script>
calLeave()
function calLeave(){
	
	$.ajax({
		type:'get',
		url:'calLeave',
		data:{}, 
		dataType:'JSON',
		success: function(data){
			console.log('타임테이블 데이터 반환');
			$('#calLeaveList').empty();
			
			$('#calLeaveList').append('<ul>'
					+'<li>'+'</li>'
					+'<li>'+'</li>'
					+'<li>'+'</li>'
					+'<li>'+'</li>'
					+'<li>'+'</li>'
					+'</ul>');
		
		}
		,error:function(e){
			console.log(e);
			console.log('왜안댐');
			}	
		});
}


</script>
</html>