<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body><!-- 일반적인 방법으로 들어올 수 없게 숨겨야 함 -->
	<h1>admin page</h1>
	<form action="/community/admin/gameinsert" method="post">
	<select id="genre" name="genre"
		style="display: inline-block; width: 150px; height: 30px;">
		<option value="FPS" selected="selected">FPS</option>
		<option value="RPG">RPG</option>
		<option value="AOS">AOS</option>
		<option value="rhythm">리듬게임</option>
		<option value="indie">인디게임</option>
	</select>
	<input type="text" id="game_name" name="game_name"
		style="width: 200px; height: 30px; display: inline-block;"
		value="" placeholder="게임명" />
	<input type="text" id="game_abb" name="game_abb"
	style="width: 200px; height: 30px; display: inline-block;"
	value="" placeholder="game_abb" />
	<button class="btn btn-success writebtn" type="submit"
		style="width: 80px; height: 30px; display: inline-block; margin-left: 10px;">등록
	</button>
	</form>
	<!-- 기본적으로 등록시 전체,자유,정보게시판은 추가 -->
	<br />
	<hr />
	<h2>게시판 추가</h2>
	<h2>일단 이 아래는 나중에</h2>
	<select id="search_option"
		style="display: inline-block; width: 150px; height: 30px;">
		<option value="FPS" selected="selected">FPS</option>
		<option value="RPG">RPG</option>
		<option value="AOS">AOS</option>
		<option value="rhythm">리듬게임</option>
		<option value="indie">인디게임</option>
	</select>
	<input type="text" id="game"
		style="width: 200px; height: 30px; display: inline-block;"
		value="" placeholder="게임명" />
	<input type="text" id="game_abb"
	style="width: 200px; height: 30px; display: inline-block;"
	value="" placeholder="game_abb" />
	<button class="btn btn-success writebtn"
		onclick="#"
		style="width: 80px; height: 30px; display: inline-block; margin-left: 10px;">등록
	</button>
	
	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>