<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="include/headercss.jsp" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.menuleft li {
	display: inline-block;
}
</style>
</head>
<body>

	<header id="header">
		<jsp:include page="include/mainnav.jsp" />
	</header>

	<jsp:include page="include/comnav.jsp" />

	<div class="container">
		<div class="menuleft">
			<ul>
				<li><a href="">정보게시판</a></li>
				<li><a href="">자유게시판</a></li>
			</ul>
		</div>
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
						<td>${status.count}</td>
						<td><a href="/community/view?id=${post.post_id}&page=${param.page}">${post.post_title}</a></td>
						<td>${post.user_id}</td>
						<td>${post.post_regdate}</td>
						<td>${post.post_lookup}</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>


		<div class="text-center">
			<ul class="pagination">
				<jsp:include page="include/paging.jsp" flush="flase">
					<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
					<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
					<jsp:param name="startPageNo" value="${paging.startPageNo}" />
					<jsp:param name="pageNo" value="${paging.pageNo}" />
					<jsp:param name="endPageNo" value="${paging.endPageNo}" />
					<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
					<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
				</jsp:include>
			</ul>
			<div class="search actions" style="display: inline-block;">
				<select name="job"
					style="display: inline-block; width: 70px; height: 30px;">
					<option value="전체" selected="selected">전체</option>
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="글쓴이">글쓴이</option>
					<option value="제목+내용">제목+내용</option>
				</select> <input type="text"
					style="width: 200px; height: 30px; display: inline-block;" />
				
				<button class="btn btn-success writebtn" onclick=""
					style="width: 80px; height: 30px; display: inline-block;">전체목록
				</button>
				<button class="btn btn-success writebtn" onclick=""
					style="width: 70px; height: 30px; display: inline-block;">검색</button>
			</div>
			<button class="btn btn-success writebtn"
				onclick="location.href='/postWrite'"
				style="height: 30px; margin-top: 15px;">글쓰기</button>
		</div>

	</div>

	<footer id="footer">
		<jsp:include page="include/footer.jsp" />
	</footer>

	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>