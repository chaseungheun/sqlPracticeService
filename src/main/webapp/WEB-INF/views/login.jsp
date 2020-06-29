<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html> 
	<head> 
	<body> 
				<h1>저는 <%= request.getParameter("id") %> 입니다.</h1>
		<form action="<c:url value="/sample/login"/>" method="post"> 
		<input type="text" name="id"><br/> 
		<input type="password" name="pw"><br/> 
		<input type="submit" value="Send"> 
		</form>

	 
	</body>
	
</html>
