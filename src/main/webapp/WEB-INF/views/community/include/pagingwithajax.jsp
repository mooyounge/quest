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
		<li><a href="javascript:move('/community/ajaxlist?page=${param.firstPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>')" class="first">처음</a></li>
		<c:forEach var="i" begin="${param.startPageNo}"
			end="${param.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq param.pageNo}">
					<li><a href="javascript:move('/community/ajaxlist?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>')" class="choice" style="background-color: #9f9f9f;">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:move('/community/ajaxlist?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>')">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li><a href="javascript:move('/community/ajaxlist?page=${param.finalPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>')" class="last">마지막</a></li>
	</ul>
</div>

<script>
	function move(url){
		$.ajax({
			url:url,
			type:"post",
			success:function(data){
				$("#posts").empty();
				for(var post of data.postList){
					var $tr = $("<tr>");
						$tr.append($("<td>").text(post.rnum));
						$tr.append($("<td>").append($("<a>").attr("href","/community/view?id="+post.post_id+"&page="+data.page<c:if test="${param.game_abb!=null}">+"&game_abb=${param.game_abb}"</c:if><c:if test="${param.name!=null}">+"&name=${param.name}"</c:if><c:if test="${param.genre!=null}">+"&genre=${param.genre}"</c:if>).text(post.post_title)));
						$tr.append($("<td>").text(post.user_id));
						$tr.append($("<td>").text(post.post_regdate));
						$tr.append($("<td>").text(post.post_lookup));
						
						$("#posts").append($tr);
				}
				
			}
		});
	}
</script>
