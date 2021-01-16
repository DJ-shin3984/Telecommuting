<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	function sendLink() {
		var content = '출근 등록이 미등록 상태입니다. 담당 부서장님께 연락 부탁드립니다.'
		var time = parseInt(document.getElementById("time").value);
		Kakao.init('6b734786fe50f6d715a8cd516289e9b0')
		Kakao.Link.sendDefault({
			objectType : 'text',
			text : content,
			link : {
				mobileWebUrl : 'http://localhost:8080/Tel/index.jsp',
				webUrl : 'http://localhost:8080/Tel/index.jsp',
			},
		})
	}
</script>
<link rel="stylesheet" type="text/css" href="css/attMain.css">
</head>
<body>

	<c:import url="/WEB-INF/view/menu.jsp" />


	<div class="attMain_frame">

		<div class="attMain_frame_left">
		<div class="attMain_frame_left_title">
			근태
		</div>
		<div class="attMain_frame_left_content">
			<c:choose>
				<c:when test="${member.m_level==0 || member.m_level==1}">
					<c:if test="${!empty dm_list}">
						<c:forEach var="ob" items="${dm_list}" varStatus="status">
							<c:set var="TextValue" value="${ob.a_goTime}" />
							<%-- 					사이즈 : ${fn:length(TextValue) }<br> --%>
							<div id="attlist+${status.index}">${ob.m_name}:
								${fn:substring(TextValue,14,21) }</div>
							<br>
						</c:forEach>
					</c:if>
				</c:when>

			</c:choose>
		</div>	
		
		<div>
			<input id="time" type="button" value="근태 관리" onclick="sendLink()" class="attMain_btn">
		
		
		</div>
		</div>
		<div class="attMain_frame_right">
			<c:import url="/WEB-INF/view/side.jsp" />

		</div>

	</div>
</body>
</html>