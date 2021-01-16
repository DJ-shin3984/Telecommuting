<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/CFlist.css">

</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp"/>

<div class="CFlist_frame">
<div class="CFlist_frame_left">
	<div class="CFlist_frame_left_title">Conference List</div>
	<div class="CFlist_frame_left_content">
		<c:if test="${!empty CFlist}">
			<c:forEach var="ob" items="${CFlist}">
				<div class="CFlist_frame_left_content_line">	
					<a href="/Tel/CFdetail.do?cidx=${ob.c_Idx}&didx=${ob.d_idx}&midx=${ob.m_idx}">
					<span>부서번호 : ${ob.d_idx}</span><span>게시글 제목:${ob.c_Title}</span>					
					
					</a>
				</div>
			</c:forEach>
		</c:if>
		</div>
	<input type="button" class="CFlist_btn" value="글쓰기" onclick="location.href='/Tel/CFWriter.do?midx=${midx}&didx=${didx}'">

</div>
<div class="CFlist_frame_right">
		<c:import url="/WEB-INF/view/side.jsp"/>

</div>


</div>		
		
</body>
</html>