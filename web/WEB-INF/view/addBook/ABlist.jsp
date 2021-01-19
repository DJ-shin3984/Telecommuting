<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ABlist.css">

</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp"/>
	
	<div class="ABlist_frame">
	<div class="ABlist_frame_left">
		
		<div class="ABlist_frame_left_main"> 
	<div class="ABlist_frame_left_title">연명부 리스트</div>
	<div class="ABlist_frame_left_bar"><span class="name">이름</span> <span class="phone">연락처</span> </div>
		<c:if test="${!empty addBookList}">
			<c:forEach var="ob" items="${addBookList}">
				<div class="oneline">	
					<a href="/Tel/AddDetail.do?midx=${ob.m_idx}&didx=${ob.d_idx}">
					<span class="name">${ob.m_name}</span> 
					<span class="phone">${ob.m_phone}</span> </a>
				</div>
			</c:forEach>
		</c:if>
		</div>
	
	</div>
	<div class="ABlist_frame_right">
			<c:import url="/WEB-INF/view/side.jsp"/>
	</div>
	</div>
	

		
		
</body>
</html>