<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<jsp:include page="include/headercss.jsp"/>
</head>
<style>
.center{
	text-align: center;
}
</style>
<body>
	<header id="header" style="height:84px;">
		<jsp:include page="include/mainnav.jsp"/>
	</header>
	
    <div class="container">
      <div class="row">
        <div class="page-header">
        </div>
        <div class="col-sm-offset-4 col-md-3">
          <div class="login-box well">
        <form:form modelAttribute="user" method="post" action="/login">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">아이디</label>
                <form:input name="id" path="id" value='' id="id" placeholder="User Id" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <form:input path="password" name="password" id="password" placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
            	<form:errors path="id"></form:errors>
                <form:button type="submit" class="btn btn-success btn-login-submit btn-block m-t-md">Login</form:button>
            </div>
            <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
            <hr />
            <div class="form-group">
                <a href="/signup" class="btn btn-default btn-block m-t-md">회원가입</a>
            </div>
        </form:form>
          </div>
        </div>
      </div>
    </div>
 
 	<footer id="footer">
		<jsp:include page="include/footer.jsp"/>
	</footer>
	

	
<!-- script libary -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>