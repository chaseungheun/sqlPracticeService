<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<title>로그인</title>
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
	<div id="wrap">
		<br>
		<br> <b><font size="6" color="gray">로그인</font></b> <br>
		<br>
		<br>
		<form:form action="${cp}/sample/login.do" method="post" commandName="memberDto">
			<table>
				<tr>
					<td>ID</td>
					<td><form:input path="id" /></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><form:password path="pw" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form:form>
		<form action="home">
			<input type="submit" value="뒤로가기"
				style="text-align: left; width: 150; height: 30;">
		</form>
	</div>

</body>

</html>
