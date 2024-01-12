<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> origin/master
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>



<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 38px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 5%; height:32px;}
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 40%;} 
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 45px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 0; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 40%;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 10%;} 
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 10%;} 
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}

        #common_list_form .search_box{position: relative; margin: 0 0 10px 50px; border: 1px solid #fff; display: inline-block;width: 90%;height: 6%;display: flex;position: relative;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box select{width: 70px; height: 28px; border: 1px solid #ccc; border-right: none;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        #common_list_form .search_box #fileBtn{margin-left:10px;}
        
        #common_list_form .fileBox{position: relative; margin: 0 0 10px 50px; border: 1px solid #fff; display: inline-block;width: 90%;height: 10%;display: flex;position: relative;}
        input[type="submit"]{margin: 10 0 10;}
		#common_list_form .fileBox #allFileBox{display:none;}
		
		#del_modal{background: rgba(0, 0, 0, 0.8);display: none; width:300px; height:150px; background: rgb(237, 237, 237); border:1px solid gray; text-align:center;position:absolute; left:58%; top:27%; }
		#delBtn{margin-right: 10px;padding: 2px 5px 2px 5px;}
</style>

</head>
<style>
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
<<<<<<< HEAD
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
                    <a href="schedule"><li class="dep2">전사 일정</li></a>
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

	<%@ include file="/views/nav.jsp" %>
    <section id="common_list_form">
        <h2 class="big_title">공용자료실</h2>
        <h3 class="sub_title">
        	<input type="button" id="allList" value="전사"/>
        	<input type="button" id="departList" value="부서"/>
        </h3>
        <!------- 검색 ------->
        <ul class="search_box">
            <li>
                <input type="text" id="search_info" placeholder="검색" onkeydown="handleKeyDown(event)"/>
            </li>
            <li class="btn_box">
                <div class="search_btn">
                    <img src="./img/search.png" alt="검색 버튼" onclick="search()">
                </div>
            </li>
        </ul>
        <!------- 검색 ------->
        <!------- 파일 등록 ------->
        <
        <ul class="fileBox">
        	<li><input type="button" id="delBtn" value="삭제" onclick="delBtnClick()"/></li>
            <li id="departFileBox">
				<form action="departFileUpload.do" method="post" enctype="multipart/form-data">
				    <input type="file" id="file" name="files" multiple/>
			        <input type="hidden" name="member_no" value="${sessionScope.loginMember.member_no}"/>
			        <input type="submit" value="부서 파일 등록">
			    </form>
            </li>
            <li id="allFileBox">
				<form action="allFileUpload.do" method="post" enctype="multipart/form-data">
				    <input type="file" id="file" name="files" multiple/>
			        <input type="hidden" name="member_no" value="${sessionScope.loginMember.member_no}"/>
			        <input type="submit" value="전사 파일 등록">
			    </form>
            </li>
        </ul>
        <!------- 파일 등록 ------->
		<!------- 리스트 ------->

        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>

                        <li>기안일</li>
                        <li>결재양식</li>
                        <li>긴급</li>
                        <li>제목</li>
                        <li>첨부</li>
                        <li>결재상태</li>
                    </ul>
                </li>
                <li class="list_content">
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li> </li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li> </li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                    <ul>
                        <li>2023-12-19</li>
                        <li>휴가신청서</li>
                        <li></li>
                        <li><a href="javascript:">휴가신청서</a></li>
                        <li></li>
                        <li>진행중</li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->

                    	<li><input type="checkbox" id="checkAll"/></li>
                        <li>파일명</li>
                        <li>다운로드</li>
                        <li>작성자</li>
                        <li>파일 크기</li>
                        <li>날짜</li>
                    </ul>
                </li>
                <li class="list_content" id="fileList">
                    
                </li>
            </ul>
        </div>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align:center;">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</div>
		<!-- 삭제 모달 -->
		<div id="del_modal">
			<div style="margin:30px 0; font-size:24px;">삭제 하시겠습니까?</div>
			<button onclick="delNo()" class="modalBtnNo">아니요</button>
			<button onclick="delYes()" class="modalBtnYes">예</button>	
		</div>
    </section>

