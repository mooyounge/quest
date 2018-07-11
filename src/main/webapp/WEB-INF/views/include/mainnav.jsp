<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header -->
<nav class="left">
	<a href="#menu"><span>Menu</span></a>
</nav>
<a href="/" class="logo"><img src="/images/Quest.png" alt=""
	style="height: 70px;" /></a>
<nav class="right">
	<c:choose>
		<c:when test="${sessionScope.user == null}">
			<a href="/login" class="button alt"><img src="/images/login.png"
				alt="" style="height: 40px;" /></a>
		</c:when>
		<c:otherwise>
			<a href="/logout" class="button alt"><img src="/images/logout.png"
				alt="" style="height: 40px;" /></a>
		</c:otherwise>
	</c:choose>
</nav>


<!-- Menu -->
<nav id="menu">
	<ul class="links">
		<li><a href="/">Main</a></li>
		<li><a href="gameShop">GameShop</a></li>
		<li><a href="/community">Community</a></li>
		<li><a href="streaming">Streaming</a></li>
		<li><a href="gameReviews">Game Reviews</a></li>
		<li><a href="Support">Support</a></li>
	</ul>
	<ul class="actions vertical">
		<li><c:choose>
		<c:when test="${user == null}">
			<a href="/login" class="button alt"><img src="/images/login.png"
				alt="" style="height: 40px;" /></a>
		</c:when>
		<c:otherwise>
			<a href="/logout" class="button alt"><img src="/images/logout.png"
				alt="" style="height: 40px;" /></a>
		</c:otherwise>
	</c:choose></li>
	</ul>
</nav>