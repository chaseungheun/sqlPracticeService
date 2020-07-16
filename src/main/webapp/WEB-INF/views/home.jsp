<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="apple-touch-icon" sizes="180x180"
	href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#0076c0">
<meta name="msapplication-TileColor" content="#00aba9">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/style.css?version=20200429">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700|Open+Sans:400,400i,700,700i|Source+Code+Pro&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/connect.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/result.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/custom.css?version=20200429">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/theme-colors/blue.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/pace.css">
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-10874097-3"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/noty/3.1.4/noty.min.css" />
<meta name="username" content="">


<title>게시판</title>
<style>
input[type="submit"] {
	/* change these properties to whatever you want */
	background-color: #f0f8ff;
	color: #000;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="header no-print">
		<div class="topbar">
			<div class="container">
				<ul class="loginbar pull-right">
					<%
						if (session.getAttribute("member") == null) {
					%>
					<li><a href="/board/sample/login">로그인</a></li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/join">회원가입</a></li>
					<li class="topbar-devider"></li>
					<%
						} else {
					%>
					<li>${member.getName()}님 반갑습니다!</li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/mypage" class="username">마이 페이지</a></li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/logout.do" class="username">로그아웃</a></li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/problemCreate" class="username">문제
							만들기</a></li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/jproblemCreate">자바문제 만들기</a></li>
					<li class="topbar-devider"></li>
					<li><a href="/board/sample/tableCreate">테이블 만들기</a></li>
					<li class="topbar-devider"></li>

					<%}%>
					<li><a href="/board/sample/rank">순위보기</a>
					<li class="topbar-devider"></li>

					<li><a href="/board/sample/post">공지사항</a></li>
					
				</ul>
			</div>
		</div>
	</div>


	<div class="text-center" style="font-weight: bold; font-size: 5rem">
		SQL 문제 게시판</div>

	<div class="col-md-12">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered sortable-table clickable-table"
				id="problemset">
				<thead>
					<tr>
						<th style="width: 25%" data-sort="int">문제 번호</th>
						<th style="width: 50%" data-sort="string">제목</th>
						<th style="width: 7%" data-sort="int">정답</th>
						<th style="width: 15%" data-sort="int">제출</th>
						<th style="width: 8%" data-sort="float">정답 비율</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><a
								href='<c:url value='/sample/problem?p_no=${list.getP_num()}'/>'>${list.getP_num()}</a></td>
							<td><c:out value="${list.getP_title()}" /></td>
							<td><c:out value="${list.getOk_cnt()}" /></td>
							<td><c:out value="${list.getSub_cnt()}" /></td>
							<c:if test="${list.getSub_cnt()==0}">
								<td>0%</td>
							</c:if>
							<c:if test="${list.getSub_cnt()!=0}">
								<td><c:out
										value="${ list.getOk_cnt()*100/list.getSub_cnt()}%" /></td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div class="text-center" style="font-weight: bold; font-size: 5rem">
		JAVA 문제 게시판</div>
		
	<div class="col-md-12">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered sortable-table clickable-table"
				id="problemset">
				<thead>
					<tr>
						<th style="width: 25%" data-sort="int">문제 번호</th>
						<th style="width: 50%" data-sort="string">제목</th>
						<th style="width: 7%" data-sort="int">정답</th>
						<th style="width: 15%" data-sort="int">제출</th>
						<th style="width: 8%" data-sort="float">정답 비율</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jlist}" var="jlist">
						<tr>
							<td><a
								href='<c:url value='/sample/jproblem?p_no=${jlist.getP_num()}'/>'>${jlist.getP_num()}</a></td>
							<td><c:out value="${jlist.getP_title()}" /></td>
							<td><c:out value="${jlist.getOk_cnt()}" /></td>
							<td><c:out value="${jlist.getSub_cnt()}" /></td>
							<c:if test="${jlist.getSub_cnt()==0}">
								<td>0%</td>
							</c:if>
							<c:if test="${jlist.getSub_cnt()!=0}">
								<td><c:out
										value="${ jlist.getOk_cnt()*100/jlist.getSub_cnt()}%" /></td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

	<br />

	<div class="col-md-12">
		<div id="real-time"
			style="height: 200px; width: 290px; border: 1px solid #ccc; font: 16px/26px Georgia, Garamond, Serif; overflow: auto;">
			the scroll box.</div>
		<%
			if (session.getAttribute("member") != null) {
		%>
		<input type="text" name=chat_content id="chat_content"
			style="width: 200px;"> <input type="submit" value="채팅보내기"
			id="chat_btn" style="width: 80px">
		<%}%>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		var pre = "";
		document.getElementById("real-time").innerHTML = "실시간 채팅";

		$('#chat_btn')
				.click(
						function(e) {
							var str = document.getElementById("chat_content").value;
							const chat_data = {
								content : str
							};
							if (str) {
								$
										.ajax({
											url : "chat",
											type : "POST",
											data : chat_data,
											success : function(data) {
												console.log(data);
												document
														.getElementById("chat_content").value = "";
												//append() 줄바꿈하는방법?

											},
											error : function() {
												document
														.getElementById("chat_content").value = str
														+ "에러";
											}
										})
							}
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