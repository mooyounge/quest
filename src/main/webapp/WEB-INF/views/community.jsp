<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.menuleft li{
	display: inline-block;
}
</style>
</head>
<body>

	<header id="header">
		<jsp:include page="include/mainnav.jsp"/>
	</header>

	<jsp:include page="include/comnav.jsp"/>

	<div class="container">
		<div class="menuleft">
			<ul>
				<li><a href="">정보게시판</a></li>
				<li><a href="">자유게시판</a></li>
			</ul>
		</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<!-- 여기에 포문돌리면됨 -->
				<tr>
					<td>165</td>
					<td>후하후하후하후하후ㅏ</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>
				<tr>
					<td>165</td>
					<td>후하후하후하후하후ㅏ2</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>
				<tr>
					<td>165</td>
					<td>후하후하후하후하후ㅏ3</td>
					<td>test</td>
					<td>test</td>
					<td>test</td>
				</tr>

			</tbody>
		</table>
		<hr />
		<div class="text-center">
			<ul class="pagination">
				<li><a href="">1</a></li>
				<li><a href="">2</a></li>
				<li><a href="">3</a></li>
				<li><a href="">4</a></li>
				<li><a href="">5</a></li>
			</ul>
		</div>
	</div>








	<footer id="footer">
		<jsp:include page="include/footer.jsp"/>
	</footer>
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
<!-- script libary -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>