<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html> 
	<head>
	    <title>로그인</title>
	        <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
	</head>
	<body>
		<div id="wrap">
		    <br><br>
	        <b><font size="6" color="gray">로그인</font></b>
	        <br><br><br>
			<form action="<c:url value="/sample/login.do"/>" method="post"> 
				<input type="text" name="id" placeholder="아이디" style="text-align:left;width:150;height:30;"><br/>
				<input type="password" name="pw" placeholder="비밀번호" style="text-align:left;width:150;height:30;"><br><br/> 
				<input type="submit" value="로그인" style="text-align:left;width:150;height:30;">
			</form>
			<form action="home">
				<input type="button" value="뒤로가기" style="text-align:left;width:150;height:30;">
			</form>
		</div>
	 
	</body>
	
</html>
