<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function goTime() {

		function success(position) {
			const latitude = position.coords.latitude; //위도
			const longitude = position.coords.longitude; // 경도

			var form = document.createElement("form");

	         form.setAttribute("charset", "UTF-8");
	         form.setAttribute("method", "Post");  //Post 방식
	         form.setAttribute("action", "AttGoTime.do"); //요청 보낼 주소
			
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "longitude");
	         hiddenField.setAttribute("value", longitude);
	         form.appendChild(hiddenField);
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "latitude");
	         hiddenField.setAttribute("value", latitude);
	         form.appendChild(hiddenField);
	         
	         document.body.appendChild(form);
	         form.submit();
		}

		function error() {
			status.textContent = 'Unable to retrieve your location';
		}

		if (!navigator.geolocation) {
			status.textContent = 'Geolocation is not supported by your browser';
		} else {
			status.textContent = 'Locating…';
			navigator.geolocation.getCurrentPosition(success, error);
		}

	}
</script>
<script>
	function oofTime() {

		function success(position) {
			const latitude = position.coords.latitude; //위도
			const longitude = position.coords.longitude; // 경도

			var form = document.createElement("form");

	         form.setAttribute("charset", "UTF-8");
	         form.setAttribute("method", "Post");  //Post 방식
	         form.setAttribute("action", "AttOffTime.do"); //요청 보낼 주소
			
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "longitude");
	         hiddenField.setAttribute("value", longitude);
	         form.appendChild(hiddenField);
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "latitude");
	         hiddenField.setAttribute("value", latitude);
	         form.appendChild(hiddenField);
	         
	         document.body.appendChild(form);
	         form.submit();
		}

		function error() {
			status.textContent = 'Unable to retrieve your location';
		}

		if (!navigator.geolocation) {
			status.textContent = 'Geolocation is not supported by your browser';
		} else {
			status.textContent = 'Locating…';
			navigator.geolocation.getCurrentPosition(success, error);
		}

	}
</script>
	
	<!-- xxx님 출근시간: -->
	<div>
	<h3>${member.m_name}님</h3>
	<h5>출근시간: ${attDTO.a_goTime}</h5><br>
	</div>
	
	<!-- 부서업무 리스트 -->
	<c:if test="${!empty dwlistSessiom}">
		<c:forEach var="ob" items="${dwlistSessiom}">
			<div>
			부서번호 : ${ob.d_idx}
			부서업무번호 : ${ob.dw_idx} 
			부서업무제목 : ${ob.dw_title} 
			부서업무내용 : ${ob.dw_content}
			부서스케줄 : ${ob.dw_schedule}
			부서월업무 : ${ob.dw_monthwork}
			부서주업무 : ${ob.dw_weekwork}
			<input type="button" value="삭제" 
			onclick="location.href='/Tel/DWDelete.do?
			midx=${midx}&didx=${didx}&dw_idx=${ob.dw_idx}'">
			<input type="button" value="수정" 
			onclick="location.href='/Tel/DWModify.do?midx=${midx}&didx=${didx}&dw_idx=${ob.dw_idx}&dw_title=${ob.dw_title}&dw_content=${ob.dw_content}&dw_schedule=${ob.dw_schedule}&dw_monthwork=${ob.dw_monthwork}&dw_weekwork=${ob.dw_weekwork}'">
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 개인업무 리스트 -->
	<c:if test="${!empty iwlistSessiom}">
		<c:forEach var="ob" items="${iwlistSessiom}">
			<div>
			사원번호 : ${ob.m_idx}
			개인업무번호 : ${ob.iw_idx} 
			개인업무제목 : ${ob.iw_title} 
			개인업무내용 : ${ob.iw_content}
			<input type="button" value="삭제" 
			onclick="location.href='/Tel/IWDelete.do?midx=${midx}&didx=${didx}&iw_idx=${ob.iw_idx}'">
			<input type="button" value="수정" 
			onclick="location.href='/Tel/IWModify.do?midx=${midx}&didx=${didx}&iw_idx=${ob.iw_idx}&iw_title=${ob.iw_title}&iw_content=${ob.iw_content}'">
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 부서 스케줄 -->
	<c:if test="${!empty dwlistSessiom}">
		<c:forEach var="ob" items="${dwlistSessiom}">
			<div>
			부서번호 : ${ob.d_idx}
			부서스케줄 : ${ob.dw_schedule}
			<input type="button" value="수정"
			onclick="location.href='/Tel/DWDelete.do?midx=${midx}&didx=${didx}&dw_idx=${ob.dw_idx}'">
			</div>
		</c:forEach>
	</c:if>
	
	<input type="button" value="개인업무 추가" 
	onclick="location.href='/Tel/IWwriter.do?midx=${midx}&didx=${didx}'">
	<input type="button" value="부서업무 추가" 
	onclick="location.href='/Tel/DWwriter.do?midx=${midx}&didx=${didx}'">
	<br><input type="button" value="출근" onclick="goTime()">
	<br><input type="button" value="퇴근" onclick="oofTime()">
