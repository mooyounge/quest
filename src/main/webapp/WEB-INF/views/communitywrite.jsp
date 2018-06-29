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



	<div id="content-categories">자유 게시판</div>
	<h3>새 글쓰기</h3>
	<form id="writeForm" action="write_proc.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardCd" value="free" />
		<div id="write-form" class="bbs-table">
			<div>
				<p>제목</p>
				<p><input type="text" name="title" style="width: 90%;" /></p>
			</div>
			
			<div class="">
				<textarea id="content" class="form-control" rows="10"></textarea>
			</div>
			
			
			<div>
				<p>첨부 파일</p>
				<p><input type="file" name="attachFile" /></p>
			</div>
		</div>
		<div style="text-align: center; padding-bottom: 15px;">
			<input type="submit" value="전송" /> <input type="button" value="취소" />
			<input type="button" value="목록" />
		</div>
	</form>
	<!-- 본문 끝 -->



	<footer id="footer">
		<jsp:include page="include/footer.jsp" />
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- script libary -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.min.js"></script>
	<script>
		$("#content").summernote({
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