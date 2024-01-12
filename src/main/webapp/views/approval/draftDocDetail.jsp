<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoony Music</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
	/* approval form */
        #approval_write{position:relative; margin-left: 15%;}
        #approval_write .top_area{position:fixed; top: 0; left: 15%; width:100%; padding: 30px 50px 22px 50px; border-bottom: 1px solid #ccc; background-color: #fff; z-index: 9997;}
        #approval_write .top_area h2{font-size: 24px; font-weight:500; padding-bottom:20px;}
        #approval_write .top_area h2 span{color: #999;}
        #approval_write .top_area .approval_btn{position:relative;}
        #approval_write .top_area .approval_btn li{position:relative; float: left; margin-left: 15px;}
        #approval_write .top_area .approval_btn li:nth-child(3){word-spacing: -1px;}
        #approval_write .top_area .approval_btn li:first-child{margin-left: 0; font-weight: 500;}
        #approval_write .top_area .approval_btn li svg{position:relative; top:3px;}
        #approval_write .top_area .approval_btn li a:hover{background-color: #efefef;}
        #approval_write .bottom_area{position:relative; padding-top: 130px; height: 1230px;}
        #approval_write .bottom_area .left_area{position:fixed; width: 300px; height: 100%; border-right: 1px solid #ccc; box-sizing: border-box; z-index: 9997; background-color: #fff;}
        #approval_write .bottom_area .left_area .btn_box{position:relative; height: 110px; margin-bottom: 20px;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn{position:relative; left: 50px; top: 30px; width: 200px; height: 50px; border-radius: 5px; border: 1px solid #bbb; text-align: center; line-height:45px; font-size: 16px; box-sizing: border-box; cursor: pointer;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn:hover{border: 1px solid #333; transition: 0.2s;}
        #approval_write .bottom_area .left_area .sortation_box{width: 100%; padding-top: 20px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn{padding-left: 50px; height: 31px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li{float: left; margin-left: 15px; text-align: center; cursor: pointer; padding: 0 7px 10px 7px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li.on{border-bottom: 2px solid #eb568e; font-weight: 700;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li:first-child{margin-left: 0;}
        #approval_write .bottom_area .left_area .sortation_box .list_box{border-top: 1px solid #ccc; height: 500px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li{height: 100px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li.on{background-color: rgba(248, 174, 226, 0.2); border-left: 3px solid #eb568e;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box{padding: 20px 50px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box>div{float: left;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box{width:30%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box{width: 44px; height:44px; border-radius: 22px; overflow: hidden;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box img{width:100%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box{width:70%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .member_name{font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .depart_name{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .sortation{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .right_area{position: relative; height:1080px; margin-left: 300px; margin: 30px 180px 0 400px; border: 5px solid #e8e8e8; box-sizing: border-box; overflow: auto;}
        #approval_write .bottom_area .right_area .doc_form{width: 800px; height:790px; margin: 30px;}
        #approval_write .bottom_area .right_area .file_form{margin-top: 50px;}
        #approval_write .bottom_area .right_area .file_form #input_file{display: none;}
        #approval_write .bottom_area .right_area .file_form #file_btn{background-color: #fff; width: 53px;  border: 1px solid #ddd; cursor: pointer; padding: 7px; margin-bottom: 10px;}
        #approval_write .bottom_area .right_area .file_form #file_btn:hover{transition: 0.2s; border: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top{position:relative; height: 300px;}
        #approval_write .bottom_area .right_area .form_top .form_name{font-size: 36px; margin-bottom: 30px; text-align: center;}
        #approval_write .bottom_area .right_area .form_top>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_left{width:40%;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul{width: 310px;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li{float: left; width: 30%; border-bottom: 1px solid #333; border-left: 1px solid #333; box-sizing: border-box; padding: 5px;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li input{border: none;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(2n){width: 70%; border-right: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(1),#approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(2){border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li.head{text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_top .top_right{position:relative; width: 60%;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner{position:absolute; right:0;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner>.draftsman{margin-right: 5px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap{position:relative;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .left_wrap{position:relative; width: 25px; height: 125px; background-color: #dedede; text-align: center; border: 1px solid #333; box-sizing: border-box;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .left_wrap>p{position:relative; top: 40px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap{width:80px; height: 125px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap>div{border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; text-align: center; font-size: 13px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_rank{height: 30px; border-top: 1px solid #333; line-height: 27px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name{position: relative; height: 65px; line-height: 62px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name .stamp{position: absolute; top: 3px; left: 50%; transform: translateX(-50%);}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_ok{line-height: 100px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_no{line-height: 60px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_no span{position: absolute; left: 50%; top: 20px; transform: translateX(-50%); color: #d63737; font-size: 12px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_date{height: 30px; line-height: 27px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .appr_no_date{color: #d63737;}
        #approval_write .bottom_area .right_area .form_bottom{position:relative;}
        #approval_write .bottom_area .right_area .form_bottom>div{position:relative; height: 100px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul{position: relative; width: 800px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li{position:relative; float: left; width:30%; border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; padding: 5px; height: 36px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.head{width: 18%; text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_top{border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_left{border-left: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(2){width: 24%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(4){width: 40%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(6){width: 82%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(7){width: 100%; height: auto; padding: 15px; min-height: 400px; margin-bottom: 30px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li>input, #approval_write .bottom_area .right_area .form_bottom>div>ul>li>select{width: 100%; height: 100%; box-sizing: border-box; border: 1px solid #ccc;;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li #testDatepicker{padding-left: 26px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li svg{position:absolute; left: 9px; top: 9px;}
        .file-list {position:relative; padding: 10px;}
        .file-list .filebox{position: relative; }
        .file-list .filebox:last-child{padding-bottom: 30px;}
        .file-list .filebox p {font-size: 13px; margin-top: 8px; display: inline-block;}
        .file-list .filebox .down_btn{border: 1px solid #ddd; box-sizing: border-box; font-size: 11px; padding: 2px; margin-left: 5px; color: #666;}
        .file-list .filebox .down_btn:hover{border: 1px solid #999;}
        .observer{display: none;}
        .input_style{width: 60px; padding-right: 10px; text-align: right;}

        /* approval select box css */
        #approval_light_box{position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5); z-index: 9999; display: none;}
        #approval_light_box .select_form_box{position: absolute; left:50%; top: 20%; background-color: #fff; width:700px; height:52%; transform: translateX(-50%); border-radius: 10px;}
        #approval_light_box .select_form_box .form_box_inner{position:relative; padding:40px;}
        #approval_light_box .select_form_box .form_box_inner .cancel_box{position:absolute; right:20px; top:20px; width:32px; height:32px; cursor: pointer;}
        #approval_light_box .select_form_box .form_box_inner h3{font-size:18px; font-weight:500; padding-bottom: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form{width: 100%; height: 320px;}
        #approval_light_box .select_form_box .form_box_inner .select_form>div{box-sizing: border-box; float: left; height: 300px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .left_box{padding: 10px; width: 250px; border: 1px solid #ccc; overflow: auto;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box{padding-left: 10px; width: 350px; margin-left: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box h6{font-size: 16px; font-weight: 500; padding: 0 0 10px 10px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div{border: 1px solid #ccc; height: 266px; box-sizing: border-box; padding: 15px 10px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul{float: left;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:first-child{width: 32%;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:last-child{width: 65%;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:first-child li{font-size: 14px; font-weight: 500; padding-bottom: 20px; color: #333;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:last-child li{font-size: 14px; padding-bottom: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li{font-size: 16px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span{cursor: pointer; border: 1px solid rgba(0,0,0,0)}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span.on{font-weight: 700; border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span:hover{border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approval_light_box .select_form_box .form_box_inner .select_form ul>li>ul{padding-top:3px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul>li>ul>li{padding-left:15px;}
        #approval_light_box .select_form_box .form_box_inner .btn_area{position:relative;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner{position: absolute; right:0;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button{width:50px; height:35px; box-sizing: border-box; cursor: pointer;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button:first-child{background-color: #eb568e; border: none; color: #fff;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button:last-child{border: 1px solid #ccc;}

        /* approve box css */
        #approve{display: none;}
        #return{display: none;}
        #withdrawl{display: none;}
        .approve_light_box{position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5); z-index: 9999;}
        .approve_light_box .approve_box{position: absolute; left:50%; top: 22%; background-color: #fff; width:500px; height:45%; transform: translateX(-50%); border-radius: 10px;}
        .approve_light_box .approve_box .approve_box_inner{position:relative; padding:40px; height: 330px;}
        .approve_light_box .approve_box .approve_box_inner h3{font-size: 18px; font-weight: 500; padding-bottom: 40px;}
        .approve_light_box .approve_box .approve_box_inner .cancel_box{position:absolute; right:20px; top:20px; width:32px; height:32px; cursor: pointer;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap{position:relative; width: 100%; height: 300px;}
        .approve_light_box .approve_box .approver_box_inner .inner_wrap h5{font-size: 16px; font-weight: 500; padding-bottom: 10px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap div{box-sizing: border-box;}

        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box{position: relative;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box ul{float: left;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_title{width: 20%; padding-right: 10%;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content{width: 70%;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box ul li:first-child{padding-bottom: 25px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li:last-child{height: 150px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li textarea{width: 100%; height: 100%; resize: none; border: 1px solid #ccc; padding: 5px; color: #222;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li .appr_list li{padding-bottom: 10px;}

        .approve_light_box .approve_box .approve_box_inner .btn_area{position:relative; bottom: -92%;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner{position: absolute; right:0; bottom: 0;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button{width:50px; height:35px; box-sizing: border-box; cursor: pointer;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button:first-child{background-color: #eb568e; border: none; color: #fff;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button:last-child{border: 1px solid #ccc;}
</style>
</head>
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
                    <a href="javascript:" onclick="approval_select_go()"><li class="dep2">새 결재 작성</li></a>
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
            <li class="profile"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></li>
        </ul>
    </div>
    <!-- -------------------------------------------util end------------------------------------------ -->


    <!-- -------------------------------------------form start------------------------------------------ -->
    <section id="approval_write">
        <div class="top_area">
            <h2 class="title">${info.approval_title} <span>in 업무기안</span></h2>
            <ul class="approval_btn">
                <c:choose>
					<c:when test="${(info.document_state eq 0 && info.approval_state eq 0 && docAuth eq 1) || (info.document_state eq 0 && info.approval_state eq 1 && docAuth eq 2) || (info.document_state eq 0 && info.approval_state eq 2 && docAuth eq 3)}">
						<li><a href="javascript:" onclick="approve_box_go()"><svg width="15" height="15" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m7.5 9l-3 .54L5 6.5L10.73.79a1 1 0 0 1 1.42 0l1.06 1.06a1 1 0 0 1 0 1.42Z"/><path d="M12 9.5v3a1 1 0 0 1-1 1H1.5a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h3"/></g></svg> 결재</a></li>
                		<li><a href="javascript:" onclick="return_box_go()"><svg width="18" height="18" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M754.752 480H160a32 32 0 1 0 0 64h594.752L521.344 777.344a32 32 0 0 0 45.312 45.312l288-288a32 32 0 0 0 0-45.312l-288-288a32 32 0 1 0-45.312 45.312z"/></svg> 반려</a></li>
                		<li><a href="javascript:" onclick="list_box_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:when>
					<c:when test="${info.approval_state eq 0 && docAuth eq 0}">
						<li><a href="javascript:" onclick="withdrawl_box_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.95 11a8 8 0 1 0-.5 4m.5 5v-5h-5"/></svg> 회수</a></li>
						<li><a href="javascript:" onclick="list_box_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:" onclick="list_box_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
        </div>
        <div class="bottom_area">
            <div class="left_area">
                <div class="sortation_box">
                    <ul class="list_btn">
                        <li class="on">결재선</li>
                        <li>참조자</li>
                    </ul>
                    <ul class="list_box approver">
                    <li>
                        <div class="info_box">
                             <div class="left_box">
                                  <div class="img_box">
                                      <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                  </div>
                              </div>
                              <div class="right_box">
                                  <ul class="approver_info">
                                      <li class="member_name"><a href="javascript:">${info.name}&nbsp;${info.member_position}</a></li>
                                      <li class="depart_name">${info.depart_name}</li>
                                      <li class="sortation">기안 상신</li>
                                 </ul>
                             </div>
                         </div>
                     </li>
                     <c:forEach items="${apprInfo}" var="appr" >
                     	<c:choose>
							<c:when test="${appr.approval_order eq 1 && appr.approval_state eq 0}">
								 <li class="on">
							</c:when>
							<c:when test="${appr.approval_order eq 2 && appr.approval_state eq 1}">
								 <li class="on">
							</c:when>
							<c:when test="${appr.approval_order eq 3 && appr.approval_state eq 2}">
								 <li class="on">
							</c:when>
							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
                        	<div class="info_box">
	                               <div class="left_box">
	                                   <div class="img_box">
	                                       <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
	                                   </div>
	                               </div>
	                               <div class="right_box">
	                                   <ul class="approver_info">
	                                       <li class="member_name"><a href="javascript:">${appr.name}&nbsp;${appr.member_position}</a></li>
	                                       <li class="depart_name">${appr.depart_name}지원팀</li>
	                                       <c:choose>
												<c:when test="${appr.processing_result eq 1}">
													 <li class="sortation">결재 승인</li>
												</c:when>
												<c:when test="${appr.processing_result eq 2}">
													 <li class="sortation">결재 반려</li>
												</c:when>
												<c:otherwise>
													<li class="sortation">결재 대기</li>
												</c:otherwise>
											</c:choose>
	                                   </ul>
	                               </div>
	                           </div>
                        	</li>
                       </c:forEach>
                    </ul>
                    <ul class="list_box observer">
                    	<c:forEach items="${refInfo}" var="ref">
                    		<li>
	                            <div class="info_box">
	                                <div class="left_box">
	                                    <div class="img_box">
	                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
	                                    </div>
	                                </div>
	                                <div class="right_box">
	                                    <ul class="approver_info">
	                                        <li class="member_name"><a href="javascript:">${ref.name}&nbsp;${ref.member_position}</a></li>
	                                        <li class="depart_name">${ref.depart_name}</li>
	                                        <li class="sortation">참조</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </li>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="right_area">
                <form id="form_info" class="doc_form" action="approvalWrite" method="post" enctype="multipart/form-data">
                <input type="hidden" name="form_no">
                <input type="hidden" name="observer" class="observer1">
                <input type="hidden" name="observer" class="observer2">
                    <div class="form_top">
                        <h4 class="form_name">업 무 기 안</h4>
                        <div class="top_left">
                            <ul>
                                <li class="head">기안자</li>
                                <li>${info.name}</li>
                                <li class="head">소속</li>
                                <li>${info.depart_name}</li>
                                <li class="head">기안일</li>
                                <li>${info.approval_start}</li>
                                <li class="head">문서번호</li>
                                <c:choose>
								    <c:when test="${info.document_state eq 1}">
								        <li>${info.approval_end}${info.approval_no}</li>
								    </c:when>
								    <c:otherwise>
								        <li><input type="text" value="" readonly/></li>
								    </c:otherwise>
								</c:choose>
                            </ul>
                        </div>
                        <div class="top_right">
                            <div class="right_inner">
                                <div class="draftsman sign_wrap">
                                    <div class="left_wrap">
                                        <p>신<br>청</p>
                                    </div>
                                    <div class="right_wrap">
                                        <div class="sign_rank">${info.member_position}</div>
                                        <div class="sign_name appr_ok">${info.name}
                                            <img class="stamp" src="/resources/img/common/stamp.png" alt="승인">
                                        </div>
                                        <div class="sign_date">${info.approval_start}</div>
                                    </div>
                                </div>
                                <div class="approver sign_wrap">
                                    <div class="left_wrap">
                                        <p>승<br>인</p>
                                    </div>
                                    <c:forEach items="${apprInfo}" var="appr">
                                    	<div class="right_wrap">
	                                        <div class="sign_rank">${appr.member_position}</div>
	                                        <c:choose>
											    <c:when test="${appr.processing_result eq 1}">
											    	<div class="sign_name appr_ok">${appr.name}
			                                            <img class="stamp" src="/resources/img/common/stamp.png" alt="승인">
			                                        </div>
											    </c:when>
											    <c:when test="${appr.processing_result eq 2}">
											    	<div class="sign_name appr_no">${appr.name}</div>
											    </c:when>
											    <c:otherwise>
											        <div class="sign_name">${appr.name}</div>
											    </c:otherwise>
											</c:choose>
	                                        <c:choose>
											    <c:when test="${appr.processing_date}">
											        <div class="sign_date">${appr.processing_date}</div>
											    </c:when>
											    <c:otherwise>
											        <div class="sign_date"></div>
											    </c:otherwise>
											</c:choose>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_bottom">
                        <div class="bottom_inner">
                            <ul>
                                <li class="head bor_top bor_left">시행일자</li>
                                <li class="bor_top">${info.approval_start}</li>
                                <li class="head bor_top">협조팀명</li>
                                <li class="bor_top">${info.depart_name}</li>
                                <li class="head bor_left">제목</li>
                                <li>${info.approval_title}</li>
                                <li class="bor_left">${info.approval_content}</li>
                            </ul>
                        </div>
                        <div class="file_form">
		                    <div class="file-list">
		                    	<c:forEach items="${fileInfo}" var="file">
		                    		<div class="filebox"><p class="name">${file.file_oriname}</p> <a href="download.do?newName=${file.file_newname}&oriName=${file.file_oriname}" class="down_btn">다운로드</a></div>
		                    	</c:forEach>
		                    </div>
		                </div>
                    </div>
                </form>
            </div>
        </div>
        
    </section>
    <!-- -------------------------------------------form end------------------------------------------ -->


    <!-- -------------------------------------------select_approval_form start------------------------------------------ -->
    <div id="approval_light_box">
        <div class="select_form_box">
            <div class="form_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>결재양식 선택</h3>
                <div class="select_form">
                    <div class="left_box">
                        <ul>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 일반</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 기안서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 품의서</span></li>
                                </ul>
                            </li>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 휴가</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 휴가신청서</span></li>
                                </ul>
                            </li>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 계약</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음원 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음원 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음반 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음반 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 저작권 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 저작권 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 고객사 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 고객사 계약 취소 신청서</span></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="right_box">
                        <h6>상세정보</h6>
                        <div>
                            <form>
                                <ul>
                                    <li>제목</li>
                                    <li>기안자</li>
                                    <li>기안부서</li>
                                    <li>기안일</li>
                                    <li>보존연한</li>
                                </ul>
                                <ul>
                                    <li class="selected_form_name">&nbsp;</li>
                                    <li>한지훈</li>
                                    <li>지원팀</li>
                                    <li class="cur_date">2023-12-25</li>
                                    <li>5년</li>
                                </ul>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="btn_area">
                    <div class="btn_inner">
                        <button id="form_go" type="submit">확인</button>
                        <button class="cancel_btn">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------select_approval_form end------------------------------------------ -->


    <!-- -------------------------------------------approve_box start------------------------------------------ -->
    <div id="approve" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>결재하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="approve_do" action="approve.do" method="post">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>결재의견</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li><textarea placeholder="의견을 작성해 주세요." name="reason"></textarea></li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="approve_go()">승인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------approve_box end------------------------------------------ -->

    <!-- -------------------------------------------return_box start------------------------------------------ -->
    <div id="return" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>반려하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="return_do" action="return.do" method="post">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>반려결재의견</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li><textarea placeholder="의견을 작성해 주세요." name="reason"></textarea></li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="return_go()">반려</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------return_box end------------------------------------------ -->


    <!-- -------------------------------------------withdrawl_box start------------------------------------------ -->
    <div id="withdrawl" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>회수하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="withdrawl_do" action="withdrawl.do" method="post">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>결재자</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li>
                                    <ul class="appr_list">
                                        <li>한지훈 사원<br>지원팀</li>
                                        <li>황희찬 과장<br>물류팀</li>
                                    </ul>
                                </li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="withdrawl_go()">확인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------withdrawl_box end------------------------------------------ -->



    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

// ------------------------------------ approval_detail start ------------------------------------

function approve_box_go(){
    $('#approve').fadeIn(500);
}

function approve_go(){
    if($('textarea[name="reason"]').val().length == 0){
        alert("의견을 작성해 주세요.");
    }else{
        $('#approve_do').submit();
    }
}

function return_box_go(){
    $('#return').fadeIn(500);
}

function return_go(){
    if($('textarea[name="reason"]').val().length == 0){
        alert("의견을 작성해 주세요.");
    }else{
        $('#return_do').submit();
    }
}

function withdrawl_box_go(){
    $('#withdrawl').fadeIn(500);
}

function withdrawl_go(){
    $('#withdrawl_do').submit();
}

function list_box_go(){
    
}

$('.cancel_box').on('click',function(){
    $('#approve').fadeOut(500);
    $('#return').fadeOut(500);
    $('#withdrawl').fadeOut(500);
});

$('.cancel_btn').on('click',function(){
    $('#approve').fadeOut(500);
    $('#return').fadeOut(500);
    $('#withdrawl').fadeOut(500);
    
});


// ------------------------------------ approval_detail end ------------------------------------




// nav approval select fadeIn
function approval_select_go(){
    $('#approval_light_box').fadeIn(500);
}


// ------------------------------------ approval_select_box start ------------------------------------
var dataIndexValue = 0;
var queryNo = window.location.search;
var params = new URLSearchParams(queryNo);
var rcvFormNo = params.get("form_no");
$('input[name="form_no"]').val(rcvFormNo);

$('.cancel_box').on('click',function(){
    $('#approval_light_box').fadeOut(500);
});

$('.cancel_btn').on('click',function(){
    $('#approval_light_box').fadeOut(500);
});

$('.select_form>.left_box>ul>li>span').on('click',function(){
    $(this).siblings('ul').slideToggle(300);
});

$('span').on('click', function() {
    $(this).addClass('on');
    $('span').not(this).removeClass('on');
    $('p').not(this).removeClass('on');
    dataIndexValue = $(this).data('index');
});

$('.select_form_box .left_box>ul>li>ul>li>span').each(function(index){
    $(this).attr('data-index',index+1);
});

$('.select_form_box .left_box>ul>li>ul>li>span').on('click',function(){
    var selectedFormName = $(this).text();
    $('.selected_form_name').text(selectedFormName);
});

$('#form_go').on('click',function(){
    if(dataIndexValue == 0){
        alert("양식을 선택해 주세요.");
    } else if(dataIndexValue == 1){
        window.location.href = '/approval/draftDoc?form_no='+encodeURIComponent(dataIndexValue);
    } else if(dataIndexValue == 2){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 3){
        window.location.href = 'form_two.html';
    } else if(dataIndexValue == 4){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 5){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 6){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 7){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 8){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 9){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 10){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 11){
        window.location.href = 'javascript:';
    }
});

// 현재 날짜를 가져오기 위한 함수
function getCurrentDate() {
var currentDate = new Date();

var year = currentDate.getFullYear();
var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더하고 두 자리로 맞춰줍니다.
var day = ('0' + currentDate.getDate()).slice(-2);

var formattedDate = year + '-' + month + '-' + day;
return formattedDate;
}

// 가져온 날짜를 특정 태그에 넣기
$('.cur_date').text(getCurrentDate());

// ------------------------------------ approval_select_box end ------------------------------------




// ----------------------------------- nav toggle start -------------------------------------------
document.addEventListener('DOMContentLoaded', function () {
var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');

dep1Items.forEach(function (item) {
  item.addEventListener('click', function () {
    var dataIndex = item.getAttribute('data-index');
    var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
    var isActive = targetUl.classList.contains('active');

    // 현재 상태에 따라 토글
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

    // 현재 상태에 따라 토글
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
// ----------------------------------- nav toggle end ---------------------------------------------

// ----------------------------------- sortation tabs start -------------------------------------------
function tabs(index){
            $('.list_btn>li[data-index='+index+']').addClass('on');
            $('.list_btn>li[data-index!='+index+']').removeClass('on');
            $('.list_box[data-index='+index+']').stop().fadeIn(1000);
            $('.list_box[data-index!='+index+']').css('display','none');
        }

        $('.list_box').each(function(index){
            $(this).attr('data-index',index);
        })

        $('.list_btn>li').each(function(index){
            $(this).attr('data-index',index);
            $(this).click(function(){
                tabs(index);
            })
        })
// ----------------------------------- sortation tabs end -------------------------------------------

</script>
</html>