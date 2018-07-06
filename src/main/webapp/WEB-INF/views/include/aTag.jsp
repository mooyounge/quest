<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 조건 -->
<c:if test="${param.option != null && param.text != null}">&option=${param.option}&text=${param.text}</c:if>

<!-- 게시판 게임이름 조건 -->
<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if>
<!-- 게시판 조건 js -->
<c:if test="${param.game_abb!=null}">+"&game_abb=${param.game_abb}"</c:if>

<!-- 게시판 특성 조건  -->
<c:if test="${param.name!=null}">&name=${param.name}</c:if>
<!-- 게시판 특성 조건 js -->
<c:if test="${param.name!=null}">+"&name=${param.name}"</c:if>