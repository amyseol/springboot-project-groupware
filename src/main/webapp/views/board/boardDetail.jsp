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
	<table>
		<tr>
			<th>제목</th>
			<td>${board.board_title}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.bHit}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.board_depart}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.board_content}</td>
		</tr>
		
		<c:if test="${photos.size() >0}">
		<tr>
			<th>사진</th>
			<td>
			<c:forEach items="${photos}" var="file">
				<img src="/photo/${file.file_newname}" width="500" alt="${file.file_oriname}"/>
			</c:forEach>			
			</td>
		</tr>
		</c:if>
		
		<tr>
			<th colspan="2">
			<input type="button" onclick="location.href='./'" value="리스트"/>
			<input type="button" onclick="location.href='./del?board_no=${board.board_no}'" value="삭제"/>
			<input type="button" onclick="location.href='./boardModify?board_no=${board.board_no}'" value="수정"/>
		</tr>
	</table>
</body>
<script>

</script>
</html>