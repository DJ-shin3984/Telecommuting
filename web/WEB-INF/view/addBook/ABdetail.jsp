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
	<div>
		<span>사원 번호: ${member.m_idx}</span><br>
		<span>사진: <img src="/Tel/resources/profileImage/${member.m_photo}" width="50" height="50" border="0"></span><br>
		<span>이름: ${member.m_name}</span><br>
		<span>아이디: ${member.m_id} </span><br>
		<span>비밀번호: ${member.m_pw}</span><br>
		<span>연락처: ${member.m_phone}</span><br>
		<span>비상연락처: ${member.m_subphone}</span><br>
		<span>이메일: ${member.m_email}</span><br>
		<span>주소: ${member.m_add}</span><br>
		<span>입사일: ${member.m_empdate}</span><br>
		<span>부서번호: ${member.d_idx}</span><br>
		<span>권한접근Lv: ${member.m_level}</span><br>
	</div>
	<input type="button" value="삭제하기" onclick="location.href='/Tel/AddDelete.do?midx=${midx}&didx=${didx}'">
	<input type="button" value="수정하기" onclick="location.href='/Tel/Addmodify.do?midx=${midx}&didx=${didx}'">
	<input type="button" value="목록으로" onclick="location.href='/Tel/addBookList.do?midx=${midx}&didx=${didx}'">

</body>
</html>