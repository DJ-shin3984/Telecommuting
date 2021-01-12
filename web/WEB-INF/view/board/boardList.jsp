<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp"/><br>
	<c:import url="/WEB-INF/view/side.jsp"/><br>
보드 리스트<br>
<c:if test="${!empty list}">

<c:forEach items="${list}" var="ob">
==========<br>
${ob.b_Idx}<br>
<a href="readBoard.do?bIdx=${ob.b_Idx}&midx=${midx}&didx=${didx}">${ob.b_Title}</a><br>
${ob.b_Date}<br>
${ob.m_Name}<br>
==========<br><br>
</c:forEach>

</c:if>

<br><button onclick="location.href='createBoardePg.do?midx=${midx}&didx=${didx}'">새로운 글 작성</button><br><br>
${paging.getPagingHTML()}

</body>
</html>