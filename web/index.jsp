<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="asset/css/Index.css">

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		
		$(document).ready(function(){
			var IDOK=false;
			var PWOK=false;
			//비밀번호 키업 이벤트 (비밀번호 와 비밀번호확인 일치여부)
			$('[name="checkPW"]').keyup(function(){
				var inputPw = $('[name="inputPW"]').val();
				var checkPw = $('[name="checkPW"]').val();
				if(inputPw == checkPw){
				$('#resultPW').text("비밀번호가 일치합니다.");	
				$('#resultPW').css("color", "green");
				PWOK=true;
				}else{
				$('#resultPW').text("비밀번호가 일치하지 않습니다.");	
				$('#resultPW').css("color", "red");	
				PWOK=false;
				}
			});

			// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
			$("#user_id").blur(function() {
				var user_id = $('#user_id').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/idCheck.do?userId='+ user_id,
					type : 'get',
					dataType:'text',
					success : function(data) {
		 				console.log("1 = 중복o / 0 = 중복x : "+ data);							
						
						if (data == 1) {
								// 1 : 아이디가 중복되는 문구
								$("#resultID").text("사용중인 아이디입니다.");
								$("#resultID").css("color", "red");
								IDOK=false;
							} else {
								$("#resultID").text("사용 가능한 아이디입니다.");
								$("#resultID").css("color", "green");
								IDOK=true;
							} 
						}, error : function(data) {
							 console.log("실패");
						}
					});
				});
			
			//회원가입 클릭시 이벤트 (빈공란 체크후 DB에 insert 한다)
			$("#joinWriteForm").submit(function(){
				
				if ($('[name="inputName"]').val() == ""){
					alert('이름을 입력 하세요.')
					return false
				}else if($('[name="inputPhone"]').val() == ""){
					alert('전화번호를 입력 하세요.')
					return false
				}else if($('[name="user_id"]').val() == ""){
					alert('아이디를 입력 하세요.')
					return false
				}else if($('[name="inputPW"]').val() == ""){
					alert('비밀번호를 입력 하세요.')
					return false
				}else if($('[name="checkPW"]').val() == ""){
					alert('비밀번호 확인을 입력 하세요.')
					return false
				}else{
					if(IDOK==false){
						alert("아이디가 중복됩니다.")
						return false
					}else if(PWOK==false){
						alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
						return false
					}else{
						alert("ok")
					}
				}
			});
		});	
	</script>

</head>
	<body>
		<div class="contain">
			<div class="wrap">
				<div class="body">
					<form id="joinWriteForm" action="/insertJoin.do" method="POST">
						<table align="center">
							<tr>
							<td>아이디</td>
							<td><input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
							<span id="resultID"></span></td>
							</tr>
							<tr>
							<td>비밀번호</td>
							<td><input type="password" name="inputPW"></td>
							</tr>
							<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="checkPW"><span id="resultPW"></span></td>
							</tr>
							<tr>
							<td>이름</td>
							<td><input type="text" name="inputName"></td>
							</tr>
							<tr>
							<td>연락처</td>
							<td><input type="text" name="inputPhone"></td>
							</tr>
							<tr>
							<td colspan="2" style="text-align: center;"><input type="submit" value="회원가입"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>	
	</body>
</html>