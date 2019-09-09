<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090305">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=20190904">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/view.css?ver=20190909">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>

	<div class="body-1">
		<div class="bla"></div>

		<h3>커뮤니티 게시판</h3>
		<table>
			<tr>
				<th class="th-1">제목</th>
				<td colspan=3>${one.title}</td>
			</tr>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd"
				var="regdate" />
			<tr>
				<th>작성일</th>
				<td>${regdate}</td>
				<th class="th-1">작성자</th>
				<td>${one.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td></td>
				<th>조회수</th>
				<td>${one.viewcnt}</td>
			</tr>
			<tr>
				<td class="content" colspan=4>${one.content}</td>
			</tr>

		</table>
		<div>
			<button>게시판 목록</button>
			<button class="button-de">삭제</button>
			<button class="button-up">수정</button>
		</div>
	</div>
	<div id="reply_wrap">
		<div id="commentList">
			<div>등록된 댓글이 없습니다</div>
			<div>
				<table>
					<tr>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
				</table>
			</div>
			<div>
				<a>로그인하시면 댓글을 등록할수 있습니다</a>
			</div>
			<div>
				<table>
					<tr>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
				</table>
				<input>
				<div>
				<button>등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {

		if ("${one.writer}" == "${sessionScope.name}") {
			$(".button-de").css('display', 'inline');
			$(".button-up").css('display', 'inline');
		}
	});
</script>
</html>