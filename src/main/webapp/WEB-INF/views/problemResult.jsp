<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<html> 
	<head>

	<body> 
		<input id = "test" type="text" value = "채점시작" class="inputbox" size ="10"/>
		<form action="home">
			<input type="submit" value="HOME">
		</form>
		
		<script type="text/javascript">	
			setTimeout(function() {document.getElementById("test").value='0';}, 1000);
			setTimeout(function() {document.getElementById("test").value='50';}, 2000);
			setTimeout(function() {	document.getElementById("test").value='정답';}, 3000);
		</script>
		
	</body>
	
</html>
