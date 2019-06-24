<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>게시판</title>
</head>
<body>

	<form action="<%= request.getContextPath() %>/write_board.khs" method="get">
<table border="1">
	<tr>
		<th>게시번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>좋아요</th>
		<td><input type="hidden" name="board_id" value="${ board_id }"></td>
	</tr>
	<c:forEach var="article" items="${ simpleBoard }">
		<tr>
			<td align="center">${ article.article_num }</td>
			<td align="center">
				<a href="<%= request.getContextPath() %>/detail_board.khs?article_num=${ article.article_num }">${ article.article_title }</a>
				</td>
			<td align="center">${ article.writer_nick }</td>
			<td align="center">${ article.write_date }</td>
			<td align="center">${ article.read_count }</td>
			<td align="center">${ article.like_count }</td>
		</tr>
	</c:forEach>
	<tr>
		<th colspan="6" align="right"><input type="submit" value="글쓰기"></th>
	</tr>
</table>
	</form>

<a href="<%= request.getContextPath() %>/main.khs">메인으로</a>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>