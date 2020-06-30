<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%for(int i=0;i<15;i++){ %>
		<h4><%=i+1%>위 : 누구</h4>
	<%} %>
	<br><br>
	<form action ="home">
		<input type="submit" value="HOME" Style="width:200px;height:100px;font-size:30px;color:#87aeeb;font-weight:bold;">
	</form>
</body>
</html>