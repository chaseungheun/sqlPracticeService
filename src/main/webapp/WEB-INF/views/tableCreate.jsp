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
			<h1> 테이블 작성 SQL</h1>
			<form action="<c:url value="/sample/tableCreate.do"/>" method="post">
	        	<textarea name="table_sql" cols="50" rows="30"></textarea>
	        	<br>
				<input type="submit" value="테이블 생성하기" style="width:120;height:40;text-align=center;">
			</form>
			
			<form action="home" method = "post">
				<input type="submit" value="뒤로가기" style="width:120;height:40;text-align=center;">
			</form>
		</div>
	</body>
	
</html>
