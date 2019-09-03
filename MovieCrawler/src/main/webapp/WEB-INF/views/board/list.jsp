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
	href="${path}/resources/css/common.css?ver=2019090302">
<title>커뮤니티</title>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div class="body">
		<div class="bla"></div>
		<h1>커뮤니티</h1>

		<div class="table">
			<span><a href="#">최신순</a></span>
			<span>&nbsp;</span>
			<span><a href="#">조회순</a></span>
			<span>&nbsp;</span>
			<span><a href="#">댓글순</a></span>
		</div>
		<div class="input">
			<input>
			<button>검색</button>
		</div>
		<table>
			<tr>
				<td>NO</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>댓글수</td>
				<td>첨부파일</td>
				<td>등록일자</td>
			</tr>
			<tr>
				<td>1</td>
				<td>aaaa</td>
				<td>qwe</td>
				<td>1214</td>
				<td>23</td>
				<td><i class="fas fa-ban"></i></td>
				<td>2019-01-01</td>
			</tr>
			<tr>
				<td>2</td>
				<td>bbb</td>
				<td>aasd</td>
				<td>2354</td>
				<td>65</td>
				<td><i class="fas fa-ban"></i></td>
				<td>2019-01-02</td>
			</tr>

		</table>
		<div class="button">
			<button>
				<i class="fas fa-angle-left"></i>
			</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>6</button>
			<button>7</button>
			<button>8</button>
			<button>9</button>
			<button>10</button>
			<button>
				<i class="fas fa-angle-right"></i>
			</button>
		</div>
		<div class="button-input">
		<button>게시글 등록</button>
		</div>
		
	</div>
</body>
</html>