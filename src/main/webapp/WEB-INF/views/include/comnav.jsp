<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.menubar {
	text-align: center;
}

.menubar li a {
	color: black;
}
</style>


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