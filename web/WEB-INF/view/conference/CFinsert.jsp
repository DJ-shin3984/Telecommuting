<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/CFinsert.css">

</head>
<body>
<c:import url="/WEB-INF/view/menu.jsp"/>


<div class="CFinsert_frame">

<div class="CFinsert_frame_title">회의록 작성</div>


	<div class="CFinsert_frame_main"> 
		<form action="insertCF.do" method="POST">
			  <input type="text" name="title" class="input_title" placeholder="title"><br>
			 <input type="text" name="content" class="input_content" placeholder="content"><br>
			<input type="hidden" name="midx" value="${midx}">
			<input type="hidden" name="didx" value="${didx}">
			<!-- 작성 날짜 :  <input type="text" name="year" placeholder="yyyy"> - <input type="text" name="month" placeholder="mm"> - <input type="text" name="day" placeholder="dd"><br> -->
			<input type="submit" value="작성하기" class="input_btn">
		</form>
</div>
</div>
</body>
</html>