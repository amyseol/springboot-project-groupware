<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
<link rel="stylesheet" href="/resources/richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="/resources/richtexteditor/rte.js"></script>
<script type="text/javascript" src='/resources/richtexteditor/plugins/all_plugins.js'></script>

<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}



 
</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
	<section id="common_list_form">
    <h2 class="big_title">공지사항</h2>
    <h3 class="sub_title">전사 게시판</h3>

    <div class="list_form">
        <form action="writeD" method="post" enctype="multipart/form-data" onsubmit="return val()">
	    <ul>
	        <li>
	            <label for="board_title">제목</label>
	            <input type="text" id="board_title" name="board_title" />
	        </li>
	        <li>
	            <div id="rich_deditor"></div>
				
				<input type="hidden" id="board_content" name="board_content" value=""/>
	            <!-- <textarea id="board_content" name="board_content"></textarea> -->
	        </li>
	        <li>
	            <label for="photos">사진</label>_
	            <input type="file" id="photos" name="photos" multiple="multiple" />
	        </li>
	        <li>
	            <button type="button" onclick="location.href='/boardD'">취소</button>
	            <button type="submit">저장</button>
	        </li>
	    </ul>
		</form>

    </div>
    </section>
</body>
<script>
	
	var config = {}
	//config.toolbar = "basic"; // 이 부분이 주석 되면 모든 기능이 다 나타난다.
	config.editorResizeMode = "none"; // 에디터 크기 조절 안됨
	var editor = new RichTextEditor("#board_content", config);
	

	function val(){
	var board_title = $('#board_title').val();
	var board_content=$('#board_content').val();
	if (board_title === "" || board_content === "") {
	    alert("입력하지 않은 값이 있습니다.");
	    return false;
		}
		return true;
	}
	//alert("접근이 거부되었습니다! 권한이 없습니다.");
</script>
</html>