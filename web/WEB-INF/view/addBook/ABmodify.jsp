<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/ABmodify.css">

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
	
	<c:import url="/WEB-INF/view/menu.jsp"/>
	
	<div class="ABmodify_frame">
	
	
		<div class="ABdetail_frame_main">
	<form action="ABupdate.do" method="post" class="form">
		<div>사원 번호 </div><input class="input_text" name="midx" type="text" value="${member.m_idx}" readonly="readonly" ><br>
		<div>이름  </div><input class="input_text" name="name" type="text" value="${member.m_name}" ><br>
		<div>아이디  </div><input class="input_text" name="id" type="text" value="${member.m_id}" ><br>
		<div>연락처  </div><input class="input_text" name="phone" type="text" value="${member.m_phone}" ><br>
		<div>비상연락처  </div><input class="input_text" name="subphone" type="text" value="${member.m_subphone}" ><br>
		<div>이메일  </div><input class="input_text" name="email" type="text" value="${member.m_email}" ><br>
		<div>주소  </div><input class="input_text" name="add" id="add" type="text" value="${member.m_add}">
		<input type="button" value="검색" onclick="postFunction()" class="search_btn"><br>
		<div>입사일  </div><input class="input_text" name="empdate" type="text" value="${member.m_empdate}" ><br>
		<div>부서번호  </div><input class="input_text" name="didx" type="text" value="${member.d_idx}" ><br>
		<div>권한접근Lv  </div><input class="input_text" name="level" type="text" value="${member.m_level}" ><br>
		<div class="btn_bar">  <!-- 수정버튼 안됩니다  -->
		<input type="submit" value="수정">
		<input type="button" value="목록으로" onclick="location.href='/Tel/addBookList.do?midx=${midx}&didx=${didx}'">
		</div>
	</form>
	</div>
	</div>
	
	
</body>
</html>