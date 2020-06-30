<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  문제
			</nav>
			<hr />
			

				<form method="post" action="<c:url value="/sample/problem"/>">
					<table>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>문제풀기</th></tr>
						
							<tr>
								<td><c:out value="1" /></td>
								<td><c:out value="1번문제 삽입" /></td>
								<td><c:out value="차승훈" /></td>
								<td><input type = "submit" value="풀기"></td>
							</tr>
							<tr>
								<td><c:out value="2" /></td>
								<td><c:out value="2번문제 삭제" /></td>
								<td><c:out value="차승훈" /></td>
								<td><input type = "submit" value="풀기"></td>

							</tr>
							<tr>
								<td><c:out value="3" /></td>
								<td><c:out value=" 문제 " /></td>
								<td><c:out value="차승훈" /></td>
								<td><input type = "submit" value="풀기"></td>

							</tr>
						
					</table>
				</form>
			<hr />
		</div>
		<form action="<c:url value="/sample/login"/>" method="post"> 
			<input type="submit" value="로그인"> 
		</form>
		<form action="<c:url value="/sample/join"/>" method="post"> 
			<input type="submit" value="회원가입"> 
		</form>
		<form action="<c:url value="/sample/mypage"/>" method="post"> 
			<input type="submit" value="마이페이지"> 
		</form>
		<form action="<c:url value="/sample/rank"/>" method="post"> 
			<input type="submit" value="순위보기"> 
		</form>
		
		
	</body>
</html>