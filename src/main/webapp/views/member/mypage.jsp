<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HoonyMusic</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7f33f996b442a5d86588bc9173489c3&libraries=services" type="text/javascript"></script>
	</head>
	<style>
		
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');
	
	        @font-face {
	            font-family: 'GmarketSansBold';
	            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
	            font-weight: 700;
	            font-style: normal;
	        }
	        @font-face {
	            font-family: 'GmarketSansMedium';
	            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	            font-weight: 500;
	            font-style: normal;
	        }
	        @font-face {
	            font-family: 'GmarketSansLight';
	            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
	            font-weight: 300;
	            font-style: normal;
	        }
	
	        *{margin:0; padding:0;}
	        li{list-style: none;}
	        a{text-decoration: none;}
	        img{border:none; display: block;}
	        body, header, section, footer, div, ul, li, p, a, span, input, textarea{font-family: 'Noto Sans KR', sans-serif; color: #222; font-size: 14px;}
	        h1, h2, h3, h4, h5, h6{font-family: 'GmarketSansMedium'; color:#222;}
	
	        #nav{position:fixed; width:15%; height:100%; box-shadow: 0 0 3px 0.5px rgb(228, 228, 228); background-color: #fff; overflow: auto;}
	        #nav .nav_inner{padding-top: 40px;}
	        #nav .logo{padding: 0 0 30px 40px;}
	        #nav .logo a{color:#222; font-size:20px;}
	        #nav .gnb ul{display: none;}
	        #nav .gnb li{padding:10px 0 10px 40px; font-size:14px; font-family: 'GmarketSansMedium', sans-serif; color:#888; letter-spacing: 0.5px; word-spacing: -2px;}
	        #nav .gnb li.dep2{padding-left:50px;}
	        #nav .gnb li.dep3{padding-left:60px;}
	        #nav .gnb a:hover li{color:#222; background-color: #eee;}
	        #nav .gnb li.active{color:#222; background-color: #eee;}
	        #nav .gnb a li{position:relative;}
	        #nav .gnb a li .arrow{position:absolute; right:30px; top:12px;}
	        #nav .gnb a li .arrow svg{width:100%; transition:0.3s;}
	
	        #util{position:fixed; right:0; height: 80px;}
	        #util .util_inner{position:relative; top:30px; right:50px; width:195px; height: 55px;}
	        #util .util_inner li{width: 55px; height: 55px; border-radius: 25px; background-color: #fff; float:left; margin-right:15px; cursor: pointer; overflow: hidden; box-shadow: 1px 1px 3px 1px #ddd;}
	        #util .util_inner li:last-child{margin-right:0;}
	        #util .util_inner li svg{position:relative; top:15px; left:15px;}
	        #util .util_inner li img{width:100%;}
	
	        #common_list_form{padding-left:15%;}
	        #common_list_form .big_title{padding: 50px 50px;}
	        #common_list_form .sub_title{padding: 20px 50px;}
	        #common_list_form .list_form{position:relative;}
	        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
	        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
	        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
	        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
	        #common_list_form .list_form .list_title ul li:nth-child(3){width: 5%;}
	        #common_list_form .list_form .list_title ul li:nth-child(4){width: 50%;}
	        #common_list_form .list_form .list_title ul li:nth-child(5){width: 5%;}
	        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
	        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
	        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
	        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
	        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
	        #common_list_form .list_form .list_content ul li:nth-child(3){width: 5%;}
	        #common_list_form .list_form .list_content ul li:nth-child(4){width: 50%;}
	        #common_list_form .list_form .list_content ul li:nth-child(5){width: 5%;}
	        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
	        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
	        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
	
	        #bottom_music{position:fixed; width:100%; height:80px; bottom:0; background-color: #eb568e;}
	    </style>
	<body>
	    <!-- -------------------------------------------nav start------------------------------------------ -->
	    <div id="nav">
	        <div class="nav_inner">
	            <h1 class="logo"><a href="javascript:">Hoony Music</a></h1>
	            <ul class="gnb">
	                <a href="javascript:"><li class="dep1">게시판</li></a>
	                <a href="javascript:"><li class="dep1" data-index="1">쪽지
	                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                    </svg></div>
	                </li></a>
	                <ul data-index="1">
	                    <a href="javascript:"><li class="dep2">쪽지 쓰기</li></a>
	                    <a href="javascript:"><li class="dep2">받은 쪽지함</li></a>
	                    <a href="javascript:"><li class="dep2">보낸 쪽지함</li></a>
	                    <a href="javascript:"><li class="dep2">휴지통</li></a>
	                </ul>
	                <a href="javascript:"><li class="dep1" data-index="2">전자결재
	                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                    </svg></div>
	                </li></a>
	                <ul data-index="2">
	                    <a href="javascript:"><li class="dep2">결재 대기 문서</li></a>
	                    <a href="javascript:"><li class="dep2">결재 예정 문서</li></a>
	                    <a href="javascript:"><li class="dep2">참조 대기 문서</li></a>
	                    <a href="javascript:"><li class="dep2" data-index="3">결재 보관함
	                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                            </svg></div>
	                    </li></a>
	                    <ul data-index="3">
	                        <a href="javascript:"><li class="dep3">삭제 문서</li></a>
	                        <a href="javascript:"><li class="dep3">수정 문서</li></a>
	                    </ul>
	                </ul>
	                <a href="javascript:"><li class="dep1" data-index="4">일정관리
	                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                        <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                    </svg></div>
	                </li></a>
	                <ul data-index="4">
	                    <a href="javascript:"><li class="dep2">전사 일정</li></a>
	                    <a href="javascript:"><li class="dep2" data-index="5">부서 일정
	                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                            </svg></div>
	                    </li></a>
	                    <ul data-index="5">
	                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
	                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
	                    </ul>
	                    <a href="javascript:"><li class="dep2" data-index="6">내 일정
	                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
	                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
	                            </svg></div>
	                    </li></a>
	                    <ul data-index="6">
	                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
	                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
	                    </ul>
	                </ul>
	                <a href="javascript:"><li class="dep1">공용자료실</li></a>
	                <a href="javascript:"><li class="dep1">시설예약</li></a>
	                <a href="javascript:"><li class="dep1">근태관리</li></a>
	                <a href="javascript:"><li class="dep1">차량관리</li></a>
	                <a href="javascript:"><li class="dep1">복지몰</li></a>
	            </ul>
	        </div>
	    </div>
	    <!-- -------------------------------------------nav end------------------------------------------ -->
	    <!-- -------------------------------------------util start------------------------------------------ -->
	    <div id="util">
	        <ul class="util_inner">
	            <li class="search">
	                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                    <path fill="#eb568e" d="M10 18a7.952 7.952 0 0 0 4.897-1.688l4.396 4.396l1.414-1.414l-4.396-4.396A7.952 7.952 0 0 0 18 10c0-4.411-3.589-8-8-8s-8 3.589-8 8s3.589 8 8 8m0-14c3.309 0 6 2.691 6 6s-2.691 6-6 6s-6-2.691-6-6s2.691-6 6-6"/>
	                </svg>
	            </li>
	            <li class="Notification">
	                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
	                    <path fill="#eb568e" d="M4 8a8 8 0 1 1 16 0v4.697l2 3V20h-5.611a4.502 4.502 0 0 1-8.777 0H2v-4.303l2-3zm5.708 12a2.5 2.5 0 0 0 4.584 0zM12 2a6 6 0 0 0-6 6v5.303l-2 3V18h16v-1.697l-2-3V8a6 6 0 0 0-6-6"/>
	                </svg>
	            </li>
	            <li class="profile"><img src="./img/kang.jpg" alt="231217_강태오"></li>
	        </ul>
	    </div>
	    <!-- -------------------------------------------util end------------------------------------------ -->
	    <!-- -------------------------------------------list_form start------------------------------------------ -->
	    <section id="common_list_form">
	        <h2 class="big_title">타이틀</h2>
	        <h3 class="sub_title">리스트 폼</h3>
	        <div class="list_form">
	           		<section class="max1920px">
				<section class="mypage-section">
					<div class="main-section section-shadow casrd profile-info">
						<div class="right-container">
							<h2>프로필</h2>
							<img src="${path}/upload/profile/${loginMember.profileImg}" id="mypage-profile" alt="mypage-profile" onclick="fn_updateProfile()">
							<form action="${path}/member/profile" method="post" enctype="multipart/form-data" id="profile-form">
								<input type="file" name="profileImg" id="profile-input" accept="image" required>
		
								<div>
									<input type="reset" value="취소" onclick="fn_resetProfile()">
									<button onclick="fn_profileSubmit()">수정</button>
								</div>
							</form>
							<p><span id="mypage-name">${loginMember.name}</span> 님</p>
						</div>
					</div>
	
					<div class="mypage-update-div">
						<div class="main-section section-shadow card">
							<div class="right-container">
								<form action="${path}/member/info" method="post" id="member-update-form">
									<span>아이디</span>
									<input type="text" value="${loginMember.member_id}" disabled>
	
									<div class="mypage-update">
										<span>비밀번호</span>
										<input type="password" name="newPw" id="new-pw" placeholder="새로운 비밀번호를 입력해주세요." required>
									</div>
	
									<span>이름</span>
									<input type="text" value="${loginMember.name}" disabled>
	
									<span>부서</span>
									<input type="text" value="${loginMember.dept.deptname}" disabled>
	
									<span>팀</span>
									<input type="text" value="${loginMember.team.team_name}" disabled>
	
									<span>직급</span>
									<input type="text" value="${loginMember.member_position}" disabled>
	
									<div class="mypage-update">
										<span>연락처</span>
										<input type="number" name="phone" id="phone" value="${loginMember.phone}" required>
										<p>* 전화번호 입력 시 하이픈(-) 제외하고 입력하세요.</p>
									</div>
	
									<div class="mypage-update">
										<span>주소 검색</span>
										<input type="text" name="mainAddress" id="mainAddress" value="${loginMember.address}" required>
										<input type="button" onclick="fn_searchAddr(event)" value="검색">
									</div>
	
									<div class="mypage-update">
										<span>상세 주소</span>
										<input type="text" name="detailAddress" id="detailAddress">
									</div>
	
									<span>입사일</span>
									<input type="text" id="hireDate" value="${loginMember.hired}" disabled>
	
									<div class="mypage-update">
										<span>이메일</span>
										<input type="email" name="email" id="email" value="${loginMember.email}" required>
									</div>
	
									<span>생년월일</span>
									<input type="text" value="${loginMember.birth}" disabled>
	
									<div>
										<input type="button" value="취소" onclick="cancleSignup()">
										<button onclick="fn_updateMember()">수정</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</section>
			</section>
	        </div>
	    </section>
	    <!-- -------------------------------------------list_form end------------------------------------------ -->
	    <!-- -------------------------------------------music start------------------------------------------ -->
	    <div id="bottom_music">
	        <div class="music_inner">
	
	        </div>
	    </div>
	    <!-- -------------------------------------------music end------------------------------------------ -->
	</body>
	<script>
		
		function cancleSignup(){
			if (confirm("수정을 취소하시겠습니까?")) {
				location.href="/main";
			} else {}
		}
		
		// 프로필 사진 변경
		function fn_updateProfile(){
			$("#profile-input").click();
			$("#profile-input").change(()=>{
				const fileName = $("#profile-input")[0].files[0].name;
				const fileSrc = URL.createObjectURL($("#profile-input")[0].files[0]);
				$("#mypage-profile").attr("src", fileSrc);
			});
		}
		
		// 프로필 취소
		function fn_resetProfile(){
			$("#profile-input").val('');
			$("#mypage-profile").attr("src", "${path}/upload/profile/${loginMember.profileImg}");
		}
		
		// 프로필 전송
		function fn_profileSubmit(){
			if($("#profile-input").val() != ''){
				$("#profile-form").submit();
			} else{
				alert("변경할 이미지를 업로드 하세요!");
				fn_updateProfile();
			}
		}
		
		//주소API id="mainAddress"
		function fn_searchAddr(event) {
			event.preventDefault();
			 //카카오 지도 발생
			new daum.Postcode({
				oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("mainAddress").value = data.address; // 주소 넣기              
				console.log('도로명주소 : ' + data.roadAddress);
				document.querySelector("input[name=detailAddress]").focus(); //상세입력 포커싱                
				}
			}).open();
		}
		
		// 개인 정보 수정
		function fn_updateMember(){
			const regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
			const newPw = $("#new-pw").val();
			if("${approv.approvalFl}" != ""){
				alert("미승인된 요청 정보가 있습니다.");
			} else if($("#new-pw").val()==null||$("#new-pw").val()==""){
				alert("비밀번호를 입력해주세요!");
				$("#new-pw").focus();
			} else if(!regPwd.test(newPw)){ 
				alert("비밀번호는 영문자, 숫자, 특수문자를 조합해 8글자 이상이여야합니다.");
				$("#new-pw").val('');
				$("#new-pw").focus();
				return;
			} else if($("#phone").val()==null||$("#phone").val()==""){
				alert("전화번호를 입력해주세요!");
				$("#phone").focus();
			} else if($("#mainAddress").val()==null||$("#mainAddress").val()==""){
				alert("주소를 입력해주세요!");
				$("#mainAddress").focus();
			} else if($("#email").val()==null||$("#email").val()==""){
				alert("이메일을 입력해주세요!");
				$("#email").focus();
			} else{
				$("#member-update-form").submit();
			}
		}
		
		// -------------------------------- toggle start ------------------------------------------
		document.addEventListener('DOMContentLoaded', function () {
		    var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
		    var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');
		
		    dep1Items.forEach(function (item) {
		      item.addEventListener('click', function () {
		        var dataIndex = item.getAttribute('data-index');
		        var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
		        var isActive = targetUl.classList.contains('active');
		
		        if (!isActive) {
		            $(targetUl).stop().slideDown(300);
		            $(targetUl).addClass('active');
		            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
		            $(this).addClass('active');
		            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
		            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
		                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
		                $(this).parents('a').siblings().find('li.active').removeClass('active');
		            }
		        } else {
		            $(targetUl).stop().slideUp(300);
		            $(targetUl).removeClass('active');
		            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
		            $(this).removeClass('active');
		        }
		      });
		    });
		
		    dep2Items.forEach(function (item) {
		      item.addEventListener('click', function (e) {
		        var dataIndex = item.getAttribute('data-index');
		        var targetUl = document.querySelector('.gnb ul ul[data-index="' + dataIndex + '"]');
		        var isActive = targetUl.classList.contains('active');
		
		        if (!isActive) {
		            $(targetUl).stop().slideDown(300);
		            $(targetUl).addClass('active');
		            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
		            $(this).addClass('active');
		            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
		            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
		                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
		                $(this).parents('a').siblings().find('li.active').removeClass('active');
		            }
		        } else {
		            $(targetUl).stop().slideUp(300);
		            $(targetUl).removeClass('active');
		            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
		            $(this).removeClass('active');
		        }
		      });
		    });
		  });
	//-------------------------------- toggle end ------------------------------------------
	</script>
</html>