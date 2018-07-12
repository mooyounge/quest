<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
#downnav>button {
	text-align: center;
	width: 80px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
}

#downnav>a {
	text-align: center;
	width: 80px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
}

#search_option {
	display: inline-block;
	width: 150px;
	height: 30px;
	margin-left: 10px;
}
</style>


<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<!-- 여기에 포문돌리면됨 -->
		<c:forEach var="post" varStatus="status" items="${postList}">
			<tr>
				<td>${post.rnum}</td>
				<td><a
					href="/community/view?id=${post.post_id}&page=${param.page}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>">${post.post_title}</a></td>
				<td>${post.user_id}</td>
				<td>${post.post_regdate}</td>
				<td>${post.post_lookup}</td>
			</tr>
		</c:forEach>

	</tbody>

</table>


<div class="text-center">
	<div id="downnav" class="search actions" style="display: inline-block;">
		<a class="btn btn-danger"
			href="/community?name=info<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>">정보</a>
		<a class="btn btn-danger"
			href="/community?name=free<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>">자유</a>
		<select id="search_option">
			<option value="all" selected="selected">전체</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">글쓴이</option>
			<option value="title_content">제목+내용</option>
		</select> <input type="text" id="search_text"
			style="width: 200px; height: 30px; display: inline-block;"
			value="${param.text}" />
		<button class="btn btn-success" onclick="search()">검색</button>
		<a class="btn btn-success"
			href="/community?name=all<c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.genre!=null}">&genre=${param.genre}</c:if>">전체목록</a>
	</div>
	<button class="btn btn-success writebtn"
		onclick="location.href='/postWrite<c:if test="${param.game_abb!=null}">?game_abb=${param.game_abb}</c:if>'"
		style="height: 30px;">글쓰기</button>
	<jsp:include page="paging.jsp" flush="flase">
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="pageNo" value="${paging.pageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>
</div>

<script>
		function search() {
			var option = $("#search_option").val();
			var text = $("#search_text").val();
			if (option != null && text == "") {
				alert("검색어를 입력해 주세요");
				$("#search_text").focus();
				return;
			}
			
			location.href ="/community?option="+option+"&text="+text<c:if test="${param.game_abb!=null}">+"&game_abb=${param.game_abb}"</c:if><c:if test="${param.name!=null}">+"&name=${param.name}"</c:if><c:if test="${param.genre!=null}">+"&genre=${param.genre}"</c:if>;
		}
	</script>