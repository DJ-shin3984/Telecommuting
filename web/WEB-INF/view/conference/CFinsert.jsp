<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회의록 작성

<form action="insertCF.do" method="POST">
제목 : <input type="text" name="title"><br>
내용 : <input type="text" name="content"><br>
<input type="hidden" name="midx" value="${midx}">
<input type="hidden" name="didx" value="${didx}">
<!-- 작성 날짜 :  <input type="text" name="year" placeholder="yyyy"> - <input type="text" name="month" placeholder="mm"> - <input type="text" name="day" placeholder="dd"><br> -->
<input type="submit" value="작성하기">
</form>

</body>
</html>