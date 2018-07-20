<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.menubar2 {
	margin-bottom: 10px;
}

.menubar2 span {
	background: #c7c7c7;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}
</style>

<div class="menubar2 col-sm-12">
	<c:forEach var="game" items="${map.gameList}">
		<c:if test="${game.genre==param.genre}">
			<a href="/community?game_abb=${game.game_abb}"><span
				class="col-sm-2" style="text-align: center;">${game.game_name }
			</span></a>
		</c:if>
	</c:forEach>
</div>