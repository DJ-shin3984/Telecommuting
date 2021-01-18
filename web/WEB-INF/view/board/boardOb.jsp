<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
//줄바꿈
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
보드 객체
<form action="updateBoardPg.do" method="post">
	<input type="hidden" value="${dto.b_Idx}" name="bIdx">
	<input type="hidden" value="${dto.b_Title}" name="bTitle">제목 : ${dto.b_Title}<br>
	<input type="hidden" value="${dto.b_Content}" name="bContent">내용 <br>${fn:replace(dto.b_Content, cn, br)}<br>
	<input type="hidden" value="${dto.b_Date}" name="bDate">작성날짜 : ${dto.b_Date}<br>
	<input type="hidden" value="${dto.m_Name}" name="mName">작성자 : ${dto.m_Name}<br>
	<input type="hidden" value="${pg}" name="pg">
	<c:if test="${!empty dto.token}">
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='deleteBoard.do?bIdx=${dto.b_Idx}&pg=${pg}'">삭제</button>
	</c:if>
</form>
</body>
</html>