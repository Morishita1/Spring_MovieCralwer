<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<nav>
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
