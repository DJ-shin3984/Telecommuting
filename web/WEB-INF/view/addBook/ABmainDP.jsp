<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ABMainDP.css">

</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp" />
	<div class="ABmainDP_frame">

		<div class="ABmainDP_frame_left">
			<div class="ABmainDP_frame_left_title">연명부</div>
					<div class="ABmainDP_frame_left_content">

			<c:forEach var="ob" items="${dep_list}">
				<div class="ABmainDP_frame_left_content_div">
					<a href="/Tel/addBookList.do?didx=${ob.d_Idx}&midx=${member.m_idx}">
						${ob.d_Name} </a>
				</div>
			</c:forEach>
			</div>


		</div>


		<div class="ABmainDP_frame_right">
			<c:import url="/WEB-INF/view/side.jsp" />

		</div>

	</div>



	<!-- 로그인한 사원의 level 에 따라서 접근권한 부여 -->





</body>
</html>