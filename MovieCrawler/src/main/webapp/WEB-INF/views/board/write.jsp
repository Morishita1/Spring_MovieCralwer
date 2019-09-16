<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="${path}/resources/css/view.css?ver=201909100120">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/include-header.jsp"%>
	<div class="body-1">
		<div class="bla"></div>

		<h3>커뮤니티 게시판</h3>
		<form action="" method="POST" id="frm_content">
		<table>
			<tr>
				<th class="th-1">제목</th>
				<td colspan=3><input name="title" class="title-input"></td>
			</tr>
			<tr>
				<th class="th-1">작성자</th>
				<td>${sessionScope.name}</td>
			</tr>
			<tr>
				<td class="content" colspan=4>
				<textarea name="content" id="content" class="input-re"></textarea>
				<script type="text/javascript"
				src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
				charset="utf-8"></script>
			<script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator
						.createInIFrame({
							oAppRef : oEditors,
							elPlaceHolder : "content",
							sSkinURI : "${path}/resources/smarteditor/SmartEditor2Skin.html",
							fCreator : "createSEditor2",
							htParams : {
								fOnBeforeUnload : function() {
								}
							}
						});
			</script>
				</td>
			</tr>
		</table>
		</form>
		<div class="button-tas">
			<span class="error">글을 입력해 주세요</span>
			<button type="button" class="button-btn-in">저장</button>
		</div>
	</div>
</body>
<script type="text/javascript">
 $(function() {
	$(".button-btn-in").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		var content = $("#content").val();
		var text = content.replace(/[<][^>]*[>]/gi,"");
		if(text == null || text == "") {
			$(".error").css("display","inline");
			$("#content").focus();
			return false;
		} else {
			$.ajax({
				url: "${path}/board/write",
				type: "POST",
				data: $("#frm_content").serialize(),
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success: function() {
					location.href="${path}/board/list"
					$("#content").val("");
				},
				error: function() {
					alert("System Error!!!")
				}
			})
		}
	})
})

</script>
</html>