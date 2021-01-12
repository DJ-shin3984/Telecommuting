<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="IWUpdate.do" name="" method="post">
	<span>업무번호</span><br>
	<input type="text" name="iw_idx" value="${iwDTO.iw_idx}"><br>
	<span>사원번호</span><br>
	<input type="text" name="m_idx" value="${iwDTO.m_idx}"><br>
	<span>부서번호</span><br>
	<input type="text" name="d_idx" value="${didx}"><br>
	<span>개인업무제목</span><br>
	<input type="text" name="iw_title" value="${iwDTO.iw_title}"><br>
	<span>개인업무내용</span><br>
	<input type="text" name="iw_content" value="${iwDTO.iw_content}"><br>
	
	<br>
	<input type="submit" value="수정" >
	<input type="reset" value="다시작성">
	<input type="button" value="board화면으로 이동" 	onclick="location.href='/Tel/mainDP.do?midx=${iwDTO.m_idx}&didx=${didx}'"/>

</form>


</body>
</html>