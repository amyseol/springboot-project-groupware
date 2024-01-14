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
    
        <!-- 모달 창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">부서 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
              
                <div class="form-group">
                    <label for="depart_name">부서명:</label>
                    <span id="depart_name"></span>
                </div>

           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                    <span id="dpt_oner"></span>
                </div>

          
                <div class="form-group">
                    <label for="total_member">인원:</label>
                    <span id="total_member"></span>
                </div>

          
                <div class="form-group">
                    <label for="depart_date">생성일:</label>
                    <span id="depart_date"></span>
                </div>
                
                 <div class="form-group">
                    <label for="depart_teamN">하위팀</label>
                    <span id="depart_teamN"></span>
                </div>
            </div>
            
            <div class="modal-footer">                     
                <input type="hidden" id="depart_no" name="depart_no"/>
                <button type="submit" class="btn btn-danger" id="updateDpt">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
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
		content+='<ul onclick="openModal('+item.depart_no+')">';
		content+='<li>'+item.depart_no+'</li>';
		content+='<li>'+item.depart_name+'</li>';
		content+='<li>'+item.name+'</li>';
		content+='<li>'+item.total_member+'</li>';
		content+='<li>'+item.depart_date+'</li>';
		content+='</ul>';
	});
	$('#departmentList').empty();
	$('#departmentList').append(content);
	}
	
function approver_select(){
    $('#approver_light_box').fadeIn(500);
}

$('.cancel_box').on('click',function(){
    $('#approver_light_box').fadeOut(500);
});

function openModal(depart_no) {
	$('#myModal').modal('show');
	$.ajax({
		type:'get',
		url:'detailDepart',
		data:{'depart_no':depart_no}, 
		dataType:'JSON',
		success: function(data){	
			console.log(data);
			$('#depart_name').empty();
	        $('#dpt_oner').empty();
	        $('#total_member').empty();
	        $('#depart_date').empty();
			 data.detail.forEach(function(item) {
			        $('#depart_name').append(item.depart_name);
			        $('#dpt_oner').append(item.name);
			        $('#total_member').append(item.total_member);
			        $('#depart_date').append(item.depart_date);
			    });
			 var content='';
			 data.team.forEach(function(item) {
				 content+='<li>'+item.depart_name+'</li>';
			    });
			 $('#depart_teamN').empty();
			$('#depart_teamN').append(content);
			 
		},
		error:function(e){
			console.log(e)
		}
	}); 
}

// 수정 버튼을 눌렀을 때 실행되는 함수
document.getElementById('updateDpt').addEventListener('click', function() {
    // 각 데이터 요소에 contenteditable 속성 추가
    document.getElementById('depart_name').contentEditable = true;
    document.getElementById('dpt_oner').contentEditable = true;
    document.getElementById('total_member').contentEditable = true;
    document.getElementById('depart_date').contentEditable = true;
    document.getElementById('depart_teamN').contentEditable = true;
});
</script>
</html>