</body>
<script>
//----------------------- all depart list start ----------------------------------
var showPage=1;
listCall(showPage);

var member_no = ${sessionScope.loginMember.member_no};
// 파일 리스트 
function listCall(page){
	$.ajax({
		type:'get',
		url:'archAllList',
		data:{'page':page, 'member_no':member_no}, 
		dataType:'JSON',
		success: function(data){
			console.log(data);
			drawList(data);	
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content='';
	list.list.forEach(function(item,idx){ 
		content+='<ul>';
		content+='<li><input type="checkbox" name="checkEach" value="'+item.arch_no+'"/></li>'
		content+='<li>'+item.file_oriname+'</li>';
		content+='<li><button onclick="location.href=\'download.do?newName='+item.file_newname+'&oriName='+item.file_oriname+'\'">다운로드</button></li>';
		
		content+='<li>'+item.name+'</li>'; 
		content+='<li>'+item.file_size+'KB</li>'; 
		
		var date = new Date(item.arch_date);
		var uploadDate = date.toLocaleDateString("ko-KR");
		content+='<li>'+uploadDate+'</li>';
		content+='</ul>';
	});
	$('#fileList').empty();
	$('#fileList').append(content);
	
	$('#pagination').twbsPagination({
		startPage: list.currPage,
		totalPages: list.pages, 
		visiblePages:5, 
		onPageClick:function(e,page){ 
			if(showPage != page){ 
				//console.log(page);	
				showPage=page; 
				listCall(page);
			}
		}
	});
}
//----------------------- all depart list end ---------------------------------------

//----------------------- delete start ---------------------------------------
// 모든 리스트 체크 
$('#checkAll').on('click',function(){
	var $chk = $('input[name="checkEach"]');
	//console.log($chk);
	console.log($(this).is(":checked")); // true/false
	if($(this).is(":checked")){
		$chk.prop("checked",true);
	}else{
		$chk.prop("checked",false);
	}
}); 

// 삭제 모달
function delBtnClick(){
	// 체크 박스 선택됐으면 모달창 열기
	$('input[name="checkEach"]:checked').each(function(idx,item){
		console.log('체크됨!');
		document.getElementById('del_modal').style.display = 'block';
	});
}

// 모달 아니요 버튼 
function delNo(){
	document.getElementById('del_modal').style.display = 'none';
}

function delYes(){
	// 작성자가 본인인 파일만 삭제할 수 있어야 한다
	// 체크박스 배열
	var chkArr = []; 
	// 이름 배열 - 로그인 한 name 과 작성자 name 이 일치하는지 확인하기 위함
	var names = [];
	$('input[name="checkEach"]:checked').each(function(idx,item){
		//console.log(idx, $(item).val()); 
		var name = $(item).closest('li').nextAll('li').eq(2).html();
		var val = $(item).val();
		if(val != 'on'){
			chkArr.push(val);
			names.push(name);
		}		
	});
	//console.log(chkArr);
	console.log(names);
	
	$.ajax({
		type:'get',
		url:'archiveDel',
		data:{'delList' : chkArr, 'names':names},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			if(data.del_cnt>0){
				alert('요청하신 '+data.del_cnt+'개의 게시물이 삭제 되었습니다.');
				listCall(showPage);
				document.getElementById('del_modal').style.display = 'none';
			}else{
				console.log(data.msg);
				alert(data.msg);
				listCall(showPage);
				document.getElementById('del_modal').style.display = 'none';
			}
		},
		error:function(e){
			console.log(e)
		}
	}); 
}

//----------------------- delete end ---------------------------------------

//----------------------- 전사 파일 등록 보여주기 start----------------------------------
var allFileBox = document.getElementById('allFileBox');
var member_depart = ${sessionScope.loginMember.depart_no};

$(document).ready(function() {
	if(member_depart==3||member_depart==4){
		console.log('경영지원 부서 입니다.');
		allFileBox.style.display='block';
	}
});
//----------------------- 전사 파일 등록 보여주기 end ----------------------------------



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