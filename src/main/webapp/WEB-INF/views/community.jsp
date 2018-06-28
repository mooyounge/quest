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
.menubar li {
	display: inline-block;
	width: 16%;
	background: gray;
}

.menubar li ul {
	height: 300px;
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

.menubar li ul li {
	width: 200px;
	display: block;
	background: green;
}

.menubar li a {
	color: black;
}
.menuleft li{
	display: inline-block;
}
</style>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="index.html" class="logo">QUEST</a>
		<nav class="right">
			<a href="#" class="button alt">Log in</a>
		</nav>
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Main</a></li>
			<li><a href="gameShop.html">GameShop</a></li>
			<li style="background-color: black;"><a href="community.html">Community</a></li>
			<li><a href="streaming.html">Streaming</a></li>
			<li><a href="gameReviews.html">Game Reviews</a></li>
			<li><a href="Support.html">Support</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>

	<div class="menubar">
		<ul>
			<li><a href="#">FPS</a>
				<ul>
					<li><a href="#">서든어택</a></li>
					<li><a href="#">레인보우식스 시즈</a></li>
					<li><a href="#">배틀그라운드</a></li>
					<li><a href="#">디비전</a></li>
				</ul></li>
			<li><a href="#" id="current">RPG</a>
				<ul>
					<li><a href="#">검은사막</a></li>
					<li><a href="#">테라</a></li>
					<li><a href="#">리니지</a></li>
					<li><a href="#">몰라</a></li>
				</ul></li>
			<li><a href="#">AOS</a>
				<ul>
					<li><a href="#">롤</a></li>
					<li><a href="#">도타</a></li>
					<li><a href="#">ㅁㄴㅇ</a></li>
					<li><a href="#">ㅇㄴㅁ</a></li>
				</ul></li>
			<li><a href="#">리듬게임</a>
				<ul>
					<li><a href="#">디제이맥스</a></li>
					<li><a href="#">ㄴㅁㅇㅈㅂㄷ</a></li>
					<li><a href="#">ㅁㄴㅇㅁㄴㅇ</a></li>
					<li><a href="#">ㅎㄷㅁㅇㄷㅈ</a></li>
				</ul></li>
			<li><a href="#">인디게임</a>
				<ul>
					<li><a href="#">ㄴㅇㅁㄴㅇ</a></li>
					<li><a href="#">ㅇㄴㅁㅇㅁ</a></li>
					<li><a href="#">ㅁㄴㅇㅁㄴ</a></li>
					<li><a href="#">ㄹㅇㄴㅁㅈ</a></li>
				</ul></li>
		</ul>
	</div>

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
		<div class="inner">
			<h2>Get In Touch</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="#">(000)
						000-0000</a></li>
				<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
				<li><span class="icon fa-map-marker"></span> 123 Somewhere
					Road, Nashville, TN 00000</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
			Images <a href="https://unsplash.com">Unsplash</a>.
		</div>
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