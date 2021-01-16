<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DMWWlist.css">
</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp" />

	<div class="DMWWlist_frame">

		<div class="DMWWlist_frame_depName"><div>${depName}</div></div>
		<c:forEach var="ob" items="${dwlist}">
			<div class="DMWWlist_frame_month_task"><div>${depName} 월업무 : ${ob.dw_monthwork}</div></div>
			<div class="DMWWlist_frame_week_task"><div>${depName} 주업무 : ${ob.dw_weekwork}</div>	</div>
		</c:forEach>
	</div>
</body>
</html>