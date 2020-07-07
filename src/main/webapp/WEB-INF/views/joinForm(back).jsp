<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>회원가입</title>
<style>
#title {
	background-color: skyblue
}

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
	background: linear-gradient(to bottom right, #0098FF, #6BA8D1);
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}
</style>
</head>
<body>
	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div class="card align-middle"
		style="width: 20rem; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">회원 가입</h2>
		</div>
		<div class="card-body">
			<form:form action="${cp}/sample/join.do" class="form-signin"
				method="POST" commandName="memberDto">
				<label for="inputEmail" class="sr-only">Your ID</label>
				<form:input path="id" class="form-control" placeholder="Your ID" />
				<BR>
				<label for="inputPassword" class="sr-only">Password</label>
				<form:password path="pw" class="form-control" placeholder="Password" />
				<br>
				<input type="submit" value="로그인 "
					class="btn btn-lg btn-primary btn-block" type="submit" />

			</form:form>
			<form action="home">
				<input type="button" value="뒤로가기 "
					class="btn btn-lg btn-primary btn-block" type="submit" />
			</form>
		</div>
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
	<div id="wrap">

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

