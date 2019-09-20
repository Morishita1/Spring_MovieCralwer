<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>


<c:choose>
	<c:when test="${one.userid == null}">
		<c:if test="${sessionScope.userid != null}">
	<script>
		alert("로그아웃 후 사용해주세요.");
		location.href="${path}/";
	</script>
</c:if>
	</c:when>
	<c:otherwise>
	<c:if test="${sessionScope.userid == null}">
	<script>
		alert("로그아웃 후 사용해주세요.");
		location.href="${path}/";
	</script>
</c:if>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090305">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=20190904">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
}

.join-main {
	width: 40%;
	height: 100%;
	margin: 0 auto;
}

input {
	width: 600px;
	height: 30px;
}

label {
	text-align: left;
	width: 104px;
	display: inline-block;
}

.input-join {
	width: 200px;
	height: 30px;
}

.input-URL {
	width: 500px;
	height: 30px;
}

.join-te {
	text-align: left;
	width: 700px;
}

.join-select {
	margin-top: 5px;
	width: 725px;
	height: 40px;
}

.join-ta {
	margin-top: 10px;
	text-align: center;
}
.join-addr-code {
	width: 100px;
}
.join-addr-button {
margin-top: 10px;
	width: 100px;
}
.join-addr-address {
margin-top: 10px;
	width: 300px;
}
.join-addr-detailAddress {
margin-top: 10px;
	width: 250px;
}
.errcheck {
display: none;

}
.err_check_msg {
display: none;
}

