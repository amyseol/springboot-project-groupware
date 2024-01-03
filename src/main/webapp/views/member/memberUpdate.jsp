<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>직원정보수정</title>
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
	<form action="updateDo" method="post" enctype="multipart/form-data">
	<div class="detailInner">
		<ul class="detailBox">
			<li class="memberImg">
			<div class="imgBox">
			<c:forEach items="${file}" var="photo">
    			<input type="file" name="uploadFile" accept="image/*" onchange="previewImage(this, 'previewImage${photo}')" />
   			    <img id="previewImage${photo}" src="/photo/${photo}" />	
			</c:forEach>			
			</div>
			</li>
			<c:forEach items="${dto}" var="detail">
			<li>ID</li>
			<li>${detail.member_id}</li>
			<li>PW</li>
			<li><input type="text" name="pw" value="${detail.pw}"/></li>
			<li>이름</li>
			<li><input type="text" name="name" value="${detail.name}"/></li>
			<li>성별</li>
			<li><input type="text" name="gender" value="${detail.gender}"/></li>
			<li>생년월일</li>
			<li><input type="text" name="birth" value="${detail.birth}"/></li>
			<li>연락처</li>
			<li><input type="text" name="phone" value="${detail.phone}"/></li>
			<li>Email</li>
			<li><input type="text" name="email" value="${detail.email}"/></li>
			<li>주소</li>
			<li><input type="text" name="address" value="${detail.address}"/></li>
			<li>상세주소</li>
			<li><input type="text" name="address_detail" value="${detail.address_detail}"/></li>
			<li>입사일</li>
			<li><input type="text" name="hired" value="${detail.hired}"/></li>
			<li>직급</li>
			<li>
			<select name="member_position">
    			<option value="사원" th:selected="${detail.member_position == '사원'}">사원</option>
    			<option value="대리" th:selected="${detail.member_position == '대리'}">대리</option>
    			<option value="과장" th:selected="${detail.member_position == '과장'}">과장</option>
    			<option value="팀장" th:selected="${detail.member_position == '팀장'}">팀장</option>
    			<option value="부장" th:selected="${detail.member_position == '부장'}">부장</option>
    			<option value="이사" th:selected="${detail.member_position == '이사'}">이사</option>
    			<option value="대표" th:selected="${detail.member_position == '대표'}">대표</option>
			</select>			
            </li>
			<li>부서</li>
			<li>
			<select name="depart_name">
                 	<option>경영지원본부</option>
                 	<option>마케팅본부</option>
                 	<option>운영본부</option>
                 	<option>임원진</option>
             </select>
			</li>
			<li>팀</li>
			<li>
			<select name="team_name">
                 	<option>인사</option>
                 	<option>지원</option>
                 	<option>총무</option>
                 	<option>광고</option>
                 	<option>기획</option>
                 	<option>영상/디자인</option>
                 	<option>물류</option>
                 	<option>저작권관리</option>
                 	<option>계약운영관리</option>
                 </select>
			</li>
			<li>연/월차수</li>
			<li><input type="text" name="total_leave" value="${detail.total_leave}"/></li>
			<li>차량등록번호</li>
			<li><input type="text" value="${detail.member_car_no}"/></li>
			<li><input type="hidden" name="member_no" value="${detail.member_no}" /></li>
			<li>
			<button onclick="location.href='memberList'">취소</button>
			<button type="submit">수정</button>
			</li>
			</c:forEach>
		</ul>
	</div>
	</form>
</section>
    
 
</body>
<script>
//사진 업로드&미리보기
 function previewImage(input, previewId) {
        var preview = document.getElementById(previewId);     
        // FileReader 객체 생성
        var reader = new FileReader();
        // 파일이 로드되었을 때의 이벤트 핸들러
        reader.onload = function (e) {
            preview.src = e.target.result; // 미리보기 이미지를 새로운 사진으로 업데이트
        };
        // 파일 읽기 시작
        reader.readAsDataURL(input.files[0]);
    }
</script>
</html>