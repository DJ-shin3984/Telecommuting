<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
<!-- 로그인한 사원의 level 에 따라서 접근권한 부여 -->
			<h1>Conference</h1><br>
			<c:forEach var="ob" items="${dep_list}">
				<div>	
					<a href="/Tel/addBookList.do?didx=${ob.d_Idx}&midx=${member.m_idx}">
					부서번호:${ob.d_Idx} 부서명:${ob.d_Name} 부서연락처:${ob.d_Phone}</a>
				</div>
			</c:forEach>
</body>
</html>