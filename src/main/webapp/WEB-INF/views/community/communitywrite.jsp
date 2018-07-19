<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#write-form td {
	border: none;
}

#write-form textarea {
	width: 99%;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<title>Quest</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">

</head>
<body>
	<header id="header" style="height: 84px;">
		<jsp:include page="../include/mainnav.jsp" />
	</header>

	<h3>
		<label>새 글쓰기</label>
	</h3>

	<form id="writeForm" action="/postWrite" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="name" value="${param.name }">
		<div id="write-form" class="bbs-table">
			<div style="display:inline-block;">
				<label style="display: inline-block;">제목</label>
				<p style="display: inline-block;">
					<input type="text" id="post_title" name="post_title"
						style="width: 300px; height: 30px;" />
				</p>
			</div>

			<select id="genre" name="genre" onchange="changeGameName()"
				style="display: inline-block; width: 150px; height: 30px;">
				<option value="ALL">전체</option>
				<option value="FPS">FPS</option>
				<option value="RPG">RPG</option>
				<option value="AOS">AOS</option>
				<option value="rhythm">리듬게임</option>
				<option value="indie">인디게임</option>
			</select> <select id="game_abb" name="game_abb"
				style="display: inline-block; width: 150px; height: 30px;">
				<c:forEach var="game" items="${gameList}">
					<option value="${game.game_abb}">${game.game_name}</option>
				</c:forEach>
			</select>
			<div class="form-group"
				style="height: 20px; text-align: left;">
				<label class="control-label col-sm-2">Tagging</label>
				<div class="col-sm-10">
					<div class="row">
						<div class="col-sm-2">
							<input type="text" id="tag-name" class="form-control"
								style="width: 150px; height: 30px;" />
						</div>
						<div class="col-sm-2" style="width: 150px; height: 30px;">
							<select id="tag-color" class="form-control" style="height: 30px;">
								<option value="default">회색</option>
								<option value="danger">빨강</option>
								<option value="primary">파랑</option>
								<option value="success">초록</option>
								<option value="warning">노랑</option>
							</select>
						</div>
						<div class="col-sm-1">
							<button class="btn btn-default" type="button" onclick="addTag()"
								style="height: 30px;">추가</button>
						</div>
						<div id="tags" class="col-sm-7"></div>
					</div>
				</div>
			</div>
			<div>
				<textarea id="post_content" name="post_content" class="form-control"
					rows="10"></textarea>
			</div>

		</div>
		<div style="text-align: center; padding-bottom: 15px;">
			<input type="submit" value="전송" style="background-color: #9f9f9f;" />
			<input type="button" onclick="location.href='/community'" value="취소"
				style="background-color: #9f9f9f;" />
		</div>
	</form>
	<!-- 본문 끝 -->



	<footer id="footer">
		<jsp:include page="../include/footer.jsp" />
	</footer>

	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.min.js"></script>
	<script>
	
		$(document).ready(function(){
			$("#genre").val("${gameList[0].genre}").prop("selected",true);
			if(${param.game_abb!=null}){
				$("#game_abb").val("${param.game_abb}").prop("selected",true);
			}
		});
	
	
		$("#post_content").summernote({
			height : 300,
			focus : true,
			lang : 'ko-KR',
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					sendFile(files[0], editor, welEditable);
				}
			}
		});
	
		function changeGameName(){
			var genre = $("#genre").val();
			
			$.ajax({
				url:"/postWrite/gameName",
				type:"post",
				data:{"genre":genre},
				success:function(gameList){
					$("#game_abb").empty();
					for(var game of gameList){
						var $option = $("<option>");
						$option.val(game.game_abb);
						$option.text(game.game_name);
						$("#game_abb").append($option);
					}
					
				}
			});
		}
		var idx = 0;
		function addTag(){
			var name = $("#tag-name").val();
			var color = $("#tag-color").val();
			var $tag = $("<span onclick='deletetag(tag"+this+");' name='tag"+idx+"'></span>");
			var div = $("<div id='tag"+idx+"></div>");
			/* $tag.text(name);
			$tag.addClass("label");
			$tag.addClass("label-"+color);
			$tag.addClass("btn");
			console.log($tag);
			
	
			div.append($tag);
			div.html($("#tags").html()+"&nbsp;");
			
			div.append(
	"<input type='hidden' name='tags["+idx+"].name' value='"+name+"'/>");
			div.append(
	"<input type='hidden' name='tags["+idx+"].color' value='"+color+"'/>");
			 */
			$("#tags").append(div);
			idx++;
			$("#tag-name").val('');
			
		}
		
		function deletetag(tagnum){
			var element = $("span[name="+tagnum+"]");
			// var element = document.getElementByName(tagnum);
			   element.remove();
		}
	</script>

</body>
</html>