<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px; text-align:center;}
        #common_list_form .list_form{position:relative;display:flex; align-item:center; justify-content:center;}
        
        #common_list_form .list_form .notiOuterBox{justify-content: center;align-items: center;width:60%;height:100%;}
        #common_list_form .list_form .notiBox{display:flex; justify-content: space-between;width:100%; height: 100%;border: 1px solid grey;margin-bottom: 10px;}        
        #common_list_form .list_form .notiBox ul{padding: 10px;}
        #common_list_form .list_form .notiBox .notiContent{margin-right: 20px;}
        #common_list_form .list_form .notiBox .notiDate{text-align: right;}
        
        .blink{
		  -webkit-animation: blink 0.7s ease-in-out infinite alternate;
		  -moz-animation: blink 0.7s ease-in-out infinite alternate;
		  animation: blink 0.7s ease-in-out infinite alternate;
		}
		
		@-webkit-keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		}
		
		@-moz-keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		}
		
		@keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		  to {
                background-color: yellow;
            }
		}
</style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">NOTIFICATION</h2>
        <h3 class="sub_title">알림 🔔</h3>
		 <!------- 리스트 ------->
        <div class="list_form">
        	<div class="notiOuterBox" id="notiList">

			</div>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
//-------------------------------- list start ------------------------------------------
listCall();
var notiCount = 0;
function listCall(){	
	var member_no = ${sessionScope.loginMember.member_no};
	console.log(member_no);
	
	$.ajax({
		type:'get',
		url:'notiList',
		data:{'member_no':member_no}, 
		dataType:'JSON',
		success: function(data){
			console.log(data);
			drawList(data);	
			// 읽음 표시 - noti_state 에 따른 css 변경 
 			data.list.forEach(function(item,idx){
				console.log(item.noti_state);
				if(item.noti_state==0){
					$('#blinking'+item.noti_no).addClass('blink');
					console.log($('#blinking'+item.noti_no));
				}
			}); 
 			// 새로운 알림 개수 
 			notiCount = data.noti_count || 0;
			console.log(notiCount);
            $('#notiCnt').text(notiCount); 
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	console.log(list);
	var content='';
	list.list.forEach(function(item,idx){ 
		content+='<div class="notiBox" id="blinking'+item.noti_no+'" onclick="boxClick('+item.noti_unique_no+','+item.noti_no+','+item.noti_state+',\'' + item.noti_locate + '\')">';
		content+='<ul class="notiContent">';
		if(item.noti_locate=='p'){
			content+='<li>[회의실/공연장]</li>'; // artist 테이블
		}else{
			content+='<li>[일정]</li>'; 
		}
		if(item.noti_content==1){
			content+='<li>새로운 예약 신청이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==2) {
			content+='<li>예약 신청이 반려되었습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==3) {
			content+='<li>예약 신청이 승인되었습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==4) {
			content+='<li>예약 취소 신청이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==5) {
			content+='<li>새로운 전사 일정이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==6) {
			content+='<li>새로운 부서 일정이 있습니다. 확인해주세요.</li>'; 
		}
		content+='</ul>';
		content+='<ul class="notiDate">';
		var date = new Date(item.noti_date);
		var notiDate = date.toLocaleString("ko-KR");
		content+='<li>'+notiDate+'</li>';
		content+='<li>'+item.name+' '+item.member_position+'</li>';
		content+='</ul>';
		content+='</div>';
	});
	$('#notiList').empty();
	$('#notiList').append(content);
}
//-------------------------------- list end ------------------------------------------

//-------------------------------- click event start ------------------------------------------
function boxClick(unique, num, state, locate){
	// ajax 통신으로 가져온 noti_unique_no 의 noti_state 를 1로 변경하기
	$.ajax({
		type:'get',
		url:'notiStateUpdate',
		data:{'unique_no':unique, 'locate':locate}, 
		dataType:'JSON',
		success: function(data){
		},
		error:function(e){
			console.log(e);
		}
	});
	console.log($('#blinking'+num));
	// 읽음 표시 - noti_state 에 따른 css 변경 
	$('#blinking'+num).removeClass('blink');
	// 알림 아이콘에 표시 
	notiCount = notiCount - 1;
	listCall();
	//location.href='/reserv'; 페이지 만들면 이동시키기 
}
//-------------------------------- click event end ------------------------------------------
</script>
</html>