<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var memberId = $("#memberId").val();
			var memberPw = $("#memberPw").val();
			if(memberId == ""){
				alert("아이디를 입력하세요.");
				$("#memberId").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(memberPw == ""){
				alert("아이디를 입력하세요.");
				$("#memberPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${path}/member/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<h2>로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
				<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
				</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>