<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

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
			<h1>${pro.getP_num()}번 문제</h1>
	        <form action="problem.do" method="post">
					<c:out value="${pro.getP_body()}" />
	        	<br>
	        	<input type = "text" size="60" style="height:40;" name="sql">
				<input type = "hidden" value=${pro.getP_num()} name="pnum"> 

	        	<br>
	        	<br>
				<input type="submit" value="정답 제출하기" style="width:100;height:40;text-align=center;">
			</form>
			<form action="home" method = "post">
				<input type="submit" value="뒤로가기" style="width:100;height:40;text-align=center;">
			</form>
		</div>
	</body>
	
</html>
