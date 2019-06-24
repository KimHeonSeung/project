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

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	var isCheckNick = false;
	var isCheckPW = false;
	var isCheckPWConfirm = false;
	var isCheckTelOrMail = false;
	// 페이지 로딩이 완료됐을 때 기능
	$(function () {
		// 가입 폼에 있는 아이디를 가져온다
		if($("#user_regist_form [name='user_mail']").val().length > 0 || $("#user_regist_form [name='user_tel']").val().length > 0) {
			isCheckTelOrMail = true;
			$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
		}
		
		$("#nickCheckBtn").on("click", function () {
			var user_nick = $("#user_regist_form [name='user_nick']").val();
			if(user_nick.length > 0 && user_nick.length <= 8){
				$.ajax({
					url:'<%=request.getContextPath()%>/check_nick.khs',
					type:"post",
					contentType:"application/x-www-form-urlencoded; charset=utf-8",
					data:"user_nick=" + user_nick,
					dataType:"text",
					success:function (result){ // result 는 불린 타입
						var msg='';
						// 성공 시 확인창과 보여줄 메세지를 설정
						if( eval(result) ){ // true 라면, 즉 이미 존재하는 닉
							alert('이미 존재하는 닉네임 입니다.');
							msg='이미 존재하는 닉네임 입니다.';
							isCheckNick = false;
							$("#user_regist_form [name='isCheckNick']").val(isCheckNick);
						} else { // 가입할 수 있는 닉
							alert('사용 가능한 닉네임 입니다.');
							msg='사용 가능한 닉네임 입니다.';
							isCheckNick = true;
							$("#user_regist_form [name='isCheckNick']").val(isCheckNick);
						}
						// 설정된 메세지를 화면에 출력
						$("#checkNickArea").text(msg);
					},
					error:function (result){
						alert('닉네임 체크 과정에서 문제 발생');
					}
				});
			} else {
				alert('닉네임은 1~15자로 입력해야합니다.');
				$("#checkNickArea").text('닉네임은 1~8자로 입력해야합니다.');
				isCheckNick = false;
				$("#user_regist_form [name='isCheckNick']").val(isCheckNick);
			}
			
		});
		
		
		
		$("#user_regist_form [name='user_pw").keyup(function () {
			var user_pw = $("#user_regist_form [name='user_pw']").val();
			var user_pw_confirm = $("#user_regist_form [name='user_pw_confirm']").val();
			var msg='';
			if( user_pw.length > 0 && user_pw.length <= 15 ) {
				msg='사용 가능한 비밀번호입니다.';
				$("#checkPWArea").text(msg);
				if( user_pw == user_pw_confirm ) {
					msg='비밀번호가 일치합니다.';
					$("#checkPWConfirmArea").text(msg);
					isCheckPWConfirm = true;
					$("#user_regist_form [name='isCheckPWConfirm']").val(isCheckPWConfirm);
				} else {
					msg='비밀번호가 일치하지 않습니다.';
					$("#checkPWConfirmArea").text(msg);
				}
				isCheckPW = true;
				$("#user_regist_form [name='isCheckPW']").val(isCheckPW);
			} else {
				msg='사용 불가능한 비밀번호입니다.';
				$("#checkPWArea").text(msg);
				isCheckPW = false;
				$("#user_regist_form [name='isCheckPW']").val(isCheckPW);
				isCheckPWConfirm = false;
				$("#user_regist_form [name='isCheckPWConfirm']").val(isCheckPWConfirm);
			}
			
		});
		
		
		
		$("#user_regist_form [name='user_pw_confirm']").keyup(function () {
			var user_pw_confirm = $("#user_regist_form [name='user_pw_confirm']").val();
			var user_pw = $("#user_regist_form [name='user_pw']").val();
			var msg='';
			if( user_pw == user_pw_confirm ) {
				msg='비밀번호가 일치합니다.';
				$("#checkPWConfirmArea").text(msg);
				isCheckPWConfirm = true;
				$("#user_regist_form [name='isCheckPWConfirm']").val(isCheckPWConfirm);
			} else {
				msg='비밀번호가 일치하지 않습니다.';
				$("#checkPWConfirmArea").text(msg);
				isCheckPWConfirm = false;
				$("#user_regist_form [name='isCheckPWConfirm']").val(isCheckPWConfirm);
			}
		});
		
		$("#user_regist_form [name='user_tel']").keyup(function () {
			var user_tel = $("#user_regist_form [name='user_tel']").val();
			var user_mail = $("#user_regist_form [name='user_mail']").val();
			var msg='';
			if( user_tel.length > 0 && user_tel.length <= 11 ) {
				msg='사용 가능한 연락처입니다.';
				$("#checkTelArea").text(msg);
				isCheckTelOrMail = true;
				$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
				
			} else if (user_tel.length > 12) {
				msg='연락처는 1~11자리 숫자여야 합니다.';
				$("#checkTelArea").text(msg);
				isCheckTelOrMail = false;
				$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
			} else {
				$("#checkTelArea").text('');
				if( user_mail.length > 0 && user_mail.length <= 11 ) {
					isCheckTelOrMail = true;
				} else {
					isCheckTelOrMail = false;
					$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
				}
			}
		});
		
		
		$("#user_regist_form [name='user_mail']").keyup(function () {
			var user_mail = $("#user_regist_form [name='user_mail']").val();
			var user_tel = $("#user_regist_form [name='user_tel']").val();
			var msg='';
			if( user_mail.length > 0 && user_mail.length <= 30 ) {
				msg='사용 가능한 메일입니다.';
				$("#checkMailArea").text(msg);
				isCheckTelOrMail = true;
				$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
			} else if (user_mail.length > 30){
				msg='이메일은 1~30자여야 합니다.';
				$("#checkMailArea").text(msg);
				isCheckTelOrMail = false;
				$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
			} else {
				$("#checkMailArea").text('');
				if( user_tel.length > 0 && user_tel.length <= 11 ) {
					isCheckTelOrMail = true;
				} else {
					isCheckTelOrMail = false;
					$("#user_regist_form [name='isCheckTelOrMail']").val(isCheckTelOrMail);
				}
			}
		});
		
		
	});

