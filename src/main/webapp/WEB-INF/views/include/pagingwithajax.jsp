<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="text-center">
	<ul class="pagination">
		<li><a href="javascript:move('/community/ajaxlist?page=${param.firstPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')" class="first">처음</a></li>
		<li><a href="javascript:move('/community/ajaxlist?page=${param.prevPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')" class="prev">이전</a></li>
		<c:forEach var="i" begin="${param.startPageNo}"
			end="${param.endPageNo}" step="1">
			<c:choose>
				<c:when test="${i eq param.pageNo}">
					<li><a href="javascript:move('/community/ajaxlist?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')" class="choice">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:move('/community/ajaxlist?page=${i}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li><a href="javascript:move('/community/ajaxlist?page=${param.nextPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')" class="next">다음</a></li>
		<li><a href="javascript:move('/community/ajaxlist?page=${param.finalPageNo}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if>')" class="last">마지막</a></li>
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
						$tr.append($("<td>").append($("<a>").attr("href","/community/view?id="+post.post_id+"&page="+data.page).text(post.post_title)));
						$tr.append($("<td>").text(post.user_id));
						$tr.append($("<td>").text(post.post_regdate));
						$tr.append($("<td>").text(post.post_lookup));
						
						$("#posts").append($tr);
				}
				
			}
		});
	}
</script>
