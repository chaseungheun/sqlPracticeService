<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css">
<meta name="username" content="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/ranklist.css">
<style>
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 80px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
	background: linear-gradient(to bottom right, white, white);
}
table {
	width: 530px;
	text-align: center;
	border: 2px solid skyblue;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid skyblue
}
</style>
</head>

<body>
	<%
		if (session.getAttribute("member") != null) {
	%>
	<div class="col-md-12">
		<div class="text-center">
			<H1>
				<span class="label label-info">마이 페이지</span>
			</H1>
		</div>
	</div>
	<br />
	<br />
	<div class="col-md-12">
		<table>
			<tr>
				<td>이름</td>
				<td>${member.getName()}</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>${member.getPhone()}</td>
			</tr>
			<tr>
				<td>푼 문제수</td>
				<td>${member.getP_cnt()}</td>
			</tr>
			<tr>
				<td>2020-06-30-09:34</td>
				<td>1번 문제 성공</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="HOME"
					onclick="history.back(-1);" class="btn btn-lg btn-primary"
					Style="width: 200px; height: 60px; font-size: 30px; color: #FFF; font-weight: bold; background-color:#007bff"></td>
			</tr>
		</table>
		<%
			} else {
		%>
		로그인하세요
		<%
			}
		%>
		<br>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_SVG"></script>
	<script
		src="https://ddo7jzca0m2vt.cloudfront.net/bower/stupidtable/stupidtable.js"></script>
	<script type="text/javascript"
		src="https://ddo7jzca0m2vt.cloudfront.net/js/table-util.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.min.js"></script>

</body>

</html>
