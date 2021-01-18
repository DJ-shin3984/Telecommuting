<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
수정 페이지

<div>
	<form action="updateBoard.do" method="post">
	<input type="hidden" value="${bIdx}" name="bIdx">
	<input type="hidden" value="${pg}" name="pg">
	제목 : <input type="text" value="${bTitle}" name="bTitle"><br>
	내용<br>
	<textarea rows="" cols="" name="bContent">${bContent}</textarea>
	<button type="submit">수정완료</button>
	</form>

</div>
</body>
</html>