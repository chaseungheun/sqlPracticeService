<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

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
		<%
			if (session.getAttribute("member") == null) {
		%>

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
		<%
			} else {
		%>
		${member.getId()} 님 반갑습니다!
		<tr>

			<form action="<c:url value="/sample/mypage"/>" method="post">
				<input type="submit" value="마이페이지">
			</form>
		</tr>
		<tr>
			<form action="<c:url value="/sample/logout.do"/>" method="post">
				<input type="submit" value="로그아웃">
			</form>
		</tr>
		<%
			}
		%>

		<tr>
			<form action="<c:url value="/sample/rank"/>" method="post">
				<input type="submit" value="순위보기">
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
						<td><c:out value="${list.getP_num()}" /></td>
						<td><c:out value="${list.getP_title()}" /></td>
						<td><c:out value="차차" /></td>
						<td><a
							href='<c:url value='/sample/problem?p_no=${list.getP_num()}'/>'
							class="text-dark">풀기</a></td>
					</tr>
				</c:forEach>

			</table>
		</section>

	</div>
	<form action="<c:url value="/sample/problemCreate"/>" method="post">
		<input type="submit" value="문제 만들기">
	</form>
	<form action="<c:url value="/sample/tableCreate"/>" method="post">
		<input type="submit" value="테이블 만들기">
	</form>
	<div>
		<div id="real-time"
			style="height: 200px; width: 200px; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto;">
			the scroll box. <input>
		</div>
		<%
			if (session.getAttribute("member") != null) {
		%>
		<input type="text" name=chat_content id="chat_content"> <input
			type="submit" value="채팅보내기" id="chat_btn">
		<%}%>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		var pre = "";
		document.getElementById("real-time").innerHTML = "실시간 채팅";

		$('#chat_btn').click(function(e) {
			var str = document.getElementById("chat_content").value;
			pre = str;
			const chat_data = {
				content : str
			};

			$.ajax({
				url : "chat",
				type : "POST",
				data : chat_data,
				success : function(data) {
					console.log(data);
					document.getElementById("chat_content").value = "";
					//append() 줄바꿈하는방법?

				},
				error : function() {
					document.getElementById("chat_content").value = str + "에러";
				}
			})
		});

		$(document)
				.ready(
						function() {
							setInterval(
									function() {

										$
												.ajax({
													url : "getChat",
													type : "POST",
													success : function(data) {
														if (pre == "") {
															pre = data;
														}
														if (pre != data) {
															document
																	.getElementById("real-time").innerHTML += "<br/>"
																	+ data;

															pre = data;
														}
													}
												})
									}, 1000);
						});
	</script>

</body>
</html>