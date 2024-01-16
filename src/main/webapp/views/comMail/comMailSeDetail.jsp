<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


</head>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .titleWrap{display: flex; position: relative;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .count{position: absolute; top: 60px; left: 180px;}
        #common_list_form .toolBarWrap{position: relative;}
        #common_list_form .list_form{position:relative; width: 90%; margin-left: 50px;}
        #common_list_form .list_form .list_content {padding-top: 60px;}
        #common_list_form .list_form .list_content ul{width: 100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box; text-align: center;}
        #common_list_form .list_form .list_content ul li{width: 20%;}
        #common_list_form .list_form .list_content ul li:nth-child(2n-1){padding-left: 50px;}
        #common_list_form .list_form .list_content ul li:nth-child(2n){width: 80%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
       	/* #common_list_form .list_form .list_content ul:hover{background-color: #eee;} */
        
        #common_list_form .search_box{position: absolute; margin: 0px 0 10px 50px; border: 1px solid #fff; display: inline-block; left: 1000px; top: -10px;}
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
        }
    </style>
<body>
	<%@ include file="/views/nav.jsp" %>
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
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="reply()">
                                <span class="ic_toolbar reply"></span>
                                <span class="txt">답장</span>
                            </a>
                        </li>
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="delSend()">
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
                        <li class="btn_submenu">
                            
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
               		<h2>${seMailDetail.note_subject}</h2>
                    <ul>
                        <li>&nbsp;보낸 사람 :&nbsp;</li>
                        <li>${seMailDetail.sender_name}</li>
                        <li>&nbsp;받는 사람 :&nbsp;</li>
                        <li>${seMailDetail.receiver_name}</li>
                        <li>&nbsp;보낸 날짜 :&nbsp;</li>
                        <li>${seMailDetail.note_date}</li>
                    </ul>
                    
                    <ul id="add_file">
                    	    
                    </ul>
                </li>
            </ul>
        </div>

		<!-- 모달 -->
		<div id="del_modal">
			<div style="margin:30px 0; font-size:24px;">삭제 하시겠습니까?</div>
			<button onclick="delNo()" class="modalBtnNo">아니요</button>
			<button onclick="delYes()" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------mailWrap end------------------------------------------------- -->
</body>
<script>
    //-----------------------------------------mail start-----------------------------------------
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
    });
    //------------------------------------------mail end--------------------------------------
</script>
</html>