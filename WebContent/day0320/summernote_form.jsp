<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<style type="text/css">
	body{ margin:0; }
	#wrap{ margin: 0px auto; width:800px; height:860px;  }
	#header{ mwidth:800px; height:140px; background:#FFF url('http://localhost:8080/jsp_prj/common/images/header_bg.png'); position:relative; }
	#headerTitle{ font-family: HY견고딕, 고딕; font-size: 35px; font-weight:bold; text-align:center; position:absolute; left:300px; top:30px; }
	#container{ width:800px; min-height:300px;}
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	#btnGroup{ text-align:center; overflow:hidden; margin:10px auto; }
	form > div{ margin-top:15px }
</style>


<!-- summernote 관련 library 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="../common/summernote/bootstrap.js"></script> 

<link href="../common/summernote/summernote-lite.css" rel="stylesheet">
<script src="../common/summernote/summernote-lite.min.js"></script>
<script src="../common/summernote/lang/summernote-ko-KR.js"></script>
<!-- summernote 관련 library 끝 -->



<script type="text/javascript">
	$(function() {
	  $('#summernote').summernote({
		lang: 'ko-KR', // default: 'en-US'
		placeholder:'서머 노트 우왕 굳',
		tabsize:2,
		minHeight:300,
		maxHeight:1080,
		focus:true
	  });
	  
	  $("#btn").click(function(){
		  $("form").submit();
	  });
	});
</script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
		
			<form method="post" action="summernote_process.jsp">
  				<div>
	  				<label>작성자</label>
	  				<input type="text" name="name" class="inputBox" /><br />
  				</div>
  				<div>
  					<label>제목</label>
  					<input type="text" name="subject" class="inputBox" /><br />
  				</div>
  				<div>
  					<label>내용</label>
  					<textarea id="summernote" name="contents"></textarea>
  				</div>
  				<div id="btnGroup">
  					<input type="button" value="글쓰기" class="btn" id="btn" />
  				</div>
			</form>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>