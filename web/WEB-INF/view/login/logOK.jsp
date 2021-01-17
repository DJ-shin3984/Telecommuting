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
<%-- 	<c:url var="url" value="mainDP.do?midx=${member.getM_idx()}&didx=${member.getD_idx()}"></c:url> --%>
	<c:url var="url" value="mainDP.do"></c:url>
	<c:redirect url="${url}"/>
</body>
</html>