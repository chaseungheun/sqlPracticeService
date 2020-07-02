<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	 	<style>
	 		table{
	 			border: 2px solid #000;
	 			text-align: center;
	 			font-weight: bold;
	 			margin-left:auto; 
            	margin-right:auto;
	 		}
	 		div{
	 			text-align: center;

	 		    margin-left:auto; 
            	margin-right:auto;
            }

	 	</style>
</head>
<body>
	<table>
	<tr> <th>순위</th> <th>ID</th> <th>맞은 문제</th> </tr>
			<%int i=0; %>
			<c:forEach items="${list_ranking}" var="list">
				<tr> <td><%=i+1%>위 </td> <td> ${list.getId()}</td><td>${list.getP_cnt()}문제</td><tr>
				<%i=i+1; %>
			</c:forEach>
	</table>
	<div>
		<a href="/board">< </a><a href="/board">1 </a><a href="/board">2 </a><a href="/board">3 </a><a href="/board">4 </a><a href="/">5 </a><a href="/">></a>
		<br>
		<form action ="home">
			<br>
			<input type="submit" value="HOME" Style="width:200px;height:70px;font-size:30px;color:#000000;font-weight:bold;">
		</form>
	</div>
</body>
</html>