<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
</head>
<body>

<c:if test="${ empty login_user }" var="guest">

<form action="<%= request.getContextPath() %>/write_board.khs" method="post">
<input type="hidden" name="board_id" value="${ board_id }">
<table border="1">
<caption>게시글 작성</caption>
<tr>
	<th colspan="2">작성자 : <input type="text" name="writer_nick" required> 글 비밀번호 : <input type="password" name="del_pw" required></th>
	<th colspan="2"><input type="hidden" name="writer_id" value="guest"></th>
</tr>
<tr>
	<th>글 제목</th>
	<th><input type="text" name="article_title" required></th>
</tr>
<tr>
	<th>내용</th>
	<th><textarea rows="80" cols="70" name="article_content" required></textarea></th>
</tr>
<tr>
	<th colspan="2"><input type="submit" value="작성완료"></th>
</tr>
</table>
</form>

</c:if>


<c:if test="${ !guest }">
<form action="<%= request.getContextPath() %>/write_board.khs" method="post">
<input type="hidden" name="board_id" value="${ board_id }">
<table border="1">
<caption>게시글 작성</caption>
<tr>
	<th colspan="2">작성자 : <input type="text" readonly name="writer_nick" value="${ login_user.user_nick }"></th>
	<th colspan="2"><input type="hidden" name="writer_id" value="${ login_user.user_id }"></th>
	
</tr>
<tr>
	<th>글 제목</th>
	<th><input type="text" name="article_title" required></th>
</tr>
<tr>
	<th>내용</th>
	<th><textarea rows="80" cols="70" name="article_content" required></textarea></th>
</tr>
<tr>
	<th colspan="2"><input type="submit" value="작성완료"></th>
</tr>
</table>
</form>


</c:if>


<a href="<%= request.getContextPath() %>/main.khs">메인으로</a>

</body>
</html>