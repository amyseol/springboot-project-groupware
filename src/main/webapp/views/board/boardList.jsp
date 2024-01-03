<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
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
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>		
		</tr>
		
		<c:if test="${list.size()==0}">
			<tr>
				<td colspan="5">게시물이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="board">
			<tr>
				<td>${board.board_no }</td>
				<td><a href="/board/detail?board_no=${board.board_no }">${board.board_title }</a></td>
				<td>${board.board_depart}</td>
				<td>${board.board_date}</td>
				<td>${board.bHit}</td>
			</tr>			
		</c:forEach>
	</table>
</body>
<script>

</script>
</html>