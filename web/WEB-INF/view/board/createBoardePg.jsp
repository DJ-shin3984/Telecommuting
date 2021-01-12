<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="createBoard.do" method="post">
<input type="text" placeholder="title" name="bTitle"><br><br>
<textarea rows="" cols="" name="bContent" placeholder="content"></textarea>
<input type="hidden" name="midx" value="${midx}">
<input type="hidden" name="didx" value="${didx}">
<input type="submit" value="확인">
</form>

</body>
</html>