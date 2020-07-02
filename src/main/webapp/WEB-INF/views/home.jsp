<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
<style>
div {
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

	<div id="root">
		<header>
			<h1>문제 게시판</h1>
		</header>
		<section id="container">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>문제풀기</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.getP_num()}"/></td>
							<td><c:out value="${list.getP_title()}" /></td>
							<td><c:out value="차차" /></td>
							<td><a href='<c:url value='/sample/problem?p_no=${list.getP_num()}'/>' class="text-dark">풀기</a></td>
						</tr>
					</c:forEach>

				</table>
		</section>
	</div>
	<form action="<c:url value="/sample/problemCreate"/>" method="post">
		<input type="submit" value="문제 만들기">
	</form>
	ID : ${member.getId()}
	<br /> PW : ${member.getPw()}
	<br />
</body>
</html>