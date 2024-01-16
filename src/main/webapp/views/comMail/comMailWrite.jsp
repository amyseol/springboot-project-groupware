<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<link rel="stylesheet" href="resources/richtexteditor/rte_theme_default.css" />

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="resources/richtexteditor/rte.js"></script>
<script type="text/javascript" src='resources/richtexteditor/plugins/all_plugins.js'></script>


</head>
<style>
        #write_form {
        	position: relative;
            margin: 50px auto; /* 가운데 정렬을 위한 마진 설정 */
            width: 80%;
            left: 150px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
        }

        #rich_deditor {
            margin-top: 10px;
            border: 1px solid #ddd;
        }
        
        #send{
        	float: right;
        	padding: 5px;
        }
        
        .titleWrap{
        	position: relative;
        	top: 40px;
        }
        
        .contentWrap{
        	margin-top: 80px;
        }
        
        .del_all{
        	border: 1px solid black;
    		padding: 3px;
        }
        

    </style>
<body>
  	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------mailWrap start------------------------------------------------- -->
    <form action="writeMail.do" method="POST" id="write_form" enctype="multipart/form-data">
        <div class="titleWrap">
	        <h2 class="big_title"> 메일 쓰기 </h2>
        </div>
        
        <div class="contentWrap">
            <table>
                <tr>
                    <td colspan="2"><input type="button" id="send" value="보내기" onclick="save()"/></td>
                </tr>
                <tr>
                    <th>&nbsp;받는 사람 &nbsp;&nbsp;</th>
                    <td>
                        <div>
                            <ul>
                                <li>
                                	<c:if test="${not empty sender}">
                                   		<input type="text" name="receiver" id="inputReceiver" value="${sender}" readonly>
                                	</c:if>
                                	<c:if test="${empty sender}">
                                   		<input type="text" name="receiver" id="inputReceiver" placeholder="받는 사람을 입력하세요.">
                                	</c:if>
                                </li>
                                <li>
                                    <input type="button" id="organization" value="주소록" onclick="organization()"/>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;제목 &nbsp;&nbsp;</th>
                    <td><input type="text" name="note_subject" id="inputSubject" placeholder="제목을 입력하세요."></td>
                </tr>
                <tr>
                    <th>&nbsp;파일첨부 &nbsp;&nbsp;</th>
                    <td>
                        <div>
                            <a class="btn_file">
                                <span>
                                    <input type="file" id="select_file" name="files" multiple>
                                </span>
                            </a>
                            <a class="del_all">
                                <span onclick="all_del()">모두삭제</span>
                            </a>
                        </div>

                        <div>
                            <!-- 첨부 파일란 -->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="rich_deditor"></div>
                        <!-- 작성글은 div 에 담겨지는데, div 는 서버로 전송이 불가능하다. -->
                        <input type="hidden" name="note_content" value=""/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- -------------------------------------------mailWrap end------------------------------------------------- -->
</body>
<script>
//--------------------------------------mail start-----------------------------------------------------
    $(document).ready(function() {
		// 세션에서 저장된 정보 읽어오기
		var selectInfo = JSON.parse(sessionStorage.getItem("selectInfo"));
		
		console.log("선택된 메일 정보", selectInfo);
	
		// 가져온 이름을 inputReceiver의 value로 설정
	    if (selectInfo && selectInfo.sender) {
	        $("#inputReceiver").val(selectInfo.sender);
	    }
			
		// 세션에서 사용이 끝난 정보는 삭제
		sessionStorage.removeItem('selectInfo');
	});
	
    var config = {}
    //config.toolbar = "basic"; // 이 부분이 주석 되면 모든 기능이 다 나타난다.
    config.editorResizeMode = "none"; // 에디터 크기 조절 안됨
    var editor = new RichTextEditor("#rich_deditor", config);

    // 저장 버튼을 누르면 실행되는 함수 save
    function save(){
        var content = editor.getHTMLCode();
        $('input[name="content"]').val(content);
        console.log((content.length/1024/1024)+'MB');
        
        if(content.length > (2*1024*1024)){
            alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여 주세요!');
        }else{
            $('form').submit();
        }
    }
//--------------------------------------mail end-----------------------------------------------------
</script>
</html>