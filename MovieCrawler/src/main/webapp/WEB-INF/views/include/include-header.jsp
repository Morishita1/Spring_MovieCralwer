<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#modal-box {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: none;
}

.modal-body {
	width: 500px;
	height: 600px;
	border: 2px solid blue;
	margin: 100px auto 0 auto;
	border-radius: 5px;
	background-color: #ccc;
}

.modal-content {
	width: 350px;
	margin: 0 auto;
}

.modal-header {
	background-color: blue;
	color: #fff;
	font-size: 30px;
	text-align: center;
	margin-bottom: 30px;
}

.modal-body input, .btn-login {
	width: 350px;
	height: 40px;
	margin: 15px auto;
}

.select {
	text-align: center
}

.err_msg {
	color: red;
}
.drop-down {
	display: block;
}

.dr-cn {
	display: none;
	position: absolute;
	background-color: green;
	min-width: 160px;
	z-index: 10;
}

.drop-down:hover div.dr-cn {
	display: block;
}
</style>
</head>
<script src="https://kit.fontawesome.com/8b002b7edc.js"></script>


<button id="topBtn" class="sideBtn">
	<i class="fas fa-arrow-up"></i>
</button>
<nav class="main">
	<ul class="main-menu">
		<li><a href="${path}/">MovieCrawler</a></li>
		<li><a href="${path}/board/list">커뮤니티</a></li>
		<c:choose>
			<c:when test="${empty sessionScope.name}">
				<li><a href="#" id="login" class="a-menu">로그인</a></li>
				<li><a href="#" id="join">회원가입</a></li>
			</c:when>

			<c:otherwise>
				<li><a class="a-menu">${name}님</a></li>
				<li><a href="#" id="logout_btn" class="a-menu">로그아웃</a></li>
				<li class="drop-down">
				<a class="op-btn" id="op-btn" >마이페이지</a>
				<div class="dr-cn">
					<a href="${path}/member/update">회원수정</a>
					<a href="${path}/member/delete">회원탈퇴</a>
				</div>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<div id="modal-box">
	<div class="modal-body">
		<div class="modal-header">
			로그인<span id="modal-close" style="float: right; cursor: pointer">&times;</span>
		</div>
		<div class="modal-content">
			<div>
				<input class="userid" type="text" placeholder="id">
			</div>
			<div>
				<input class="password" type="password" placeholder="password">
			</div>
			<div class="err_msg"></div>
			<div>
				<button class="btn-login">로그인</button>
			</div>
			<div class="select">
				<span>회원가입</span> <span>｜</span> <span>아이디찾기</span> <span>｜</span> <span>비밀번호찾기</span>
			</div>
		</div>
	</div>
</div>

<script>
var uri ='${uri}';
	$(function() {
		$("#login").click(function() {
			$("#modal-box").css('display', 'block')
		})
		$("#join").click(function() {
			location.href="${path}/member/write";
		})
		$("#modal-close").click(function() {
			$("#modal-box").css("display", "none")
			$(".err_msg_id").text("");
			$(".err_msg_pass").text("");
			$(".userid").val("");
			$(".password").val("");
		})
		$(document).ready(function() {
         $(".userid").keydown(function(key) {
            if (key.keyCode == 13) {
               $(".password").focus();
            }
         });
         $(".password").keydown(function(key) {
            if (key.keyCode == 13) {
               $(".btn-login").click();
            }
         });
      });
		$(".btn-login").click(function(){
         // 유효성체크:id,pw null값체크 및 공백 체크
         var id = $.trim($("input.userid").val())
         var pw = $.trim($("input.password").val())
         var regEmpty = /\s/g; //공백문자체크
         // null값체크
         if(id == '' || id.length == 0){
            $('.err_msg').text('아이디를 입력해주세요.').css('visibility','visible')
            return false;
         } else if(id.match(regEmpty)){
            $('.err_msg').text('공백없이 입력해주세요.').css('visibility','visible')
            return false;
         } else if(pw == '' || pw.length == 0){
            $('.err_msg').text('비밀번호를 입력해주세요.').css('visibility','visible')
            return false;
         } else if(pw.match(regEmpty)){
            $('.err_msg').text('공백없이 입력해주세요.').css('visibility','visible')
            return false;
         }
         
         $.ajax({
            url: '${path}/member/login',
            type:'POST',
            async: true,
            dataType: 'text',
            data: 'userid='+id+'&passwd='+pw,
            success:function(data){
               if(data == '1'){
            	   if(uri == "") {
            		   location.reload();   
            	   } else {
            		   location.href=uri;
					}
               } else if(data == '-1'){
                  $('input.userid').focus();
                  $('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다').css('visibility','visible');
               } else{
                  alert("Error")
               }
            },
            error:function(){
               alert("System Error")
            }
         })
         
      })
		
      $('#logout_btn').click(function() {
		$.ajax({
			url: "${path}/member/logout",
			type: "POST",
			async: true,
			success: function() {
				location.reload();
			},
			error:function() {
				alert("System Error");
			}
		})
	})
      
	})
</script>
