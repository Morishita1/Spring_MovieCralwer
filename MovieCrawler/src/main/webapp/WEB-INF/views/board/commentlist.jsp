<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${replyList.size() > 0}">
			<div class="re-si">댓글 : ${replyList.size()}</div>
			<c:forEach items="${replyList}" var="replyview">
				<div id="reply-con" class="body-1" >
					<table>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<tr>
							<th>작성자</th>
							<td>${replyview.writer}</td>
							<th>작성일</th>
							<td>${replyview.regdate}</td>
						</tr>
						<tr>
							<td class="content" colspan=4>${replyview.content}</td>
						</tr>
					</table>
					<div class="button-btn-re-de">
						<button class="button-re-del" seq="${replyview.rno}">삭제</button>
					</div>
				</div>
			</c:forEach>

		</c:when>
		<c:otherwise>
			<div id="reply-no" class="commentre">등록된 댓글이 없습니다</div>
		</c:otherwise>
	</c:choose>
	<div id="reply-login" class="commentre">
		<a>로그인하시면 댓글을 등록할수 있습니다</a>
	</div>
	<div id="reply-input" class="body-1">
		<div class="re">
			<div class="re-le">${sessionScope.name}님</div>
			<div class="re-ri">${today}</div>
		</div>
		<input class="input-re" placeholder="댓글을 입력해 주세요">
		<div class="button-btn-re">
			<button>등록</button>
		</div>

	</div>
</body>
<script>
	$(function() {
		if ("${sessionScope.name}" != '') {
			$("#reply-login").css('display', 'none');
			$("#reply-input").css('display', 'block');
		}

		$("#reply-login").click(function() {

			$("#modal-box").css('display', 'block')
		})
	})
</script>
</html>