</script>




</head>
<body class="text-center">
<h2>${ login_user.user_nick } 님의 회원 정보입니다.</h2>
<form id="user_regist_form" action="<%= request.getContextPath() %>/update_result.khs" method="post">
	<table border="1">
		<tr>
			<th>ID(*)</th>
			<td><input class="input-group-text" type="text" name="user_id" value="${ login_user.user_id }" readonly> 
			</td>
		</tr>
		<tr>
			<th>PW(*)</th>
			<td><input class="input-group-text" type="password" name="user_pw" placeholder="1~15자 문자를 입력하세요. (필수입력사항)" required>
			<span id="checkPWArea"></span></td>
		</tr>
		<tr>
			<th>PW 확인(*)</th>
			<td><input class="input-group-text" type="password" name="user_pw_confirm" required>
			<span id="checkPWConfirmArea"></span></td>
		</tr>
		<tr>
			<th>닉네임(*)</th>
			<td><input class="input-group-text" type="text" name="user_nick" value="${ login_user.user_nick }" required > 
			<input class="btn btn-outline-secondary" type="button" id="nickCheckBtn" value="닉네임 중복체크">
			<span id="checkNickArea"></span>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<c:if test="${ login_user.user_tel eq -1 }" var="no">
				<td><input class="input-group-text" type="number" name="user_tel">
				<span id="checkTelArea"></span>
				</td>
			</c:if>
			<c:if test="${ not no }">
				<td><input class="input-group-text" type="number" name="user_tel" value="${ login_user.user_tel }">
				<span id="checkTelArea"></span>
				</td>
			</c:if>
			
		</tr>
		<tr>
			<th>이메일</th>	
			
			<c:if test="${ empty login_user.user_mail }" var="no">
				<td><input class="input-group-text" type="text" name="user_mail">
				<span id="checkMailArea"></span>
				</td>		
			</c:if>
			<c:if test="${ not no }">
				<td><input class="input-group-text" type="text" name="user_mail" value="${ login_user.user_mail }" >
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

<a href="<%= request.getContextPath() %>/main.khs">메인으로</a>




<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>