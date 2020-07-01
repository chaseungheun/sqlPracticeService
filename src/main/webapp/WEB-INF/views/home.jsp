<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
<style>
div {
	border: 2px solid #000;
	width: 500px;
	height: 300px;
	text-align: center;
	line-height: 100px;
	font-weight: bold;
	margin-left: auto;
	margin-right: auto;
}

th {
	width: 100px;
}

.nnav {
	width: 500px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.tab {
	white-space: pre;
}
</style>
</head>
<body>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<sapn class="tab">&#9;</sapn>
	<table class="nnav">
		<tr>
			<form action="<c:url value="/sample/login"/>" method="post">
				<input type="submit" value="로그인">
			</form>
		</tr>
		<tr>
			<form action="<c:url value="/sample/join"/>" method="post">
				<input type="submit" value="회원가입">
			</form>
		</tr>
		<tr>
			<form action="<c:url value="/sample/mypage"/>" method="post">
				<input type="submit" value="마이페이지">
			</form>
		</tr>
		<tr>
			<form action="<c:url value="/sample/rank"/>" method="post">
				<input type="submit" value="순위보기">
			</form>
		</tr>
		<tr>
			<form action="<c:url value="/sample/logout.do"/>" method="post">
				<input type="submit" value="로그아웃">
			</form>
		</tr>
	</table>

	<a href="${cp}/">MAIN</a>
	<div id="root">
		<header>
			<h1>문제 게시판</h1>
		</header>

		<form method="post" action="<c:url value="/sample/problem"/>">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>문제풀기</th>
				</tr>

				<tr align="center">
					<td><c:out value="1" /></td>
					<td><c:out value="조회 문제" /></td>
					<td><c:out value="차승훈" /></td>
					<td><input type="submit" value="풀기"></td>
				</tr>
				<tr align="center">
					<td><c:out value="2" /></td>
					<td><c:out value="삽입 문제" /></td>
					<td><c:out value="차승훈" /></td>
					<td><input type="submit" value="풀기"></td>

				</tr>
				<tr align="center">
					<td><c:out value="3" /></td>
					<td><c:out value="변경 문제 " /></td>
					<td><c:out value="차승훈" /></td>
					<td><input type="submit" value="풀기"></td>

				</tr>

			</table>
		</form>
	</div>
			<form action="<c:url value="/sample/problemCreate.do"/>" method="post">
				<input type="submit" value="문제 만들기">
			</form>
	<h1>MEMBER LOGIN OK</h1>

	ID : ${member.getId()}
	<br /> PW : ${member.getPw()}
	<br />
</body>
</html>