<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="text-center">
	<ul class="pagination">
		<li><a href="/community?page=${param.firstPageNo}" class="first">처음</a></li>
		<li><a href="/community?page=${param.prevPageNo}" class="prev">이전</a></li>
		<c:forEach var="i" begin="${param.startPageNo}"
			end="${param.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq param.pageNo}">
					<li><a href="/community?page=${i}" class="choice">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/community?page=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li><a href="/community?page=${param.nextPageNo}" class="next">다음</a></li>
		<li><a href="/community?page=${param.finalPageNo}" class="last">마지막</a></li>
	</ul>
</div>
