<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="include/headercss.jsp" />
<title>Quest</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<header id="header" style="height: 84px;">
		<jsp:include page="include/mainnav.jsp" />
	</header>
	<article class="container">
		<div class="page-header">
			<h1>회원가입</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form method="post" action="/signup" id="signupForm">
				<div class="form-group">
					<label for="username">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="id" name="id" onkeypress="dctrue=false"
							placeholder="아이디"><span class="input-group-btn">
							<button class="btn btn-success" type="button" onclick="dualcheck();">
								중복 체크<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="InputPassword1">비밀번호</label> <input type="password" name="password"
						class="form-control" id="InputPassword1" placeholder="비밀번호">
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
					<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="nicName">닉네임</label> <input type="text" name="nicname"
						class="form-control" id="nicname" placeholder="닉네임을 입력해 주세요">
				</div>
				
				<!-- <div class="form-group">
					<label for="email">이메일 인증</label>
					<div class="input-group">
						<input type="email" class="form-control" id="email"
							placeholder="이메일을 입력해 주세요"> <span class="input-group-btn">
							<button class="btn btn-success">
								인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
				
				<div class="form-group">
					<label for="sendnumber">인증번호 입력</label>
					<div class="input-group">
						<input type="text" class="form-control" id="sendnumber"
							placeholder="인증번호"> <span class="input-group-btn">
							<button class="btn btn-success">
								인증번호 확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
				</div> -->
				
				<!-- <div class="form-group">
					<label>약관 동의</label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active"> <span
							class="fa fa-check"></span> <input id="agree" type="checkbox"
							autocomplete="off" checked>
						</label> <a href="#">이용약관</a>에 동의합니다.
					</div>
				</div> -->
				
				<div class="form-group text-center">
					<button type="button" class="btn btn-info" onclick="allCheck()">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" class="btn btn-warning" onclick="location.href='/'">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>
	<footer id="footer">
		<jsp:include page="include/footer.jsp" />
	</footer>
	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		var dctrue = false;
		function dualcheck(){
			var id = $("#id").val();
			$.ajax({
				url:"/signup/dctrue",
				type:"post",
				data:{"id":id},
				success:function(data){
					if(data == "true"){
						alert("중복되지 않은 이름입니다");
						dctrue = true;
					}
					if(data == "false"){
						alert("중복되는 이름입니다");
					}
				}
			});
		}
	
		function allCheck() {
			var ipReg = /^[A-Za-z0-9]{4,15}$/;
			var ipReg2 = /^[A-Za-z0-9ㄱ-힣]{2,30}$/;
			var nicN = $("#nicName").val();
			var id = $("#username").val();
			var pwd1 = $("#InputPassword1").val();
			var pwd2 = $("#InputPassword2").val();
			if (id == "") {
				alert("아이디를 입력해 주세요");
				$("#username").focus();
			} else if (!ipReg.test(id)) {
				alert("아이디는 영문 대소문자와 숫자만 사용 가능하며 4~15글자여야 합니다");
				$("#username").focus();
			} else if (pwd1 != pwd2) {
				alert("비밀번호와 비밀번호 확인이 다릅니다.");
				$("#InputPassword1").focus();
			} else if (!ipReg.test(pwd1)) {
				alert("비밀번호는 영문 대소문자와 숫자만 사용 가능하며 4~15글자여야 합니다");
				console.log(pwd1)
				$("#InputPassword1").focus();
			} else if (nicN == "") {
				alert("닉네임을 입력해 주세요");
				$("#nicName").focus();
			} else if (!ipReg2.test(nicN)) {
				alert("닉네임은 한글,영대소문자 ,숫자만 가능하며 2~30글자여야 합니다.");
				$("#nicName").focus();
			} else if(!dctrue){
				alert("아이디 중복체크를 해주세요");
			} else {
				//회원가입 성공
				$("#signupForm").submit();
			}
		};
	</script>
</body>
</html>