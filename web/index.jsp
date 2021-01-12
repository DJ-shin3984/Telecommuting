<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action="checklogin.do" method="post">
		아이디:<input id="inputId" type="text" name="id"><br> 
		비밀번호:<input id="inputPw" type="password" name="pw"><br>
		<input type="submit" value="로그인">
		<input type="button" value="취&nbsp;&nbsp;소"><br>
		<input type="button" value="회원가입" onclick="location.href='/Tel/jojnK.do';">
	</form>
</body>
</html>












