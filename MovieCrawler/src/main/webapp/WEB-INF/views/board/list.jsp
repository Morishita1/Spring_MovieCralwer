<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090302">
	<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=2019090303">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=20190902">
<title>커뮤니티</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.page li{
		list-style: none;
		margin:0 10px;
	}
	.page li a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div class="body">
		<div class="bla"></div>
		<h1>커뮤니티</h1>

		<div class="table">
			<span><a href="${path}/board/list?sort_option=new">최신순</a></span>
			<span>&nbsp;</span>
			<span><a href="${path}/board/list?sort_option=view">조회순</a></span>
			<span>&nbsp;</span>
			<span><a href="${path}/board/list?sort_option=reply">댓글순</a></span>
		</div>
		<div class="input">
			<input>
			<button>검색</button>
		</div>
		<table>
			<tr>
				<td class="td-1">NO</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>댓글수</td>
				<td>첨부파일</td>
				<td>등록일자</td>
			</tr>
			<c:forEach items="${map.list}" var="bDTO">
			<tr>
				<td>${bDTO.bno}</td>
				<td>${bDTO.title}</td>
				<td>${bDTO.writer}</td>
				<td>${bDTO.viewcnt}</td>
				<td>${bDTO.replycnt}</td>
				<td><i class="fas fa-ban"></i></td>
				<td>${bDTO.regdate}</td>
			</tr>
		</c:forEach>

		</table>
		<div class="button">
			<ul class="page" style="display:flex;justify-content: center">
			<c:if test="${map.pager.curBlock > 1}">
		
			<li>
				<a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}"><i class="fas fa-angle-left"></i></a>
			</li>
				<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}">1</a></li>
      		<li>...</li>
			</c:if>
			<c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}" var="idx">
				<li <c:out value="{map.pager.curPage == idx ?
				'class=active':''}"/> >
				<a href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}">${idx}</a>
				</li>
      	
			</c:forEach>
			
			
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
			<li>...</li>
      		<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}">${map.pager.totPage}</a></li>
			<li>
				<a href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}"><i class="fas fa-angle-right"></i></a>
			</li>
			</c:if>
			</ul>
		</div>
		<div class="button-input">
		<button>게시글 등록</button>
		</div>
		
	</div>
	<script type="text/javascript">
		$(function() {
			var sort_option = "${map.sort_option}";
			
			if(sort_option == "new") {
				$('div.table > span:eq(0)').css('color','crimson').css('font-weight','bold');
			} else if(sort_option == "view") {
				$('div.table > span:eq(2)').css('color','crimson').css('font-weight','bold');
			} else if(sort_option == "reply") {
				$('div.table > span:eq(4)').css('color','crimson').css('font-weight','bold');
			}
		})
	</script>
</body>
</html>