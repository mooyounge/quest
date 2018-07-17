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
	            <form  id="upload-file-form" class="form-horizontal video-upload-file" role="form" method="POST" action="/vod/upload"
	     				     enctype="multipart/form-data" >
	            <div class="panel-body">
		        <div class="form-group">
		            
		            <div class="col-md-10">
		            	<label for="">이름 : <input type="text" name="name" id="name" /></label> <br />
		                <input type="file" name="file" id="file" formenctype="multipart/form-data"  data-url="/vod/upload" />
		                <span class="help-block">파일 크기,시간,화질 설명하는 칸.</span>
		            </div>
		        </div>
				</div>
				
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
				</form>
		</div>
	</div>
	
<!-- script libary -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>