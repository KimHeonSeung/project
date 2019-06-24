<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->


<title>메인 페이지</title>
</head>
<body>


<div class="form-sign">
<c:if test="${ empty sessionScope.login_user }" var="r">
<table class="text-center">
	<tr>
		<td>
			<form action="<%= request.getContextPath() %>/login.khs" method="get">
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
			</form>
		</td>
		<td>
			<form action="<%= request.getContextPath() %>/regist.khs" method="get">
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="가입하기">
			</form>
		</td>
	</tr>
	<tr>
		<a href="<%= request.getContextPath() %>/board.khs">게시판 목록으로 가기</a>
	</tr>

</table>
</c:if>

<c:if test="${ not r }">
<table class="text-center">
	<tr>
		<td>${ login_user.user_nick } 님 환영합니다.</td>
	</tr>
	<tr>
		<td>
		<form action="<%= request.getContextPath() %>/logout.khs" method="post">
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="로그아웃">
		</form>
		</td>
		<td>
		<form action="<%= request.getContextPath() %>/user_info.khs" method="get">
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="회원 정보 보기">
		</form>
		</td>
	</tr>
	<tr>
		<td>
			<a href="<%= request.getContextPath() %>/board.khs">게시판 목록으로 가기</a>
		</td>
	</tr>
</table>

</c:if>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>