<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ranking Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css">
<meta name="username" content="">

<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/ranklist.css">

<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
html {
	height: 100%;
}
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
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="text-center">
				<H1>
					<span class="label label-info">랭킹</span>
				</H1>
			</div>
		</div>
		<div class="margin-bottom-20"></div>
		<div class="col-md-12">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered sortable-table no-mathjax"
					id="ranklist">
					<thead>
						<tr>
							<th style="width: 10%;" data-sort="int">등수</th>
							<th style="width: 13%;" data-sort="string">아이디</th>
							<th style="width: 47%;" data-sort="string">상태 메시지</th>
							<th style="width: 10%;" data-sort="int">맞은 문제</th>
							<th style="width: 10%;" data-sort="int">제출</th>
							<th style="width: 10%;" data-sort="float">정답 비율</th>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 0;
						%>
						<c:forEach items="${list_ranking}" var="list">
							<tr>
								<td><%=i + 1%></td>
								<td>${list.getId()}</td>
								<td>${list.getMessage()}</td>
								<td>${list.getOk_cnt()}</td>
								<td>${list.getSub_cnt()}</td>
								<td>${list.getOk_cnt()/list.getSub_cnt()}</td>
							</tr>
							<%
								i = i + 1;
							%>

						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-12">
			<div class="text-center">
				<form action="home">
					<br> <input type="submit" value="HOME"
						class="btn btn-lg btn-primary"
						Style="width: 200px; height: 70px; font-size: 30px; color: #fff; font-weight: bold; background-color:#007bff;">
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_SVG"></script>
	<script
		src="https://ddo7jzca0m2vt.cloudfront.net/bower/stupidtable/stupidtable.js"></script>
	<script type="text/javascript"
		src="https://ddo7jzca0m2vt.cloudfront.net/js/table-util.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/keymaster/1.6.1/keymaster.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>