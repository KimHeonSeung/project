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
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	
	var like_count_tot = ${like_count};
	
	
	$(function () {
		var isLogin = false;
		var user_id = '${user_id}';
		
		if(user_id.length != 0) {
			isLogin = true;
		}
		
		if(isLogin == true) {
			$("#likeBtn").on("click", function () {
					$.ajax({
						url:'<%=request.getContextPath()%>/like.khs',
						type:"post",
						contentType:"application/x-www-form-urlencoded; charset=utf-8",
						data:"user_id=${user_id}&article_num=${article_num}&like_count=${like_count}",
						dataType:"text",
						success:function (result){ // result 는 불린 타입
							var msg='';
							// 성공 시 확인창과 보여줄 메세지를 설정
							if( eval(result) ){ // true 라면, 즉 이미 존재하는 ID
								alert('좋아요 완료');
								msg='좋아요 취소';
								like_count_tot += 1;
								$("#like").text(msg);
								$("#likeCountArea").text(like_count_tot);
							} else { // 가입할 수 있는 ID
								alert('좋아요 취소 완료');
								msg='좋아요';
								like_count_tot -= 1;
								$("#like").text(msg);
								$("#likeCountArea").text(like_count_tot);
							}
						},
						error:function (result){
							alert('좋아요 과정에서 문제 발생');
						}
					});
				});
			};
			
			if(isLogin == false) {
				$("#likeBtn").on("click", function () {
					alert('로그인이 필요한 서비스입니다.');
				});
			}
			
		});
	
		

</script>


</head>
<body>
<div class="list-group">
	<input type="hidden" name="user_id" value="${ login_user.user_id }">
	<input type="hidden" name="article_num" value="${ detailBoard.article_num }">
<table border="1">
	<tr>
		<th>${ detailBoard.article_title }</th>
		<th>${ detailBoard.write_date }</th>
	</tr>
	<tr>
		<th>${ detailBoard.writer_nick }</th>
		<th>조회수 (${ read_count })</th>
	</tr>
	<tr>
		<th align="center" colspan="2">${ detailBoard.article_content }</th>
	</tr>
	<tr>
		<th>댓글 ()</th>
		<th><button id="likeBtn"><span id="like">
			<c:if test="${like_check==true}" var="p">
				좋아요 취소
			</c:if>
			<c:if test="${not p}">
				좋아요
			</c:if>
		</span></button>(<span id="likeCountArea">${ like_count }</span>)</th>
	</tr>

</table>
</div>

<a href="<%= request.getContextPath() %>/main.khs">메인으로</a>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>