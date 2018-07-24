<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="../include/headercss.jsp" />
<title>Quest</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
.menuleft li {
	display: inline-block;
}

.container>div>div>dl>* {
	display: inline-block;
}

#top1 {
	display: block;
	margin-bottom: 5px;
}

#top2 {
	border: 0;
	width: 60%;
	height: 88px;
	display: inline-block;
	float: left;
	background: #c7c7c7;
}

#top3 {
	border: 0;
	width: 40%;
	height: 88px;
	display: inline-block;
	float: left;
	background: #c7c7c7;
}


</style>
</head>
<body>

	<header id="header" style="height: 84px;">
		<jsp:include page="../include/mainnav.jsp" />
	</header>

	<jsp:include page="include/comnav.jsp" />

	<%-- <jsp:include page="include/commenu.jsp" /> --%>

	<div class="container">
		<!-- 선택한 글 보기 -->
		<span>
			<h2>${map.game.game_name}</h2>
		</span>
		<div id="top1" class="col-sm-12">
			<div id="top2">
				<dl>
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
			<!-- 태그창 -->
			<div id="tags" class="col-sm-12" style="margin-bottom: 10px;">
				<c:forEach var="tag" items="${post.tagList}">
					<span class="label label-${tag.color}">${tag.name}</span>
				</c:forEach>
			</div>
			<!-- 추천창 -->
			<hr />
			<div style="display: inline-block; text-align: center;">
				<a href="javascript:like('like');" id="post_like"
					class="b_re_up fixed_name_box" title="추천"> <img
					src="/images/up.png" alt="" style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_like}
			</div>
			<div style="display: inline-block; text-align: center;">
				<a href="javascript:like('dislike');" id="post_dislike"
					class="b_re_down" title="비추천"> <img src="/images/down.png"
					alt="" style="width: 70px; heigth: 70px;" />
				</a> <br /> ${post.post_dislike}
			</div>
			<!-- 댓글창 -->
			<hr />

			
			<br />
			<!-- for문 댓글 불러오기 -->
			<table class="col-sm-12">
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
							<th><a
								href="javascript:comment_like(${comment.comment_id},'like');"
								id="comment_like" class="b_re_up fixed_name_box" title="추천">
									<img src="/images/up.png" alt=""
									style="width: 15px; heigth: 15px;" />${comment.comment_like}
							</a> <a
								href="javascript:comment_like(${comment.comment_id},'dislike');"
								id="comment_dislike" class="b_re_down" title="비추천"> <img
									src="/images/down.png" alt=""
									style="width: 15px; heigth: 15px;" />${comment.comment_dislike}
							</a></th>
							<th><a href="javascript:;" id="recommend_vote_down"
								class="b_re_down" title="신고"> <img src="/images/siren.png"
									alt="" style="width: 30px; heigth: 30px;" />
							</a></th>
							<!-- c:if문으로 자신이 쓴 것에만 보이기, 유저가 아닐 경우 비밀번호와 일치 -->
							<th><a href="javascript:comment_del(${comment.comment_id});">삭제</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
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
		</div>
		<hr />

		<div id="ppModal" class="box_pp modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<p class="pp_title">비밀번호를 입력해주세요.</p>
			<div class="content">
				<input id="commentid_hidden" type="hidden"/>
				<input type="password" id="pp_password" name="pp_password" placeholder="비밀번호 입력" />
				<button class="btn btn-small btn-default" onclick="checkpassword()">삭제</button>
			</div>
		</div>
		
		<jsp:include page="include/bodyviewajax.jsp"></jsp:include>
		
	</div>
	
	<footer id="footer">
		<jsp:include page="../include/footer.jsp" />
	</footer>

	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

	
	<script>
	
	$(function(){
		if(${param.option != null}){
			$("#search_option").val("${param.option}").prop("selected",true);
		}
	});
	
	function like(type){
		$.ajax({
			url:"/community/post/like",
			type:"post",
			data:{"post_id":"${post.post_id}","type":type},
			success:function(data){
					if(data=="success"){
						alert("추천되었습니다!");
					}else if(data=="fail"){
						alert("이미 추천하신 글입니다.");
					}else{
						alert("서버오류입니다.");
					}
			}
		});
	}
	
	function infolike(type){
		$.ajax({
			url:"/community/post/infolike",
			type:"post",
			data:{"post_id":"${post.post_id}","type":type},
			success:function(data){
					if(data=="success"){
						alert("추천되었습니다!");
					}else if(data=="fail"){
						alert("이미 추천하신 글입니다.");
					}else{
						alert("서버오류입니다.");
					}
			}
		});
	}
	
	function comment_like(comment_id,type){
		$.ajax({
			url:"/community/comment/like",
			type:"post",
			data:{"comment_id":comment_id,"type":type},
			success:function(data){
					if(data=="success"){
						alert("추천되었습니다!");
					}else if(data=="fail"){
						alert("이미 추천하신 글입니다.");
					}else{
						alert("서버오류입니다.");
					}
			}
		});
	}
	function checkpassword(){
		var comment_id = $("#commentid_hidden").val();
		console.log("com:"+comment_id);
		var password = $("#pp_password").val();
		
		$.ajax({
			url:"/community/comment/del",
			type:"post",
			data:{"comment_id":comment_id,"password":password},
			success:function(data){
					if(data=="success"){
						alert("삭제되었습니다!");
						location.reload();
					}else if(data=="fail"){
						alert("비밀번호가 틀렸습니다.");
						location.reload();
					}else{
						alert("서버오류입니다.");
						location.reload();
					}
			}
		});
	}
	
	function comment_del(comment_id){
		$("#ppModal").modal();
		$("#commentid_hidden").val(comment_id);
		console.log(comment_id);
	}
	</script>
</body>
</html>