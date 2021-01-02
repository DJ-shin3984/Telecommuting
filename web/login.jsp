<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function login() {

		function success(position) {
			const latitude = position.coords.latitude; //위도
			const longitude = position.coords.longitude; // 경도

			alert("asd" + latitude);
			
			var id = document.getElementById('inputId').value;
			var pw = document.getElementById('inputPw').value;
			
			var form = document.createElement("form");

	         form.setAttribute("charset", "UTF-8");
	         form.setAttribute("method", "Post");  //Post 방식
	         form.setAttribute("action", "checklogin.do"); //요청 보낼 주소
			
	         var hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "id");
	         hiddenField.setAttribute("value", id);
	         form.appendChild(hiddenField);
	         
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", "pw");
	         hiddenField.setAttribute("value", pw);
	         form.appendChild(hiddenField);
	         
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
</head>
<body>
	아이디:<input id="inputId" type="text" name="id"><br> 
	비밀번호:<input id="inputPw" type="password" name="pw"><br>
<!-- 	<input id="latitude" type="text"><br> -->
<!-- 	<input id="longitude" type="text"><br> -->
	<input type="button" value="로그인" onclick="login()">
	<input type="button" value="취&nbsp;&nbsp;소">
</body>
</html>












