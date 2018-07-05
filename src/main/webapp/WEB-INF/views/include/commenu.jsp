<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menuleft {
	width: 150px;
	height: 70px;
	display: inline-block;
}

.menuleft>ul {
	width: 150px;
	height: 650px;
}

.menuleft>ul>li {
	display: inline-block;
	background: #3ec5f0;
	width: 100px;
	border-width: 1px;
	border-style: solid;
	border-color: #25a2c3;
}

.menuleft>ul>li>a {
	color: white;
	display: block;
}
</style>

<div class="menuleft col-sm-2">
	<ul>
		<li><a href="">전체게시판</a></li>
		<li><a href="">자유게시판</a></li>
		<li><a href="">정보게시판</a></li>
	</ul>
</div>