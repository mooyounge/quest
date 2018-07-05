<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="/community?game_abb=${game.game_abb}
		 <c:if test="${param.option != null && param.text != null}">&option=${param.option}&text=${param.text}</c:if>
		 ">여기에 뭐가들어가야하냐</a>
		 
<!-- 검색 조건 -->
<c:if test="${param.option != null && param.text != null}">&option=${param.option}&text=${param.text}</c:if>

<!-- 게시판 조건 -->
<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if>
<!-- 게시판 조건 JQuery -->
<c:if test="${param.game_abb!=null}">+"&game_abb=${param.game_abb}"</c:if>
