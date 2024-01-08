<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hoony Music</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
		
		</style>
	</head>
	
	<body>
		<section class="login-container">
			<div class="login-div">
				<form action="${path}/login" method="post" id="login-form">
					<div class="logo-container" onclick="fn_loginPage();">
						<img src="${path}/resources/images/common/SampleLogo.png" alt="Honny_Music">
					</div>
	
					<h4>Hoony Music에 오신 것을 환영합니다!</h4>
	
					<span>아이디</span>
					<div class="input-container">
						<input type="text" name="member_id" class="login-input" id="id" value="${cookie.userid.value}">
					</div>
	
					<span>비밀번호</span>
					<div class="input-container">
						<input type="password" name="pw" class="login-input" id="pw">
					</div>
				</form>
	
				<div class="btn-container">
					<div>
						<input type="checkbox" id="remember-id"><span>아이디 저장하기</span>
					</div>
					<button onclick="fn_login();">로그인</button>
				</div>
			</div>
		</section>
	</body>
	
	<script>
		$(document).ready(function(){
			//저장된 아이디
			var id=getCookie("rememberId");
			$("#id").val(id);
			if($("#id").val()!=""){
				$("#remember-id").attr("checked",true);
			}
			
			//아이디 저장 체크박스
			$("#remember-id").change(function(){
				if($("#remember-id").is(":checked")){
					setCookie("rememberId",$("#id").val(),7);
				}else{
					deleteCookie("rememberId");
				}
			});
			
			//아이디 저장이 선택된 상태로 아이디 입력시
			$("#id").keyup(function(){
				if($("#remember-id").is(":checked")){
					setCookie("rememberId",$("#id").val());
				}
			});

			// 쿠키저장
			function setCookie(cookieName, value, day){
				var date = new Date();
				date.setDate(date.getDate() + day);	// 오늘부터 7일
				
				var cookieValue = escape(value) + ((day==null) ? "" : "; expires=" + date.toUTCString());	// 날짜를 포함한 값 지정
				document.cookie = cookieName + "=" + cookieValue;	// 쿠키 생성
			}

			// 쿠키 값 불러오기
			function getCookie(cookieName){
				cookieName = cookieName + "=";

				var cookieData = document.cookie;	// 쿠키 값
				var start = cookieData.indexOf(cookieName);	// 아이디의 시작 인덱스
				var cookieValue = "";

				if(start != -1){ //	값이 존재하는 경우
					start += cookieName.length;

					var end = cookieData.indexOf(";", start);	// 아이디 끊어낼 기준

					if(end == -1) end = cookieData.length;	// -14이 나오면 데이터 길이를 기준으로 함
					cookieValue = cookieData.substring(start, end);
				}
				return unescape(cookieValue);	// 아이디 반환
			}

			// 쿠키 삭제
			function deleteCookie(cookieName){
				var expireData = new Date();
				expireData.setDate(expireData.getDate() - 1);	// 지정된 날짜에서 -1
				document.cookie = cookieName + "=" + "; expires=" + expireData.toUTCString();	// 해당 쿠키 기간 만료로 삭제
			}
		});
		
		// 값 확인 후 로그인 실행
		function fn_login(){
		console.log($("#id").val());
			if($("#id").val()!=""&&$("#member-pwd").val()!=""){
				$("#login-form").submit();
			}
		}
	
		//로고 클릭 시 로그인 페이지
		function fn_loginPage(){
			location.href="${path}/loginPage";
		}
	</script>
</html>