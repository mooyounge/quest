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

		<!-- 선택한 글 보기 -->

		<div class="re_gall_top_1">
			<!--  w_top_left -->
			<div class="w_top_left">
				<dl class="wt_subject">
					<dt>제 목</dt>
					<dd>${post.post_title }</dd>
				</dl>
				<dl>
					<dt>글쓴이</dt>
					<dd>${post.user_id }</dd>
				</dl>
			</div>
			<!-- // w_top_left -->
			<!--  w_top_right -->
			<div>
				<ul>
					<li><b>${post.post_regdate }</b></li>
					<li>220.116.*.*</li>
				</ul>
			</div>
			<!-- // w_top_right -->

			<div class="re_gall_box_1">
				<!-- con_substance -->
				<div class="con_substance">
					<div class="s_write">
						<table border="0" width="100%">
							<tr>
								<td><p>
									<div>${post.post_content}</div>
									</p></td>
							</tr>
						</table>
					</div>
				</div>

				<!-- //con_substance -->


				<div style="display: inline-block;text-align:center;">
					<a href="javascript:;" id="recommend_vote_up"
						class="b_re_up fixed_name_box" title="추천"
						style="width: 30px; heigth: 30px;"> <img src="/images/up.png"
						alt="" />
					</a>
					<br />
					${post.post_like}
				</div>

				<div style="display: inline-block;text-align:center;">
					<a href="javascript:;" id="recommend_vote_down" class="b_re_down"
						title="비추천" style="width: 30px; heigth: 30px;"> <img
						src="/images/down.png" alt="" />
					</a>
					<br />
					${post.post_dislike}
				</div>




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
							<td><a href="/community/view?id=${post.post_id}">${post.post_title}</a></td>
							<td>${post.user_id}</td>
							<td>${post.post_regdate}</td>
							<td>${post.post_lookup}</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<button class="btn btn-success writebtn"
				onclick="location.href='/postWrite'">글쓰기</button>
			<hr />
			<div class="text-center">
				<ul class="pagination">
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
				</ul>

			</div>
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