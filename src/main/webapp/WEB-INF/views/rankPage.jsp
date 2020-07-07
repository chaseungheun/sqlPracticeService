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

</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="text-center">
				<p>
				<H1>
					<span class="label label-info">랭킹</span>
				</H1>
				</p>
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
								<td><%=i + 1%>등 이군, 더 열심히 하자</td>
								<td>${list.getP_cnt()}</td>
								<td>${list.getP_cnt()*4}</td>
								<td>${1/4}</td>
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
						Style="width: 200px; height: 70px; font-size: 30px; color: #000000; font-weight: bold;">
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

</body>
</html>