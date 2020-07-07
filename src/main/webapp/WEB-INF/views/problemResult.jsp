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
	<body> 
		<div>
			<input id = "test" type="text" value = "채점시작" class="inputbox" size ="10" style="width:100;height:40;text-align:center;"/>
			<form action="home">
				<input type="submit" value="HOME" style="width:100;height:40;text-align=center;">
			</form>
			
			<script type="text/javascript">	
				setTimeout(function() {document.getElementById("test").value='0';}, 1000);
				setTimeout(function() {document.getElementById("test").value='50';}, 2000);
				setTimeout(function() {	document.getElementById("test").value="${answer}";}, 3000);
			</script>
		</div>
	</body>
	
</html>
