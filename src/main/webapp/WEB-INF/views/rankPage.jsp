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
	<tr> <th>����</th> <th>ID</th> <th>���� ����</th> </tr>
			<%int i=0; %>
			<c:forEach items="${list_ranking}" var="list">
				<tr> <td><%=i+1%>�� </td> <td> ${list.getId()}</td><td>${list.getP_cnt()}����</td><tr>
				<%i=i+1; %>
			</c:forEach>
	</table>
	<div>
		<form action ="home">
			<br>
			<input type="submit" value="HOME" Style="width:200px;height:70px;font-size:30px;color:#000000;font-weight:bold;">
		</form>
	</div>
</body>
</html>