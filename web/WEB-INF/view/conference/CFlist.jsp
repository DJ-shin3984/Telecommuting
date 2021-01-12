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
		<c:if test="${!empty CFlist}">
			<c:forEach var="ob" items="${CFlist}">
				<div>	
					<a href="/Tel/CFdetail.do?cidx=${ob.c_Idx}&didx=${ob.d_idx}&midx=${ob.m_idx}">
					부서번호:${ob.d_idx} 게시글 제목:${ob.c_Title}</a>
				</div>
			</c:forEach>
		</c:if>
	<input type="button" value="글쓰기" onclick="location.href='/Tel/CFWriter.do?midx=${midx}&didx=${didx}'">
</body>
</html>