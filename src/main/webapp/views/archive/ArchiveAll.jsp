<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<<<<<<< HEAD

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>



=======
>>>>>>> origin/master
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
<<<<<<< HEAD

=======
>>>>>>> origin/master
</head>
<body>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
<<<<<<< HEAD
    <section id="common_list_form">
        <h2 class="big_title">타이틀</h2>
        <h3 class="sub_title">리스트 폼</h3>

=======
>>>>>>> origin/master
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
<<<<<<< HEAD

=======
>>>>>>> origin/master
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
<<<<<<< HEAD

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

=======
>>>>>>> origin/master
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