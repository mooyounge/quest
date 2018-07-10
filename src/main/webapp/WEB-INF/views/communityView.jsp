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

.container>div>div>dl>* {
	display: inline-block;
}

#top2 {
	border: 0;
	width: 70%;
	display: inline-block;
	float: left;
	background: #c7c7c7;
}

#top3 {
	border: 0;
	width: 30%;
	display: inline-block;
	float: left;
	background: #c7c7c7;
}
</style>
</head>
<body>

	<header id="header" style="height: 84px;">
		<jsp:include page="include/mainnav.jsp" />
	</header>

	<jsp:include page="include/comnav.jsp" />

	<jsp:include page="include/commenu.jsp" />

	<div class="container">
		<!-- 선택한 글 보기 -->
		<div class="re_gall_top_1">
			<!--  w_top_left -->
			<div id="top2">
				<dl class="wt_subject">
					<dt>제 목</dt>
					<dd>${post.post_title }</dd>
					<br />
					<dt>글쓴이</dt>
					<dd>${post.user_id }</dd>
				</dl>
			</div>
			<div id="top3">
				<dl>
					<dt>작성일 :</dt>
					<dd>
						<b>${post.post_regdate }</b>
					</dd>
					<br />
					<!-- if문 필요 -->
					<dt>IP :</dt>
					<dd>220.116.*.*</dd>
				</dl>
			</div>
		</div>
		<!-- // w_top_right -->

		<div class="re_gall_box_1">
			<!-- con_substance -->
			<div class="con_substance">
				<div class="s_write">
					<table>
						<tr>
							<td>
								<div style="margin-top: 5px;">${post.post_content}</div>
								</td>
						</tr>
					</table>
				</div>
			</div>

			<!-- //con_substance -->


			<div style="display: inline-block; text-align: center;">
				<a href="javascript:;" id="recommend_vote_up"
					class="b_re_up fixed_name_box" title="추천"> <img
					src="/images/up.png" alt="" style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_like}
			</div>
			<div style="display: inline-block; text-align: center;">
				<a href="javascript:;" id="recommend_vote_down" class="b_re_down"
					title="비추천"> <img src="/images/down.png" alt=""
					style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_dislike}
			</div>
			<div style="display: inline-block; text-align: center;">
				<a href="javascript:;" id="recommend_vote_up"
					class="b_re_up fixed_name_box" title="추천"> <img
					src="/images/up2.png" alt="" style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_like}
			</div>
			<div style="display: inline-block; text-align: center;">
				<a href="javascript:;" id="recommend_vote_down"
					class="b_re_down fixed_name_box" title="추천"> <img
					src="/images/down2.png" alt="" style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_dislike}
			</div>
			<!-- 댓글창 -->
			<hr />

			<form action="/community/comment/insert" method="post">
				<input type="hidden" name="post_id" value="${post.post_id }">
				<div style="text-align: left;">
					아이디 : <input type="text" name="user_name"
						style="display: inline-block; width: 90px; height: 30px;" /> 비밀번호
					: <input type="password" name="password"
						style="display: inline-block; width: 90px; height: 30px;" />
					<textarea name="comment_content" id="" cols="30" rows="10"
						style="height: 120px; margin-top: 10px; resize: none;"></textarea>
					<button class="btn btn-success"
						style="height: 30px; margin-top: 10px;">댓글 입력</button>
				</div>
			</form>
			<br />
			<!-- for문 댓글 불러오기 -->
			<table>
				<thead>
					<tr>
						<th style="width: 80px">아이디</th>
						<th>내용</th>
						<th style="width: 150px">시간</th>
						<th style="width: 100px">추천,비추천</th>
						<th style="width: 80px">신고</th>
						<th style="width: 50px">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="comment" items="${post.commentList}">
						<tr>
							<th>${comment.user_name}</th>
							<th>${comment.comment_content}</th>
							<th>${comment.comment_regdate }</th>
							<th><a href="javascript:;" id="recommend_vote_up"
								class="b_re_up fixed_name_box" title="추천"> <img
									src="/images/up.png" alt="" style="width: 30px; heigth: 30px;" />
							</a> <a href="javascript:;" id="recommend_vote_down"
								class="b_re_down" title="비추천"> <img src="/images/down.png"
									alt="" style="width: 30px; heigth: 30px;" />
							</a></th>
							<th><a href="javascript:;" id="recommend_vote_down"
								class="b_re_down" title="신고"> <img src="/images/siren.png"
									alt="" style="width: 30px; heigth: 30px;" />
							</a></th>
							<!-- c:if문으로 자신이 쓴 것에만 보이기, 유저가 아닐 경우 비밀번호와 일치 -->
							<th><a href="">삭제</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<hr />

		<table class="table table-striped table-hover" id="post_table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody id="posts">
				<c:forEach var="post" varStatus="status" items="${postList}">
					<tr>
						<td>${status.count}</td>
						<td><a
							href="/community/view?id=${post.post_id}&page=${param.page}<c:if test="${param.option != null && param.text != null}" >&option=${param.option}&text=${param.text}</c:if><c:if test="${param.game_abb!=null}">&game_abb=${param.game_abb}</c:if><c:if test="${param.name!=null}">&name=${param.name}</c:if>">${post.post_title}</a></td>
						<td>${post.user_id}</td>
						<td>${post.post_regdate}</td>
						<td>${post.post_lookup}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<div class="search actions" style="display: inline-block;">
				<select id="search_option"
					style="display: inline-block; width: 150px; height: 30px;">
					<option value="all" selected="selected">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="name">글쓴이</option>
					<option value="title_content">제목+내용</option>
				</select> <input type="text" id="search_text"
					style="width: 200px; height: 30px; display: inline-block;" />
				<button class="btn btn-success writebtn"
					onclick="location.href='/community'"
					style="width: 80px; height: 30px; display: inline-block; margin-left: 10px;">전체목록
				</button>
				<button class="btn btn-success writebtn" onclick="search()"
					style="width: 70px; height: 30px; display: inline-block; margin-left: 10px;">검색</button>
			</div>
			<button class="btn btn-success writebtn"
				onclick="location.href='/postWrite'" style="height: 30px;">글쓰기</button>

			<jsp:include page="include/pagingwithajax.jsp" flush="flase">
				<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
				<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
				<jsp:param name="startPageNo" value="${paging.startPageNo}" />
				<jsp:param name="pageNo" value="${paging.pageNo}" />
				<jsp:param name="endPageNo" value="${paging.endPageNo}" />
				<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
				<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
		</div>

	</div>

	<footer id="footer">
		<jsp:include page="include/footer.jsp" />
	</footer>

	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
	function search(){
		var option = $("#search_option").val();
		var text = $("#search_text").val();
		if(option != null && text == ""){
			alert("검색어를 입력해 주세요");
			$("#search_text").focus();
			return;
		}
		
		location.href ="/community?option="+option+"&text="+text<c:if test="${param.game_abb!=null}">+"&game_abb=${param.game_abb}"</c:if><c:if test="${param.name!=null}">+"&name=${param.name}"</c:if>;
	}
	$(function(){
		if(${param.option != null}){
			$("#search_option").val("${param.option}").prop("selected",true);
		}
	});
	
	
	</script>
</body>
</html>