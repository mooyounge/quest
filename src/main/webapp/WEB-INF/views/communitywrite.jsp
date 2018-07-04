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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">

</head>
<body>
	<header id="header">
		<jsp:include page="include/mainnav.jsp" />
	</header>



	<h3>새 글쓰기</h3>

	<form id="writeForm" action="/postWrite" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="boardCd" value="free" />

		<div id="write-form" class="bbs-table">
			<div>
				<p style="display: inline-block;">제목</p>
				<p style="display: inline-block;">
					<input type="text" id="post_title" name="post_title"
						style="width: 300px; height: 30px;" />
				</p>
			</div>
			<select id="" name=""
				style="display: inline-block; width: 150px; height: 30px;">
				<option value="FPS" selected="selected">FPS</option>
				<option value="RPG">RPG</option>
				<option value="AOS">AOS</option>
				<option value="rhythm">리듬게임</option>
				<option value="indie">인디게임</option>
			</select>
			<select id="" name=""
				style="display: inline-block; width: 150px; height: 30px;">
				<option value="" selected="selected">서든어택</option>
				<option value="">배틀그라운드</option>
				<option value="">더 디비전</option>
				<option value="">레인보우식스 시즈</option>
			</select>
			<div>
				<textarea id="post_content" name="post_content" class="form-control"
					rows="10"></textarea>
			</div>

		</div>
		<div style="text-align: center; padding-bottom: 15px;">
			<input type="submit" value="전송" /> <input type="button"
				onclick="location.href='/community'" value="취소" />
		</div>
	</form>
	<!-- 본문 끝 -->



	<footer id="footer">
		<jsp:include page="include/footer.jsp" />
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

		function sendFile(file, editor, welEditable) {
			var data = new FormData();
			data.append('upload', file);

			$.ajax({
				url : "/ch30_summernote/fileupload",
				contentType : false,
				processData : false,
				data : data,
				type : "post",
				success : function(data) {
					var $img = $('<img>').attr('src', data.url);
					$('#content').summernote('insertNode', $img);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>

</body>
</html>