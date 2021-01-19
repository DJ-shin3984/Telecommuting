<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ABdetail.css">

</head>
<body>
<c:import url="/WEB-INF/view/menu.jsp"/>

<div class="ABdetail_frame">

	<div class="ABdetail_frame_main">
		<div class="ABdetail_frame_main_number">사원 번호: ${member.m_idx}</div> 
		<div>
		 <img src="/Tel/resources/profileImage/${member.m_photo}" width="50" height="50" border="0" class="img">
		</div>
		<div class="ABdetail_frame_main_content">
		<div>이름: ${member.m_name}</div> 
		<div>아이디: ${member.m_id} </div> 
		<%-- <div>비밀번호: ${member.m_pw}</div>  --%>
		<div>연락처: ${member.m_phone}</div> 
		<div>비상연락처: ${member.m_subphone}</div> 
		<div>이메일: ${member.m_email}</div> 
		<div>주소: ${member.m_add}</div> 
		<div>입사일: ${member.m_empdate}</div> 
		<div>부서번호: ${member.d_idx}</div> 
		<div>권한접근Lv: ${member.m_level}</div> 
		</div>
	</div>
	
	<div class="btn_bar">
	<input type="button" value="삭제하기" onclick="location.href='/Tel/AddDelete.do?midx=${midx}&didx=${didx}'">
	<input type="button" value="수정하기" onclick="location.href='/Tel/Addmodify.do?midx=${midx}&didx=${didx}'">
	<input type="button" value="목록으로" onclick="location.href='/Tel/addBookList.do?midx=${midx}&didx=${didx}'">
	</div>
</div>
</body>
</html>