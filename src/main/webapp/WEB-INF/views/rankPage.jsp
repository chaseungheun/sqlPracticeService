<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<%for(int i=0;i<15;i++){ %>
		<tr> <td><%=i+1%>�� </td> <td> ��Ŀ<%=i+1%></td><td><%=100-i %>��</td><tr>
	<%} %>
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