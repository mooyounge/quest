<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<jsp:include page="include/headercss.jsp"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="include/mainnav.jsp"/>
		<article class="container">
        <div class="page-header">
          <h1>회원가입 </h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form">
            <div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" id="username" placeholder="아이디">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">비밀번호 확인</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="nicName">닉네임</label>
              <input type="text" class="form-control" id="nicName" placeholder="닉네임을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="email">이메일 인증</label>
              <div class="input-group">
                <input type="email" class="form-control" id="email" placeholder="이메일을 입력해 주세요">
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
              </div>
            </div>
            <div class="form-group">
              <label for="sendnumber">인증번호 입력</label>
              <div class="input-group">
                <input type="text" class="form-control" id="sendnumber" placeholder="인증번호">
                <span class="input-group-btn">
                  <button class="btn btn-success">인증번호 확인<i class="fa fa-edit spaceLeft"></i></button>
                </span>
              </div>
            </div>
            <div class="form-group">	
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>
      </article>
	
	<jsp:include page="include/footer.jsp"/>
<!-- script libary -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>