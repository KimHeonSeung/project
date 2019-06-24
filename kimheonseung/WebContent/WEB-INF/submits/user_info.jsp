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

<title>회원정보 확인</title>

</head>
<body class="text-center">

<!-- 중단에 표시 -->
<div id="m">
<h2>${ login_user.user_nick } 님의 회원 정보입니다.</h2>
<form id="user_regist_form" action="<%= request.getContextPath() %>/user_update.khs" method="post">
	<table border="1">
		<tr>
			<th>ID(*)</th>
			<td><input class="input-group-text" type="text" name="user_id" value="${ login_user.user_id }" readonly> 
			</td>
		</tr>
		<tr>
			<th>닉네임(*)</th>
			<td><input class="input-group-text" type="text" name="user_nick" value="${ login_user.user_nick }" readonly > 
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<c:if test="${ login_user.user_tel eq -1 }" var="no">
				<td><input class="input-group-text" type="number" name="user_tel" readonly>
				<span id="checkTelArea"></span>
				</td>
			</c:if>
			<c:if test="${ not no }">
				<td><input class="input-group-text" type="number" name="user_tel" value="${ login_user.user_tel }" readonly>
				<span id="checkTelArea"></span>
				</td>
			</c:if>
			
		</tr>
		<tr>
			<th>이메일</th>	
			
			<c:if test="${ empty login_user.user_mail }" var="no">
				<td><input class="input-group-text" type="text" name="user_mail" readonly>
				<span id="checkMailArea"></span>
				</td>		
			</c:if>
			<c:if test="${ not no }">
				<td><input class="input-group-text" type="text" name="user_mail" value="${ login_user.user_mail }" readonly >
				<span id="checkMailArea"></span>
				</td>		
			</c:if>
		</tr>		
		<tr>
			<th colspan="2"><input class="btn btn-primary" type="submit" name="submit" value="수정하기">
			<input class="btn btn-primary" type="reset"value="초기화"></th>
		</tr>
	</table>
	
	<input type="hidden" name="isCheckPW" value="">
	<input type="hidden" name="isCheckPWConfirm" value="">
	<input type="hidden" name="isCheckNick" value="">
	<input type="hidden" name="isCheckTelOrMail" value="">
</form>
</div>

<a href="<%= request.getContextPath() %>/main.khs">메인으로</a>




<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>