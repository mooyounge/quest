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
		<video style="width:854px;height: 480px; margin-top: 20px;" autoplay controls
			poster="/video/images/DyingLight.png">
			<source src="/video/DyingLight.mp4" type="video/mp4">
			<source src="/video/DyingLight.ogg" type="video/ogg">
			지원하지 않는 브라우저입니다.
		</video>
	</div>



	<footer id="footer">
		<jsp:include page="../include/footer.jsp" />
	</footer>
	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>