<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


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
        #common_list_form .content_page{position:relative;}
        #common_list_form .content_page .list_title ul{width: 100%; height: 32px;}
        #common_list_form .content_page .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .content_page .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .content_page .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .content_page .list_title ul li:nth-child(3){width: 5%;}
        #common_list_form .content_page .list_title ul li:nth-child(4){width: 50%;}
        #common_list_form .content_page .list_title ul li:nth-child(5){width: 5%;}
        #common_list_form .content_page .list_title ul li:last-child{width: 15%;}
        #common_list_form .content_page .list_content ul{width:100%; height: 30px;}
        #common_list_form .content_page .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .content_page .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .content_page .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .content_page .list_content ul li:nth-child(3){width: 5%;}
        #common_list_form .content_page .list_content ul li:nth-child(4){width: 50%;}
        #common_list_form .content_page .list_content ul li:nth-child(5){width: 5%;}
        #common_list_form .content_page .list_content ul li:last-child{width: 15%;}
        #common_list_form .content_page .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .content_page .list_content ul:hover{background-color: #eee;}

        #bottom_music{position:fixed; width:100%; height:80px; bottom:0; background-color: #eb568e;}

        #common_list_form .search_box{position: relative; margin: 0px 0 10px 50px; border: 1px solid #fff; display: inline-block; left: 700px;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}

        #del_modal{
			display: none; 
			width:300px; 
			height:150px; 
			background: rgb(237, 237, 237); 
			border:1px solid gray; 
			text-align:center;
			position:absolute; 
			left:50%; 
			bottom: 50%;
		}
		
		.modalBtnNo, .modalBtnYes{
			height: 35px;
			width: 80px;
			color: white;
			border: none;
			border-radius: 10px;
			background-color: gray;
		}
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
    <!-- -------------------------------------------mailWrap start------------------------------------------------- -->
    <section id="common_list_form">
        <div class="titleWrap">
            <h2 class="big_title"> 보낸 메일함 </h2>
            <span class="count">
                    전체 메일 
                <span class="num">
                    <strong id="totalMail"><!-- 전체 메일 숫자 --></strong>
                </span>
                    / 안읽은 메일
                <span class="num">
                    <strong id="unreadMail"><!-- 안읽은 메일 숫자 --></strong>
                </span>
            </span>
        </div>
        
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                        <!-- 툴바 -->
                        <li>
                            <input type="checkbox" id="mailListAllCheck" name="mailAllcheck" value="off">
                        </li>
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="reply()">
                                <span class="txt">답장</span>
                            </a>
                        </li>
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="delModal()">
                                <span class="txt_caution">삭제</span>
                            </a>
                        </li>
                        <li class="btn_submenu">
                            <select id="readOption">
                                <option value="all">전체</option>
                                <option value="read">읽음</option>
                                <option value="unread">안읽음</option>
                            </select>
                        </li>

                        <li>
                            <!-- 검색 바 -->
                            <ul class="search_box">
                                <li>
                                    <input type="text" id="search_info" onkeydown="handleKeyDown(event)" placeholder="사원명 또는 제목을 입력해주세요.">
                                </li>
                                <li class="btn_box">
                                    <div class="search_btn">
                                        <img src="./img/search.png" alt="검색 버튼" onclick="search()">
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li class="list_content">
                    
                </li>
            </ul>
        </div>

        <div id="paging" class="pagingBox">
            <!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
            <div class="container">
                <nav aria-label="Page navigation" style="text-align: center">
                    <ul class="pagination" id="pagenationReceive"></ul>
                </nav>
            </div>
        </div>

		<!-- 모달 -->
		<div id="del_modal">
			<div style="margin:30px 0; font-size:24px;">삭제 하시겠습니까?</div>
			<button onclick="delNoSend()" class="modalBtnNo">아니요</button>
			<button onclick="delYesSend()" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------mailWrap end------------------------------------------------- -->
    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

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
//-------------------------------------------mailWrap start-------------------------------------------------
    // 받은 메일함 리스트 호출
    var showPage = 1;

    // 검색
    function handleKeyDown(event){
        // 엔터키 keycode == 13
        if(event.keyCode === 13){
            search();
        }
    }

    function search(){
        console.log($("#search_info").val());

        $.ajax({
            type: "GET",
            url: "sendMail/search.ajax",
            data: {"search_info": $("#search_info").val(), "page": showPage},
            dataType: "JSON",
            success: function(data){
                drawList(data);
            },
            error: function(e){
                console.log(e);
            }
        });
    }

    $(document).ready(function(){
        $.ajax({
            type: "get",
            url: "sendMail/counts.ajax",
            dataType: "JSON",
            success: function(data){
                console.log(data);

                // 전체 메일 갯수 업데이트
                $("#totalMail").text(data.totalMail);
                // 안 읽은 메일 갯수 업데이트
                $("#unreadMail").text(data.unreadMail);
            },
            error: function(e){
                console.log(e);
            }
        });

        listCall(showPage);
    });

    function listCall(page){
        var loginId = "${sessionScope.loginMember.member_no}";

        $.ajax({
            type: "get",
            url: "sendMail/list.ajax",
            data:{"page": page, "loginId": loginId, 'readOption':$('#readOption').val()},
            dataType: "JSON",
            success: function(data){
                console.log("보낸 메일함 리스트 호출!!");
                drawList(data);
            },
            error: function(e){
                console.log(e);
            }
        });
    }

    function drawList(list){
        console.log("drawList 호출!!!");
        console.log("list : "+list);

        var content = "";

        list.list.forEach(function(item, index){
            content += '<ul>';
            content += '<li><input type="checkbox" name="receiveCheck" value="' + item.note_no + '"/></li>';
            content +='<li>' 
                if(item.receive_state==0){
                    content+='<img src="resources/img/unread.jpg" alt="unreadImage" width=20 height=20/>';
                }else {
                    content+='<img src="resources/img/read.jpg" alt="readImage" width=20 height=20/>';
                }
            content +='</li>';
            content += '<li><span class="name">' + item.name + '</span></li>';
            content += '<li><a href="sendMail/list/detail?note_no='+item.note_no+'">' + item.note_subject + '</a></li>';
            content += '<li><span class="date">' + item.note_date + '</span></li>';
            content += '<li><span class="num">' + item.file_size + 'KB</span></li>';
            content += '</ul>';
        });
        $('.list_content').empty();
        $('.list_content').append(content);

        $('#pagenationReceive').twbsPagination({
            startPage: list.currPage, 
            totalPages: list.pages, 
            visiblePages:5,

            onPageClick:function(e,page){ 
                if(showPage != page){ 
                    console.log(page);	
                    showPage=page; 
                    listCall(page);
                }
            }
        });
    }

    // 보낸 쪽지 체크 박스
    $("#mailListAllCheck").on("click", function(){
        var $chk = $('input[name="mailAllcheck"]'); 
        console.log($chk);
        console.log($(this).is(":checked")); 
        if($(this).is(":checked")){
            $chk.prop("checked",true);
        }else{
            $chk.prop("checked",false);
        }
    });

    // 보낸 쪽지 삭제 모달창
    function delModal(){
        document.getElementById('del_modal').style.display = 'block';
    }

    // 보낸 메일 '아니요 버튼 클릭
    function delNo(){
        document.getElementById('del_modal').style.display = 'none';
    }

    // 보낸 메일 '예' 버튼 클릭(리스트에서 숨김 처리)
    function delYes(){
        var chkArr = [];

        $('input[name="mailListAllCheck"]:checked').each(function(idx,item){
		//console.log(idx, $(item).val()); 
		var val = $(item).val();
            if(val != 'on'){
                chkArr.push(val);
            }
        });
        console.log(chkArr);

        $.ajax({
            type: "get",
            url: "sendMail/delMail.ajax",
            data: {'delList': chkArr},
            dataType: "JSON",
            success: function(data){
                console.log(data);

                listCall(showPage);
                document.getElementById('del_modal').style.display = 'none';
            },
            error: function(e){
                console.log(e);
            }
        });
    }
//-------------------------------------------mailWrap end-------------------------------------------------
</script>
</html>