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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
		$(document).ready(function(){
			var IDOK=false;
			var PWOK=false;
			//비밀번호 키업 이벤트 (비밀번호 와 비밀번호확인 일치여부)
			$('[name="checkPW"]').keyup(function(){
				var inputPw = $('[name="m_pw"]').val();
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
				
				if ($('[name="m_name"]').val() == ""){
					alert('이름을 입력 하세요.')
					return false
				}else if($('[name="m_id"]').val() == ""){
					alert('아이디를 입력 하세요.')
					return false
				}else if($('[name="m_pw"]').val() == ""){
					alert('비밀번호를 입력 하세요.')
					return false
				}else if($('[name="checkPW"]').val() == ""){
					alert('비밀번호 확인을 입력 하세요.')
					return false
				}else if($('[name="m_phone"]').val() == ""){
					alert('전화번호를 입력 하세요.')
					return false
				}else if($('[name="m_subphone"]').val() == ""){
					alert('비상 연락처를 입력 하세요.')
					return false
				}else if($('[name="m_email"]').val() == ""){
					alert('이메일을 입력 하세요.')
					return false
				}else if($('[name="m_add"]').val() == ""){
					alert('주소를 입력 하세요.')
					return false
				}else if($('[name="m_empdate"]').val() == ""){
					alert('입사일을 입력 하세요.')
					return false
				}else if($('[name="d_idx"]').val() == ""){
					alert('부서번호를 입력 하세요.')
					return false
				}else if($('[name="m_level"]').val() == ""){
					alert('권한 레벨을 입력 하세요.')
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

<!-- 도로명 주소 -->
	
	<script>
		function postFunction() {
			
		    new daum.Postcode({
		        oncomplete: function(data) {   // oncomplete 모든 데이터의 발행을 완료함을 알린다. 단 한번만 발생하고, 발생한 후에는 더이상 onNext가 발생하지 않는다.
		        	//즉 모든 데이터의 발행이 완료 되었을때 함수를 실행한다라는 소리
		        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            var roadAddr = data.roadAddress;  // 도로명 주소
// 		            alert(roadAddr);
		            document.getElementById("add").value = roadAddr;
		        }
		    }).open();
		}
	</script>

</head>
	<body>
		<div class="contain">
			<div class="wrap">
				<div class="body">
<!-- 					<form id="joinWriteForm" action="insertJoin.do" method="POST"> -->
					<form id="joinWriteForm" action="insertJoin.do" method="POST" enctype="multipart/form-data">
						<table align="center">
							
							<tr>
							<td>이름</td>
							<td><input type="text" class="form-control" id="user_name" name="m_name" value="${KPF.getProperties().getNickname()}">
							</tr>
							
							<tr>
							<td>아이디</td>
							<td><input type="text" class="form-control" id="user_id" name="m_id" placeholder="ID" required>
							<span id="resultID"></span></td>
							</tr>
							
							<tr>
							<td>비밀번호</td>
							<td><input type="password" name="m_pw"></td>
							</tr>
							
							<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="checkPW">
							<span id="resultPW"></span></td>
							</tr>
							
							<tr>
							<td>연락처</td>
							<td><input type="text" name="m_phone"></td>
							</tr>
							
							<tr>
							<td>비상연락처 </td>
							<td><input type="text" name="m_subphone"></td>
							</tr>
							
							<tr>
							<td>이메일 </td>
							<td><input type="text" name="m_email" value="${KPF.getKakao_account().getEmail()}"></td>
							</tr>
							
							<tr>
							<td>주소 </td>
							<td><input id="add" type="text" name="m_add"><input type="button" value="검색" onclick="postFunction()"></td>
							</tr>
							
							<tr>
							<td>입사일 </td>
							<td><input type="text" name="m_empdate"></td>
							</tr>
							
							<tr>
							<td>사진 </td>
							<td><input type="file" name="m_photo"></td>
							</tr>
							
							<tr>
							<td>부서번호(개발부:105)</td>
							<td><input type="text" name="d_idx"></td>
							</tr>
							
							<tr>
							<td>권한접근 레벨</td>
							<td><input type="text" name="m_level"></td>
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