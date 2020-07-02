<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html> 
	<head> 
		<style>
			 	div{
		 			width: 600px;
		 			text-align: center;
		 			line-height: 20px;
		 			font-weight: bold;
		 			margin-left:auto; 
	            	margin-right:auto;
		 		}
	 		</style>
	</head>
	<body> 
		<div>
			<h1>2번 문제</h1>
			<form:form action="${cp}/sample/problemCreate.do" method="post" commandName="problemDto">

	        	문제 제목 : <form:input path = "p_title" size="100" style="height:40;" /><br>
	        	문제 내용 : <form:input path = "p_body" size="100" style="height:120;" /><br>
	        	문제 정답 : <form:input path = "p_answer" size="100" style="height:40;"/><br>
				<input type="submit" value="문제 출제하기" style="width:100;height:40;text-align=center;">
			</form:form>
			<form action="home" method = "post">
				<input type="submit" value="뒤로가기" style="width:100;height:40;text-align=center;">
			</form>
		</div>
	</body>
	
</html>