</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div class="bla"></div>
	<h1 id="join_title">회원가입</h1>
	<div class="join-main">
	<form method="POST" id="frm_mem">
		<div id="inputid-join" class="join-ta">
			<label>아이디</label> <input id="inputid" name="userid" placeholder="아이디를 입력해주세요">
			<div class="errcheck"><span>공백</span></div>
		</div>
		<div class="join-ta">
			<label>비밀번호</label> <input type="password"  name="passwd" id="inputpw" placeholder="비밀번호를 입력해주세요">
			<div class="errcheck"><span>공백</span></div>
		</div>
		<div class="join-ta">
			<label>비밀번호 확인</label> <input type="password" id="inputrpw" placeholder="비밀번호를 재확인해주세요">
			<div class="errcheck"><span>공백</span></div>
		</div>
		<div class="join-ta">
			<label>이름</label> <input id="inputname" name="name" placeholder="이름을 입력해주세요" value="${one.name}">
			<div class="errcheck"><span>공백</span></div>
		</div>

		<div class="join-ta">
		<input class="join-te" id="inputphone" name="phone" placeholder="핸드폰번호(-없이 입력하세요.)" value="${one.phone}">
		<div class="errcheck"><span>공백</span></div>
		</div>
		<div class="join-ta">
			<input id="email_id" class="input-join" placeholder="ID">@<input id="email_url" class="input-URL" placeholder="URL">
			<div class="errcheck"><span>공백</span></div>
		</div>
		<div class="join-ta">
			<select id="selmail" class="join-select">
				<option value="direct">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
			</select>

		</div>
		<div class="join-taa">
			<input class="join-addr-code addrbtn" name="zipcode" type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly" value="${one.zipcode}">
			<input class="join-addr-button" id="addr_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input class="join-addr-address addrbtn" name="addr1" type="text" id="sample6_address" placeholder="주소" readonly="readonly" value="${one.addr1}"><br>
			<input class="join-addr-detailAddress" name="addr2" type="text" id="sample6_detailAddress" placeholder="상세주소" value="${one.addr2}">
			<div class="errcheck"><span>공백</span></div>
		</div>
		
		<div class="err_check_msg"><span>공백</span></div>
		<input type="hidden" name="email" id="email">
		</form>
		<div class="join-ta">
			<button>취소</button>
			<button class="btn_agree">회원가입</button>
		</div>
	</div>
	<script type="text/javascript" src="${path}/resources/js/validation.js"></script>
	<script>
	$(function() {
		// 유효성 체크 flag값 (통과 여부)
		var check_id = false;
		var check_pw = false;
		var check_rpw = false;
		var check_name = false;
		var check_phone = false;
		var check_email = false;
		var check_post = false;
		var id = '${one.userid}';
		$(document).ready(function() {
			
			
			if(id != '') { // 회원 수정
				check_name = true;
				check_phone = true;
				check_email = true;
				check_post = true;
				email = '${one.email}';
				index = email.indexOf('@');
				emailid = email.substring(0,index);
				emailurl = email.substring(index+1);
				$('#email_id').val(emailid);
				$('#email_url').val(emailurl);
				$('#join_title').text('회원 수정');
				$('#inputid-join').remove();
				$('.btn_agree').text('수정하기');
				check_id = true;
				
			}
		})
		
		
		// id값 유효성 체크
		$("#inputid").keyup(function() {
			var memId = $.trim($(this).val());
			var checkResult = joinValidate.checkId(memId);
			if(checkResult.code != 0) { // 경고메시지 출력
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_id = false;
			return false;
			} else {
				// ajax로 ID 중복 체크
				if(ajaxCheck(memId)) {
					check_id = true;
					return true;
				}
			}
			check_id = false;
			return false;
		});
		// 이메일 selectBox 설정
		$("#selmail").change(function() {
			var url = $(this).val();
			if( url == "direct") {
				$('#email_url').val('');
				$('#email_url').removeAttr("readonly");
				$('#email_url').blur();
				$('#email_url').focus();
				
			} else {
				$('#email_url').val(url);
				$('#email_url').prop('readonly', true);
				$('#email_url').blur();
			}
		})
		
		$('.addrbtn').click(function() {
			var zipcode = $('.addrbtn').eq(0).val();
			var addr = $('.addrbtn').eq(1).val();
			if(zipcode == "" || addr == "") {
				$('#addr_btn').click();
			}
		})
		$('.btn_agree').click(function() {
			var email_id = $('#email_id').val();
			var email_url = $('#email_url').val();
			var email= email_id+"@"+email_url;
			$('#email').val(email);
			
			// 유효성 체크
			if(!check_id) {
				$('#inputid').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
				return false;
			} else if(!check_pw) {
				$('#inputpw').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}else if(!check_rpw) {
				$('#inputrpw').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}else if(!check_name) {
				$('#inputname').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}else if(!check_phone) {
				$('#inputphone').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}else if(!check_email) {
				$('#email_id').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}else if(!check_post) {
				$('#sample6_postcode').focus();
				$('.err_check_msg').text('필수정보를 입력해주세요').css('display', 'block').css('color','#FF3636');
			}
			if(id != '') {
				$('#frm_mem').action="${path}/member/update";
			} else {
				$('#frm_mem').action="${path}/member/write";
			}
			
			$('#frm_mem').submit();
		})
		// 비밀번호 유효성 체크
		$('#inputpw').keyup(function() {
			var memPw = $.trim($(this).val());
			var memRpw = $.trim($('#inputrpw').val());
			
			if(id != '') {
				if(ajaxPwCheck(id, memPw)) {
					$('#inputpw').next().text('현재 비밀번호 입니다').css('display', 'block').css('color','#FF3636');
					$("#inputrpw").next().text('');
					check_pw= false;
					return false;
				} else {
					$("#inputpw").next().text('');
				}
			}
			
			
			var checkResult = joinValidate.checkPw(memPw,memRpw);
			console.log(checkResult.code)
			if(checkResult.code == 4) {
				$("#inputrpw").next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_pw = false;
				return false;
			}
			if(checkResult.code != 0) { // 경고메시지 출력
					$('#inputpw').next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
			}  else {
					if((memRpw != "") || (memRpw.length != 0)) {
						$('#inputpw').next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
					} else {
						$('#inputpw').next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
					}
					check_pw = true;
					check_rpw = true;
					return true;
				}
			check_pw = false;
			check_rpw = false;
			return false;
		})
		// 비밀번호 확인 유효성 체크
		$("#inputrpw").keyup(function() {
			var memPw = $.trim($('#inputpw').val());
			var memRpw = $.trim($(this).val());
			var checkResult =joinValidate.checkRpw(memPw,memRpw);
			
			if(checkResult.code != 0) { // 경고메시지 출력
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
			
				check_rpw = false;
			return false;
			}	else {
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
				if($('#inputpw').next().text() == '현재 비밀번호 입니다') {
					$('#inputrpw').next().text('');
				}
				check_rpw = true;
				check_pw = true;
				return true;
				}
			check_rpw = false;
			check_pw = false;
			return false;
			})
			
		// 이름 유효성 체크
		$("#inputname").keyup(function() {
			var name =$.trim($(this).val());
			var checkResult =joinValidate.checkName(name);
			
			if(checkResult.code != 0) {
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_name = false;
				return false;
			} else {
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
				check_name = true;
				return true;
			}
			check_name = false;
			return false;
		})
		// 핸드폰 번호 유효성 체크
		$("#inputphone").keyup(function() {
			var phone =$.trim($(this).val());
			
			var checkResult =joinValidate.checkPhone(phone);
			if(checkResult.code != 0) {
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_phone = false;
				return false;
			} else {
				$(this).next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
				check_phone = true;
				return true;
			}
			check_phone = false;
			return false;
		})
		// email 유효성 체크
		$('#email_id').blur(function() {
			var email = $.trim($(this).val());
			var url = $.trim($('#email_url').val());
			var checkResult =joinValidate.checkEmail(email,url);
			if(checkResult.code != 0) {
				$("#email_url").next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_email = false;
				return false;
			} else {
				$("#email_url").next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
				check_email = true;
				return true;
			}
			check_email = false;
			return false;
		}) 
		$("#email_url").blur(function() {
			var email = $.trim($('#email_id').val());
			var url = $.trim($('#email_url').val());
			var checkResult =joinValidate.checkUrl(email,url);
			if(checkResult.code != 0) {
				$("#email_url").next().text(checkResult.desc).css('display', 'block').css('color','#FF3636');
				check_email = false;
				return false;
			} else {
				$("#email_url").next().text(checkResult.desc).css('display', 'block').css('color','#0000FF');
				check_email = true;
				return true;
			}
			check_email = false;
			return false;
		})
		$('#sample6_detailAddress').blur(function() {
			var dAddr = $.trim($(this).val());
			if(dAddr == "" || dAddr.length == 0) {
				$("#sample6_detailAddress").next().text('필수 정보입니다.').css('display', 'block').css('color','#FF3636');
				check_post = false;
			} else {
				$("#sample6_detailAddress").next().css('display', 'none');
				check_post = true;
			}
		})
	})
	
	
	
	
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
	
	
</body>
</html>