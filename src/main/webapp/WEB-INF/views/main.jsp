<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quest</title>
<jsp:include page="include/headercss.jsp"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<header id="header" style="height:84px;">
		<jsp:include page="include/mainnav.jsp" />
	</header>
	<!-- 이정표 -->
	<section id="one" class="wrapper">
		<div class="inner flex flex-3">
			<div class="flex-item left">
				<div>
					<a href="gameShop.html"><h3>GameShop</h3></a>
					<p>
						Morbi in sem quis dui plalorem ipsum<br /> euismod in, pharetra
						sed ultricies.
					</p>
				</div>
				<div>
					<a href="/community"><h3>Community</h3></a>
					<p>
						Tristique yonve cursus jam nulla quam<br /> loreipsu gravida
						adipiscing lorem
					</p>
				</div>
			</div>
			<div class="flex-item image fit round">
				<img src="images/pic01.jpg" alt="" />
			</div>
			<div class="flex-item right">
				<div>
					<a href="/vod/main"><h3>Streaming</h3></a>
					<p>
						Sed adipiscing ornare risus. Morbi estes<br /> blandit sit et
						amet, sagittis magna.
					</p>
				</div>
				<div>
					<a href="gameReviews.html"><h3>Game Reviews</h3></a>
					<p>
						Pellentesque egestas sem. Suspendisse<br /> modo ullamcorper
						feugiat lorem.
					</p>
				</div>
			</div>
		</div>

		<!-- Banner -->
		<section id="banner">
			<div class="content">
				<h1>Ipsum sed lorem</h1>
				<p>
					Morbi in sem quis dui placerat ornare. Pellentesque odio nisi,
					euismod<br />sed arcu cras consecuat lorem ipsum dolor sit amet.
				</p>
				<ul class="actions">
					<li><a href="#one" class="button scrolly">Get Started</a></li>
				</ul>
			</div>
		</section>

		<!-- One -->

		<!-- Two -->
		<section id="two" class="wrapper style1 special">
			<div class="inner">
				<h2>Feugiat lorem</h2>
				<figure>
					<blockquote>
						"Morbi in sem quis dui placerat ornare. Pellentesque odio nisi,
						euismod in, pharetra<br /> magna etiam lorem ultricies in diam.
						Sed arcu cras consequat."
					</blockquote>
					<footer>
						<cite class="author">Jane Anderson</cite> <cite class="company">CEO,
							Untitled</cite>
					</footer>
				</figure>
			</div>
		</section>

		<!-- Three -->
		<section id="three" class="wrapper">
			<div class="inner flex flex-3">
				<div class="flex-item box">
					<div class="image fit">
						<img src="images/pic02.jpg" alt="" />
					</div>
					<div class="content">
						<h3>Consequat</h3>
						<p>Placerat ornare. Pellentesque od sed euismod in, pharetra
							ltricies edarcu cas consequat.</p>
					</div>
				</div>
				<div class="flex-item box">
					<div class="image fit">
						<img src="images/pic03.jpg" alt="" />
					</div>
					<div class="content">
						<h3>Adipiscing</h3>
						<p>Morbi in sem quis dui placerat Pellentesque odio nisi,
							euismod pharetra lorem ipsum.</p>
					</div>
				</div>
				<div class="flex-item box">
					<div class="image fit">
						<img src="images/pic04.jpg" alt="" />
					</div>
					<div class="content">
						<h3>Malesuada</h3>
						<p>Nam dui mi, tincidunt quis, accu an porttitor, facilisis
							luctus que metus vulputate sem magna.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer -->
		<footer id="footer">
			<jsp:include page="include/footer.jsp" />
		</footer>
		<!-- script libary -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>