<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu.css">


</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp" />



	<div class="main_frame">
		<div class="main_frame_left">
			
			<div>
			<span>Hello Telecommuting Project</span>
			</div>
		</div>
		<div class="main_frame_right">
			<c:import url="/WEB-INF/view/side.jsp" />

		</div>



</div>
</body>
</html>