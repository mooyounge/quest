<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.pagination>li>a{
		background-color: #c6c6c6;
	}
</style>

<div class="text-center">
	<ul class="pagination">
		<li><a href="/community?page=${param.firstPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>" class="first">처음</a></li>
		<li><a href="/community?page=${param.prevPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>" class="prev">이전</a></li>
		<c:forEach var="i" begin="${param.startPageNo}"
			end="${param.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq param.pageNo}">
					<li><a href="/community?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>" class="choice" style="background-color: #9f9f9f;">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/community?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li><a href="/community?page=${param.nextPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>" class="next">다음</a></li>
		<li><a href="/community?page=${param.finalPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb != null}">&game_abb=${param.game_abb}</c:if>" class="last">마지막</a></li>
	</ul>
</div>
