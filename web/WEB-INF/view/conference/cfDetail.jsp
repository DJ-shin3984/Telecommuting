<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/cfDetail.css">

</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp"/>


	<div class="cfDetail_frame">

		<div class="cfDetail_frame_title">${cfDTO.c_Title}</div>
		<div class="cfDetail_frame_content">${cfDTO.c_Content}</div>
		<div class="cfDetail_frame_date">작성 날짜 : ${cfDTO.c_Date}</div>
		<input type="hidden" name="midx" value="${midx}"> <input
			type="hidden" name="didx" value="${didx}"> <input
			type="button" value="목록으로"
			onclick="location.href='/Tel/depCFList.do?midx=${midx}&didx=${didx}'" class="cfDetail_frame_btn">


	</div>

</body>
</html>