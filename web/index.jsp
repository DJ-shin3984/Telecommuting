<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
	<div class="frame_logobar">
		<div class="logo_title">Telecommuting</div>
	</div>
	<div class="frame_login">
		<div class="frame_login_left">
			<form action="checklogin.do" method="post" class="frame_login_form">
			<div class="frame_login_left_title">Telecommuting</div>
			<div class="frame_login_left_content">Telecommuting과 함께라면 어렵지 않습니다.<br>지금 시작하세요</div>
				<input id="inputId" type="text" name="id" placeholder="ID" class="input_bar"><br>
				<input id="inputPw" type="password" name="pw" placeholder="PASSWORD" class="input_bar"><br>
				<div class="login_btn_bar">
					<input type="submit" value="로그인" class="btn"> 
					<input type="button"value="취소" class="btn">
					<input type="button"value="회원가입" onclick="location.href='/Tel/jojnK.do';" class="btn">
				</div>
			</form>
		</div>
		<div class="frame_login_right">
			<img src="" id="slide_img" >
		</div>
	</div>
	
</body>

<script>
	var obTimeOut; // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨

	var ObjectArray = new Array();

	ObjectArray[0] = "ad/ad.jpg";

	ObjectArray[1] = "ad/ad2.jpg";

	ObjectArray[2] = "ad/ad3.jpg";

	var nObjectCnt = 0;

	function ShowDefaultRotate() // 스스로 자신을 호출하는 재귀함수 (Recursive Function)

	{

		nObjectCnt++;
		if (nObjectCnt == ObjectArray.length) {
			nObjectCnt = 0;
		}

		if (nObjectCnt < ObjectArray.length) // 배열의 갯수 이내일때만 실행

		{
			document.getElementById("slide_img").src = ObjectArray[nObjectCnt];
			obTimeOut = setTimeout("ShowDefaultRotate()", 3000);

		}

		else

		{
			clearTimeout(obTimeOut); // 배열의 갯수만큼 반복하여 변환시킨 후에는 Timeout 을 중지시킨다 

		}

	}

	function startAnimation() {
		obTimeOut = window.setTimeout(ShowDefaultRotate, 0); // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
	}

	window.onload = startAnimation; // 윈도우 로드시 이미지 변환함수 실행
</script>
</html>












