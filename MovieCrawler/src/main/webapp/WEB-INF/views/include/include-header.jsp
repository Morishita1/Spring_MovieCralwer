<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://kit.fontawesome.com/8b002b7edc.js"></script>

<button id="topBtn" class="sideBtn"><i class="fas fa-arrow-up"></i></button>
	<nav class="main">
		<ul class="main-menu">
			<li><a href="${rootPath}/">홈</a></li>
			<li><a href="${rootPath}/memo">게시판</a></li>

			<c:if test="${empty USER}">
				<li><a href="${rootPath}/member/login">로그인</a></li>
				<li><a href="${rootPath}/member/join">회원가입</a></li>
			</c:if>

			<c:if test="${!empty USER}">
				<li><a href="${rootPath}/member/logout">${USER.m_email}</a></li>
			</c:if>
		</ul>
	</nav>
