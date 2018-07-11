<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menuleft {
	width: 150px;
	height: 70px;
}

.menuleft>ul {
	width: 150px;
	height: 60px;
}

.menuleft>ul>li {
	display: inline-block;
	background: #787878;
	width: 100px;
	border-width: 1px;
	border-style: solid;
	border-color: #606060;
}

.menuleft>ul>li>a {
	color: white;
	display: block;
}
</style>

<div class="menuleft col-sm-2">
	<ul>
		<li><a href="/community?<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if>">전체게시판</a></li>
		<li><a href="/community?name=free<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if>">자유게시판</a></li>
		
		<li><a href="/community?name=info<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if>">정보게시판</a></li>
	</ul>
</div>