<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>
    table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    .phoneBox{
    	width:50px;
    }
    #memberDetail{margin-left: 15%; height: 100px;}
    #memberDetail .detailInner{position: relative; width: 800px; height:300px; padding:100px 0 0 15%;}
    #memberDetail .detailInner .detailBox{position: relative;}
    #memberDetail .detailInner .detailBox li{float: left; background-color: #d34; width:70%; height: 30px; border: 1px solid #222; box-sizing: border-box;}
    #memberDetail .detailInner .detailBox li:nth-child(2n){width: 30%; background-color: yellow;}
    #memberDetail .detailInner .detailBox li:first-child{width: 100%; height: 200px;}
</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="memberDetail">
	<div class="detailInner">
		<ul class="detailBox">
			<li class="memberImg">
			<div class="imgBox">			
    			<img src="/photo/${file}" width="300" height="300"/>				
			</div>
			</li>
			<c:forEach items="${dto}" var="detail">
			<li>ID</li>
			<li>${detail.member_id}</li>
			<li>PW</li>
			<li>***********</li>
			<li>이름</li>
			<li>${detail.name}</li>
			<li>성별</li>
			<li>${detail.gender}</li>
			<li>생년월일</li>
			<li>${detail.birth}</li>
			<li>연락처</li>
			<li>${detail.phone}</li>
			<li>Email</li>
			<li>${detail.email}</li>
			<li>주소</li>
			<li>${detail.address}</li>
			<li>상세주소</li>
			<li>${detail.address_detail}</li>
			<li>입사일</li>
			<li>${detail.hired}</li>
			<li>직급</li>
			<li>${detail.member_position}</li>
			<li>부서</li>
			<li>${depart_name}</li>
			<li>팀</li>
			<li>${team_name}</li>
			<li>연/월차수</li>
			<li>${detail.total_leave}</li>
			<li>차량등록번호</li>
			<li>${detail.member_car_no}</li>
			<li></li>
			<li>
			<button onclick="memberUpdate(${detail.member_no})">수정</button>
			<button onclick="location.href='memberList'">확인</button>
			</li>
			</c:forEach>
		</ul>
	</div>
</section>
    
 
</body>
<script>
function memberUpdate(member_no){
	window.location.href = '/update?member_no=' + member_no;
}
</script>
</html>