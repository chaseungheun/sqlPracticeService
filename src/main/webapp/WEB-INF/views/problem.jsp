<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html> 
	<head> 
	<body> 
		<h1>n번 문제</h1>
        <form action="problem.do" method="post">
        	테이블은 STUDENT에서 모든 사람의 이름을 오름차순으로 출력하세요<br>
        	<input type = "text" size="100">
        	<br>
			<input type="submit" value="정답 제출하기">        
		</form>
		<form action="home" method = "post">
			<input type="submit" value="HOME">
		</form>
	</body>
	
</html>
