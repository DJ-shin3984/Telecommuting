<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
 a:link { color: #000000; text-decoration: none;}
 a:visited { color: #000000; text-decoration: none;}
 a:hover { color: #000000; text-decoration: none;}
</style>

<link rel="stylesheet" type="text/css" href="css/menu.css">
</head>
<body>
	<div class="menu_bar">
		<div class="menu_bar_btn"><a href="/Tel/DMWWmainDP.do?midx=${midx}&didx=${didx}">부서별 월/주 업무</a></div>
		<div class="menu_bar_btn"><a href="/Tel/AttmainDP.do">근태</a></div>
		<div class="menu_bar_btn"><a href="/Tel/CFmainDP.do?midx=${midx}">회의록</a></div>
		<div class="menu_bar_btn"><a href="/Tel/readBoardList.do?&midx=${midx}&didx=${didx}&pg=1">게시판</a></div>
		<div class="menu_bar_btn"><a href="/Tel/addMainDP.do?midx=${midx}">연명부</a></div>
		
		<div class="menu_bar_btn"><a href="/Tel/logout.do">로그아웃</a></div>
<!-- 		<div><a href="https://kauth.kakao.com/oauth/logout? -->
<!-- 		client_id=dd12c43fae150aab7ef90981f5b597ea& -->
<!-- 			logout_redirect_uri=http://localhost:8080/Tel/kakaologout.do"> -->
<!-- 		카카오 로그아웃</a></div> -->
	</div>
