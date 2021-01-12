<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목 : ${cfDTO.c_Title}<br>
	내용 : ${cfDTO.c_Content}<br>
	작성 날짜 : ${cfDTO.c_Date}<br>
	<input type="hidden" name="midx" value="${midx}"><br>
	<input type="hidden" name="didx" value="${didx}"><br>
	<input type="button" value="목록으로" onclick="location.href='/Tel/depCFList.do?midx=${midx}&didx=${didx}'">

</body>
</html>