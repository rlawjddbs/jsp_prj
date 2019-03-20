<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="MultipartRequest를 사용한 파일 업로드 폼"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<style type="text/css">
	#wrap{ margin: 0px auto; width:800px; overflow:hidden;  }
	#header{ mwidth:800px; height:140px; background:#FFF url('http://localhost:8080/jsp_prj/common/images/header_bg.png'); position:relative; }
	#headerTitle{ font-family: HY견고딕; font-size: 35px; font-weight:bold; text-align:center; position:absolute; left:300px; top:30px; }
	#container{ width:800px; min-height:600px;}
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	input{ display:inline-block; margin:10px 0;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			if($("#uploader").val()==""){
				$("#uploader").focus();
				return;
			} // end if
			if($("#upfile").val()==""){
				alert("업로드할 파일을 선택해 주세요.");
				return;
			} // end if
			
			// 확장자명 jsp, java, class, xml은 업로드하지 못하도록 막는다.
			/* var flag = false;
			var fileNames = [".jsp",".java",".class",".xml"];
			for(var i=0; i < fileNames.length; i++){
				if($("#upfile").val().toLowerCase().indexOf(fileNames[i]) != -1){
					alert("파일명에 "+fileNames[i]+"가 들어간 파일은 업로드할 수 없습니다.");
					return;
				} // end if
			} // end for */
			var ext = ["jsp","java","class","xml"];
			var flag = false;
			
			/* var fileName = $("#upfile").val();
			var inputExt = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase(); */
			
			var fileName = $("#upfile").val().split(".");
			var inputExt = fileName[fileName.length-1].toLowerCase();
			
			for( var i=0; i < ext.length; i++){
				if(ext[i] == inputExt){
					flag = true;
				} // end if
			} // end for
			if(flag){
				alert("업로드 정책에 위배되는 파일 확장자입니다.");
				return;
			} // end if
			$("#uploadFrm").submit();
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
			<!-- HTML Form 기반의 파일 업로드
				1. enctype="multipart/form-data"
				2. method="post"
			-->
			<a href="file_list.jsp">파일리스트</a>
			<form id="uploadFrm" action="mr_upload_process.jsp" method="post" enctype="multipart/form-data">
				<label>이름</label>
				<input id="uploader" type="text" name="uploader" class="inputBox" /><br />
				<label>나이</label>
				<select id="age" name="age">
					<c:forEach var="i" begin="10" end="80" step="10">
						<option value="${ i }"><c:out value="${ i }" />대</option>
					</c:forEach>
				</select>
				<br />
				<label>파일</label>
				<input id="upfile" type="file" name="upfile" class="inputBox" style="width:200px;" /><br />
				<input id="btn" type="button" value="업로드" class="btn" /><br />
				<a href="file_list.jsp">파일리스트</a>
			</form>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>