<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/createBoardePg.css">
</head>
<body>
<c:import url="/WEB-INF/view/menu.jsp"/>
<div class="createBoardePg_frame">
	<div class="createBoardePg_frame_main">
		<form action="createBoard.do" method="post" class="input_form">
			<input type="text" placeholder="title" name="bTitle" class="input_title">
			<br>
			<textarea rows="" cols="" name="bContent" placeholder="content" class="input_content"></textarea>
			<input type="hidden" name="midx" value="${midx}"><input type="hidden" name="didx" value="${didx}">
			<input type="submit" value="확인" class="input_btn">
		</form>
	</div>
</div>
</body>
</html>