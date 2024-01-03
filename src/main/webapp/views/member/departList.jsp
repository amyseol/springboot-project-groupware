<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<link rel="stylesheet" href="resources/css/memberList.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
	#common_list_form{
		position: relative;
	}
	
	.depart_name{
		position: absolute;
		top: 120px;
		right: 50px;
	}
</style>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="common_list_form">
		<h2 class="big_title">부서관리</h2>
		<span id="incumbentStateLabel" onclick="selectDepartmentState('existence')">existence</span>
		<span id="quitterStateLabel" onclick="selectDepartmentState('dissolution')">dissolution</span>
		<div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                   	    <li>번호</li>
                    	<li>부서명</li>
                        <li>책임자</li>
                        <li>인원</li>
                        <li>생성일</li>
                    </ul>
                </li>
                <li class="list_content" id="departmentList">
                </li>
            </ul>
        </div>
    </section>
</body>
<script>

var selectedDepartmentState = 'existence';
departmentListCall()
console.log('상태:'+selectedDepartmentState);

// 페이지 로딩 시 초기값에 해당하는 라벨에 스타일 적용
document.getElementById('incumbentStateLabel').style.fontWeight = 'bold';
document.getElementById('quitterStateLabel').style.fontWeight = 'normal';

function selectDepartmentState(departmentState) {    
	selectedDepartmentState =departmentState;  
		console.log(selectedDepartmentState);
		// 선택된 라벨의 스타일 변경
        document.getElementById('incumbentStateLabel').style.fontWeight = (departmentState === 'existence') ? 'bold' : 'normal';
        document.getElementById('quitterStateLabel').style.fontWeight = (departmentState === 'dissolution') ? 'bold' : 'normal';
        departmentListCall();
    }
    

function departmentListCall(){	
	$.ajax({
		type:'get',
		url:'departmentListCall',
		data:{
			'departState':selectedDepartmentState
			}, 
		dataType:'JSON',
		success: function(data){
			console.log("초기 리스트"+data)
			drawDepartmentList(data);	
		},
		error:function(e){
			console.log(e)
		}
	});
}

function drawDepartmentList(departmentList){
	console.log(departmentList);

	var content='';
	departmentList.list.forEach(function(item, idx){ 
		content+='<ul onclick="approver_select('+item.depart_no+')">';
		content+='<li>'+item.depart_no+'</li>';
		content+='<li>'+item.depart_name+'</li>';
		content+='<li>'+item.depart_master+'</li>';
		content+='<li>'+item.total+'</li>';
		content+='<li>'+item.department_date+'</li>';
		content+='</ul>';
	});
	$('#memberList').empty();
	$('#memberList').append(content);
	}
	
function approver_select(){
    $('#approver_light_box').fadeIn(500);
}

$('.cancel_box').on('click',function(){
    $('#approver_light_box').fadeOut(500);
});


</script>
</html>