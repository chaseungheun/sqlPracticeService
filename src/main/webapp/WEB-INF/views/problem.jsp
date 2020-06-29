<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html> 
	<head> 
	<body> 
		<h1>내 정보</h1>
        <form action="problem.do" method="post">
        	정답입력</br>
        	<input type = "text" size="100">
 	        </br>
			<input type="submit" value="제출하기" onclick="history.back(-1);">        
		</form>
		<input type="button" value="뒤로가기" onclick="history.back(-1);">

	</body>
	
</html>
