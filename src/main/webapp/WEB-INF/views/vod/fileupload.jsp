<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div  class="panel panel-default ">
	            <div class="panel-heading">
	                <h3 class="panel-title">파일 업로드</h3>
	            </div>
	            <form  class="form-horizontal video-upload-file" role="form" method="POST" action=""
	     				     enctype="multipart/form-data" form_target="video-iframe">
	            <div class="panel-body">
		        <div class="form-group">
		            <label class="control-label col-md-2" for="file">파일</label>
		            <div class="col-md-10">
		                <input type="file" name="file" id="file" required>
		                <span class="help-block">파일 크기,시간,화질 설명하는 칸.</span>
		            </div>
		        </div>
				</div>
				</form>
	            <div class="panel-footer">
	                <div class="btn-group btn-group-justified">
	                    <a href="/" class="btn btn-default "  data-pjax>
	                        <i class="fa fa-times"></i> 취소
	                    </a>
	                    <div class="btn-group">
	                        <button type="submit" class="btn btn-primary " >
	                            <i class="fa fa-upload"></i> 업로드
	                        </button>
	                    </div>
	                </div>
			</div>
		</div>
	</div>
        
<!-- script libary -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>