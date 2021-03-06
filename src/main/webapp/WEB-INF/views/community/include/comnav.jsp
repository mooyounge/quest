<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menubar li {
	
	display: inline-block;
	width: 16%;
	background: #606060;
}

.menubar li ul {
	width: 16%;
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
	width: 100%;
	display: block;
	background: #787878;
	border-width: 1px;
	border-style: solid;
	border-color: #606060;
}

.menubar {
	z-index:999;
	text-align: center;
	margin-top: 10px;
}

.menubar li a {
	color: white;
	display: block;
}
</style>

<div class="menubar col-sm-12">
	<ul>
		<li id="FPS"><a href="/community?genre=FPS">FPS</a>
			<ul>
				<c:forEach var="game" items="${map.gameList}">
					<c:if test="${game.genre=='FPS'}">
						<li><a href="/community?game_abb=${game.game_abb}">${game.game_name }</a></li>
					</c:if>
				</c:forEach>
			</ul></li>

		<li id="RPG"><a href="/community?genre=RPG">RPG</a>
			<ul>
				<c:forEach var="game" items="${map.gameList}">
					<c:if test="${game.genre=='RPG'}">
						<li><a href="/community?game_abb=${game.game_abb}">${game.game_name }</a></li>
					</c:if>
				</c:forEach>
			</ul></li>
		<li id="AOS"><a href="/community?genre=AOS">AOS</a>
			<ul>
				<c:forEach var="game" items="${map.gameList}">
					<c:if test="${game.genre=='AOS'}">
						<li><a href="/community?game_abb=${game.game_abb}">${game.game_name }</a></li>
					</c:if>
				</c:forEach>
			</ul></li>
		<li id="RHYTHM"><a href="/community?genre=rhythm">리듬게임</a>
			<ul>
				<c:forEach var="game" items="${map.gameList}">
					<c:if test="${game.genre=='rhythm'}">
						<li><a href="/community?game_abb=${game.game_abb}">${game.game_name }</a></li>
					</c:if>
				</c:forEach>
			</ul></li>
		<li id="INDIE"><a href="/community?genre=indie">인디게임</a>
			<ul>
				<c:forEach var="game" items="${map.gameList}">
					<c:if test="${game.genre=='indie'}">
						<li><a href="/community?game_abb=${game.game_abb}">${game.game_name }</a></li>
					</c:if>
				</c:forEach>
			</ul></li>
	</ul>
</div>