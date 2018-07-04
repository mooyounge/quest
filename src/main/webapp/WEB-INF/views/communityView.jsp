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

	<jsp:include page="include/commenu.jsp" />
	
	<div class="container">

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


				<div style="display: inline-block; text-align: center;">
					<a href="javascript:;" id="recommend_vote_up"
						class="b_re_up fixed_name_box" title="추천"
						style="width: 30px; heigth: 30px;"> <img src="/images/up.png"
						alt="" />
					</a> <br /> ${post.post_like}
				</div>
				<div style="display: inline-block; text-align: center;">
					<a href="javascript:;" id="recommend_vote_down" class="b_re_down"
						title="비추천" style="width: 30px; heigth: 30px;"> <img
						src="/images/down.png" alt="" />
					</a> <br /> ${post.post_dislike}
				</div>
				<!-- 정보글 추천버튼 필요 -->
			</div>

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

					<!-- 여기에 포문돌리면됨 -->
					<c:forEach var="post" varStatus="status" items="${postList}">
						<tr>
							<td>${status.count}</td>
							<td><a
								href="/community/view?id=${post.post_id}&page=${param.page}">${post.post_title}</a></td>
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
		//수정 해야됨 community 로 가야됨.
		location.href = "/community?option="+option+"&text="+text;
	}
	$(function(){
		if(${param.option != null}){
			$("#search_option").val("${param.option}").prop("selected",true);
		}
	});
	
	
	
	
	</script>
</body>
</html>