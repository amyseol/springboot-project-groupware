<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>HoonyMusic</title>
</head>
<style>
.div_inner{
	padding-left: 15%;
	padding-top: 100px; 	
	box-sizing: border-box;
	height: 550px;
	}
.float{
	float:left;
	margin-left:2%;
}
.float:first-child{margin-left:0;}
.mainLeft{	
	box-sizing: border-box;
	width: 26%;
    height: 100%;
}	
.mainCenter{	
	box-sizing: border-box;
	width: 50%;
    height: 100%;
}	
.mainRight{	
	box-sizing: border-box;
	width: 20%;
    height: 100%;
}	
.mainAttend{
	box-sizing: border-box;
	height: 183px;
	background-color: red;
	margin-bottom:16px;
}
.mainSchedule{
	box-sizing: border-box;
	height: 201.5px;
	background-color: green;
}
.mainBoard{
	box-sizing: border-box;
	height: 400px;
	background-color: yellow;
}
.mainWeather{
	box-sizing: border-box;
	height: 400px;
	background-color: blue;
}

</style>
<body>
<%@ include file="/views/nav.jsp" %>
<div class="div_inner">
	<form action="memberRegist">
	<button type="submit">계정생성</button>
	</form>
	<form action="memberList">
	<button type="submit">직원관리</button>
	</form>
	<form action="departmentList">
	<button type="submit">부서관리</button>
	</form>
	<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainAttend">근태관리</div>
				<div class="mainSchedule">내일정</div>
			</div>
			<div class="mainCenter float">
				<div class="mainBoard">게시판</div>
			</div>
			<div class="mainRight float">
				<div class="mainWeather" id="wList"></div>
			</div>
	</div>
</div>
</body>
<script>

 
</script>
</html>