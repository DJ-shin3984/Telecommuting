<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/menu.css">
 -->
<link rel="stylesheet" type="text/css" href="css/DMWWmainDP.css">

</head>
<body>
	<c:import url="/WEB-INF/view/menu.jsp" />


	<!-- 로그인한 사원의 level 에 따라서 접근권한 부여 -->
	<div class="DMWWmain_frame">
		<div class="DMWWmain_frame_left">
			<c:choose>
				<c:when test="${member.m_level==0 || member.m_level==1}">
					<div class="DMWWmain_frame_left_title">부서별 월 주간 업무</div>
					<div class="DMWWmain_frame_left_content">
					<c:forEach var="ob" items="${dep_list}">
						<div class="DMWWmain_frame_left_content_div">
							<a href="/Tel/DMWWlist.do?didx=${ob.d_Idx}&midx=${member.m_idx}">
								부서번호:${ob.d_Idx} 부서명:${ob.d_Name} 부서연락처:${ob.d_Phone}</a>
						</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test="${member.m_level==2 || member.m_level==3}">
					<h1>권한접근이 없습니다.</h1>
				</c:when>
			</c:choose>
		</div>


		<div class="DMWWmain_frame_right">
			<c:import url="/WEB-INF/view/side.jsp" />

		</div>
	</div>


</body>
</html>