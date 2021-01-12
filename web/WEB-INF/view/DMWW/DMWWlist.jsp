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
	<div>부서명: ${depName}</div>
	<c:forEach var="ob" items="${dwlist}">
		<div>
			<span>부서월업무 : ${ob.dw_monthwork}</span>
		</div>
		<div>
			<span>부서주업무 : ${ob.dw_weekwork}</span>
		</div>
	</c:forEach>
</body>
</html>