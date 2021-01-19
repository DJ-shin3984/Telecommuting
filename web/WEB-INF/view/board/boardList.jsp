<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/boardList.css">

</head>
<body>

<!--작성자 정보 m_Name 이 넘어오지 않는거 같습니다 . 확인부탁드려요  -->


	<c:import url="/WEB-INF/view/menu.jsp" />

	<div class="boardList_frame">
		<div class="boardList_frame_left">
			<div class="boardList_frame_left_title">게시판</div>
			<div class="boardList_frame_left_content">
			<div class="boardList_frame_left_content_bar"><span class="idx">게시물번호</span><span class="title">제목</span><span class="date">작성날짜</span></div>
			
				<c:if test="${!empty list}">

					<c:forEach items="${list}" var="ob">
						<div class="boardList_frame_left_content_oneline">
						<a href="readBoard.do?bIdx=${ob.b_Idx}&midx=${midx}&didx=${didx}&pg=${pg}">
							<span class="idx">${ob.b_Idx}</span> 
							<span class="title">${ob.b_Title}</span>
							<span class="date">${ob.b_Date}</span><%--  <span class="name">${ob.m_Name}</span> --%>
							</a>
						</div>

					</c:forEach>
				</c:if>

			</div>
			
			<div class="page_number">${paging.getPagingHTML()}</div>
			<button class="boardList_btn"
<%-- 				onclick="location.href='createBoardePg.do?midx=${midx}&didx=${didx}'">새로운 --%>
				onclick="location.href='createBoardePg.do?pg=${pg}'">새로운
				글 작성</button>
		</div>
		<div class="boardList_frame_right">
			<c:import url="/WEB-INF/view/side.jsp" />


		</div>




	</div>
</body>
</html>