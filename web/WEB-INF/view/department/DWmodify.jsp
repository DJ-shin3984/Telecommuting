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
	<form action="DWUpdate.do" name="" method="post">
		<span>사원번호</span><br>
		<input type="text" name="m_idx" value="${midx}"><br>
		<span>부서번호</span><br>
		<input type="text" name="d_idx" value="${dwDTO.d_idx}"><br>
		<span>부서업무번호</span><br>
		<input type="text" name="dw_idx" value="${dwDTO.dw_idx}"><br>
		<span>부서 스케줄</span><br>
		<input type="text" name="dw_schedule" value="${dwDTO.dw_schedule}"><br>
		<span>부서 월간업무</span><br>
		<input type="text" name="dw_monthwork" value="${dwDTO.dw_monthwork}"><br>
		<span>부서 주간업무</span><br>
		<input type="text" name="dw_weekwork" value="${dwDTO.dw_weekwork}"><br>
		<span>부서업무제목</span><br>
		<input type="text" name="dw_title" value="${dwDTO.dw_title}"><br>
		<span>개인업무내용</span><br>
		<input type="text" name="dw_content" value="${dwDTO.dw_content}"><br>
		<br>
		<input type="submit" value="수정" >
		<input type="reset" value="다시작성">
		<input type="button" value="board화면으로 이동" 	onclick="location.href='/Tel/mainDP.do?midx=${midx}&didx=${dwDTO.d_idx}'"/>
	</form>
</body>
</html>