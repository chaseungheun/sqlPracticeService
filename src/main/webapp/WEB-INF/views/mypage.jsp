<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html> 
	<head> 
		<style>
			table{
	            width:530px;
	 			text-align: center;
				border:2px solid skyblue;
				margin-left:auto; 
            	margin-right:auto;
			}
			td{
            border:1px solid skyblue
        	}
        	div{
	 			width: 500px;
	 			height: 300px;
	 			text-align: center;
	 			font-weight: bold;
	 			margin-left:auto; 
            	margin-right:auto;
	 		}
		</style>
	</head>
	<body>
		<h3 style="text-align:center;margin-left:auto;margin-right:auto;">내 정보</h3>
	<%if(session.getAttribute("member") != null){ %>
		<table>
			<tr><td>이름</td> <td>${member.getName()}</td></tr>
			<tr><td>번호</td> <td>${member.getPhone()}</td></tr>
			<tr><td>푼 문제수</td> <td>5</td></tr>
			<tr><td>2020-06-30-09:34</td> <td> 1번 문제 성공</td></tr>
			<tr><td>2020-06-30-09:35</td> <td> 2번 문제 성공</td></tr>
			<tr><td>2020-06-30-09:38</td> <td> 1번 문제 실패</td></tr>
			<tr><td>2020-06-30-19:34</td> <td> 3번 문제 성공</td></tr>
			<tr><td>2020-06-30-19:50</td> <td> 4번 문제 성공</td></tr>
		</table>
		<%}else{ %>
			로그인하세요
		<%} %>
		<br>
		<div>
		
			<input type="button" value="뒤로가기" onclick="history.back(-1);">
		</div>
	</body>
	
</html>
