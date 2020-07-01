<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>회원가입 화면</title>

<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	border: 3px solid skyblue
}

td {
	border: 1px solid skyblue
}

#title {
	background-color: skyblue
}
</style>
</head>
<body>
	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->

	<div id="wrap">
		<br>
		<br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br>
		<br>

		<form:form action="${cp}/sample/join.do" method="post" commandName="memberDto">
			<table>
				<tr>
					<td>아이디</td>
					<td><form:input path="id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><form:input path="pw" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><form:input path="phone" /></td>
				</tr>
				
			</table>
			<input type="submit" value="가입" />
		</form:form>
	</div>
</body>
</html>

