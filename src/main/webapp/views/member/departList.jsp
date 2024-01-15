<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<link rel="stylesheet" href="resources/css/memberList.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
		<button onclick="createModal()">등록</button>
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
              <form id="updateDptForm" action="updateDpt" method="post">
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">부서명:</label>
                    <span id="depart_name" data-name="depart_name"></span>
                </div>

           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                    <button id="addOner"  style="display: none;" onclick=>
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
				</button>                   
                    <span id="dpt_oner" data-name="dpt_oner"></span>
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
                   <button id="openModalBtn" onclick=>
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
				</button>
                    <span id="depart_teamN"></span>
                <input type="hidden" id="depart_no" name="depart_no"/>
                </div>
            </div>          
            </form>
            <div class="modal-footer">                               	
                <button type="button" class="btn btn-danger" id="updateDpt">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 부서생성 모달 -->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">부서 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>   
            <form action="createDpt" method="post">      
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">부서명:</label>
                    <input type="text" name="depart_name" />                  
                </div>
           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                    <input type="text" name="dpt_oner" />
                </div>              
            </div>          
            <div class="modal-footer">                               	
                <button type="submit" class="btn btn-danger" id="createDpt">등록</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
			</form>   
        </div>
    </div>
</div>
</body>

<!-- 팀 디테일 모달 -->
<div class="modal fade" id="teamModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">팀 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">팀 명:</label>
                    <span id="team_name" data-name="team_name"></span>
                </div>
           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                    <span id="team_oner" data-name="team_oner"></span>
                </div>

          
                <div class="form-group">
                    <label for="total_member">인원:</label>
                    <span id="team_member"></span>
                </div>

          
                <div class="form-group">
                    <label for="depart_date">생성일:</label>
                    <span id="team_depart_date"></span>
                </div> 
            </div>          
			<input type="hidden" id="team_no" name="team_no"/>
            <div class="modal-footer">                               	
                <button type="button" class="btn btn-danger" id="updateTeam">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
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

function createModal(){
	$('#createModal').modal('show');
}

function openTeam(depart_name){
	$('#teamModal').modal('show');
	$.ajax({
		type:'get',
		url:'detailTeam',
		data:{'depart_name':depart_name}, 
		dataType:'JSON',
		success: function(data){	
			console.log(data);
			$('#team_name').empty();
	        $('#team_oner').empty();
	        $('#team_member').empty();
	        $('#team_depart_date').empty();
	        $('#team_no').empty();
			 data.detail.forEach(function(item) {
			        $('#team_name').append(item.depart_name);
			        $('#team_oner').append(item.name);
			        $('#team_member').append(item.total_member);
			        $('#team_depart_date').append(item.depart_date);
			        $('#team_no').val(item.depart_no);
			    });
		},
		error:function(e){
			console.log(e)
		}
	}); 
}


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
	        $('#depart_no').empty();
			 data.detail.forEach(function(item) {
			        $('#depart_name').append(item.depart_name);
			        $('#dpt_oner').append(item.name);
			        $('#total_member').append(item.total_member);
			        $('#depart_date').append(item.depart_date);
			        $('#depart_no').val(item.depart_no);
			    });
			 var content='';
			 data.team.forEach(function(item) {
				 content+='<li onclick="openTeam(\''+item.depart_name+'\')">'+item.depart_name+'</li>';
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
	makeEditable('depart_name');
    makeEditable('dpt_oner');
    this.innerHTML = '저장';
    // 수정 버튼의 클릭 이벤트를 저장 함수로 변경
    this.removeEventListener('click', arguments.callee);
    this.addEventListener('click', function() {
        // 저장 버튼이 클릭되었을 때 수행되는 함수
        // 폼을 submit
        document.getElementById('updateDptForm').submit();
    });
});

function makeEditable(id) {
    var element = document.getElementById(id);
    var value = element.textContent;

    // input 요소 생성
    var input = document.createElement('input');
    input.type = 'text';
    input.value = value;
    var nameAttribute = element.getAttribute('data-name');
    if (nameAttribute) {
        input.setAttribute('name', nameAttribute);
    }
    // 기존 요소를 input 요소로 교체
    element.innerHTML = '';
    element.appendChild(input);
}


//팀수정
document.getElementById('updateTeam').addEventListener('click', function() {
	makeEditable('team_name');
    makeEditable('team_oner');
    this.innerHTML = '저장';
    var btn = document.getElementById('addOner');
    btn.style.display = 'block';
   
    // 수정 버튼의 클릭 이벤트를 저장 함수로 변경
    this.removeEventListener('click', arguments.callee);
    this.addEventListener('click', function() {
        // 저장 버튼이 클릭되었을 때 수행되는 함수
        // 폼을 submit
        document.getElementById('updateDptForm').submit();
    });
});

function makeEditable(id) {
    var element = document.getElementById(id);
    var value = element.textContent;

    // input 요소 생성
    var input = document.createElement('input');
    input.type = 'text';
    input.value = value;
    var nameAttribute = element.getAttribute('data-name');
    if (nameAttribute) {
        input.setAttribute('name', nameAttribute);
    }
    // 기존 요소를 input 요소로 교체
    element.innerHTML = '';
    element.appendChild(input);
}
</script>
</html>