<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../include/headercss.jsp" />
<title>Quest</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<header id="header" style="height: 84px;">
		<jsp:include page="../include/mainnav.jsp" />
	</header>
	<jsp:include page="include/vodmainnav.jsp" />
	<div class="col-sm-offset-1">
		<br />
		<a href="/vod/in"><img src="/video/images/DyingLight.png" alt="" style="height: 120px;" /></a>
		<br />
		<br />
	</div>
	<!-- for 문으로 있는 영상들 불러오기 -->
	<footer id="footer">
		<jsp:include page="../include/footer.jsp" />
	</footer>
	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>