<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
<style>
</style>
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<td>${sch.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${sch.content}</td>
		</tr>
		<tr>
			<th>시작일시</th>
			<td>${sch.start}</td>
		</tr>
		<tr>
			<th>종료일시</th>
			<td>${sch.end}</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" onclick="location.href='./'" value="리스트"/>
		</tr>
	</table>
</body>
<script>

</script>
</html>