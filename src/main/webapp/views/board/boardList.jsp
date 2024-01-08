<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
table {
      margin: 0 auto; /* 가로 가운데 정렬 */
}
table, th, td{
    border: 1px solid black;
    border-collapse: collapse;
    padding: 5px 10px;
}

input[type="submit"]{
	height: 50px;
}

fieldset{
	margin-top: 15px;
}

#notice{
	display: none;
	position: absolute;
	widht: 200px;
	height: 50px;
	border: 1px solid black;
	bottom: 1%;
	right: 1%;
}

.msg{
	width: 100%;
	margin-top: 15px;
	text-align: center;
	font-size: 12px;
}	

</style>
</head>
<body>

	<button onclick="location.href='/board/boardWrite'">글 작성</button>
	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select>
	
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>		
		</tr>
		<tbody id="list">
		</tbody>	
	</table>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</div>
	<!-- board_search -->
	<div style="padding-right: 10px">
		<input type="text" name="keyword" id="keyword">
	</div>

	<div>
		<button name="search" id="search">검색</button>
	</div>
	
	
</body>
<script>

var showPage = 1;

listCall(showPage);




function listCall(page){
	$.ajax({
		type:'get',
		url:'list',
		data:{'pagePerNum':$('#pagePerNum').val(), 'page':page}, //'page'라는 이름으로 listCall()의 매개변수 list를 가져옴
		dataType:'json', // 받는 타입
		success:function(data){
			console.log(data);
			console.log("------listCall-----");
			drawList(data);	
		},
		error:function(e){
			console.log(e);
		}
	});
	
}

function drawList(list){
	var content = '';
	list.list.forEach(function(item, idx){
		content += '<tr>';
		content += '<td>'+item.board_no+'</td>';
		content += '<td>'+item.board_title+'</td>';
		content += '<td>'+item.board_depart+'</td>';
		content += '<td>'+item.board_date+'</td>';
		content += '<td>'+item.bHit+'</td>';			
		content += '</tr>';
	});
	$('#list').empty(); 
	$('#list').append(content);
	
	
	//페이징 처리 UI 그리기(플러그인 사용)
	$('#pagination').twbsPagination({
		startPage:list.currPage, // 보여줄 페이지
		totalPages:list.pages, // 총 페이지 수(총 갯수/페이지 당 보여줄 게시물 수) : 서버에서 계산해서 가져와야 함
		visiblePages:5, // [1][2][3][4][5]
		onPageClick:function(e, page){ // 번호 클릭 시 실행할 내용
			//console.log(e);
			if(showPage != page){ // 1페이지 보고있는데 1페이지를 또 클릭하진 않을 거니까 (클릭하지 않은 것이라고 생각하기)
				console.log(page);
				showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
				listCall(page);
			}
		}
		
	});
}

</script>
</html>