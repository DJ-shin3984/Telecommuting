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
	<c:import url="/WEB-INF/view/menu.jsp"/><br>
	<c:import url="/WEB-INF/view/side.jsp"/><br>
	<h1>Conference List</h1><br>
		<c:if test="${!empty addBookList}">
			<c:forEach var="ob" items="${addBookList}">
				<div>	
					<a href="/Tel/AddDetail.do?midx=${ob.m_idx}&didx=${ob.d_idx}">
					사원 이름:${ob.m_name}<br> 연락처:${ob.m_phone} <br> </a>
				</div>
			</c:forEach>
		</c:if>
</body>
</html>