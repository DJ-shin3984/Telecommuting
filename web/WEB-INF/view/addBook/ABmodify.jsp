<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 도로명 주소 -->
	<script>
		function postFunction() {
		    new daum.Postcode({
		        oncomplete: function(data) {  
		            var roadAddr = data.roadAddress;
		            document.getElementById("add").value = roadAddr;
		        }
		    }).open();
		}
	</script>

	<form action="ABupdate.do" method="post">
		<span>사원 번호:</span><input name="midx" type="text" value="${member.m_idx}" readonly="readonly" ><br>
		<span>이름: </span><input name="name" type="text" value="${member.m_name}" ><br>
		<span>아이디: </span><input name="id" type="text" value="${member.m_id}" ><br>
		<span>비밀번호: </span><input name="pw" type="text" value="${member.m_pw}" ><br>
		<span>연락처: </span><input name="phone" type="text" value="${member.m_phone}" ><br>
		<span>비상연락처: </span><input name="subphone" type="text" value="${member.m_subphone}" ><br>
		<span>이메일: </span><input name="email" type="text" value="${member.m_email}" ><br>
		<span>주소: </span><input name="add" id="add" type="text" value="${member.m_add}"><input type="button" value="검색" onclick="postFunction()"><br>
		<span>입사일: </span><input name="empdate" type="text" value="${member.m_empdate}" ><br>
		<span>부서번호: </span><input name="didx" type="text" value="${member.d_idx}" ><br>
		<span>권한접근Lv: </span><input name="level" type="text" value="${member.m_level}" ><br>
		<input type="submit" value="수정">
		<input type="button" value="목록으로" onclick="location.href='/Tel/addBookList.do?midx=${midx}&didx=${didx}'">
	</form>
</body>
</html>