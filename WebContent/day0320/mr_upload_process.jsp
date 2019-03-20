<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="MultipartRequest사용 파일 업로드 처리"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<style type="text/css">
	#wrap{ margin: 0px auto; width:800px; height:860px;  }
	#header{ mwidth:800px; height:140px; background:#FFF url('http://localhost:8080/jsp_prj/common/images/header_bg.png'); position:relative; }
	#headerTitle{ font-family: HY견고딕, 고딕; font-size: 35px; font-weight:bold; text-align:center; position:absolute; left:300px; top:30px; }
	#container{ width:800px; height:600px;}
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<%
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if(isMultipart){
			// 1. 생성 - 파일 업로드 실행
			int maxSize = 1024*1024*10; // 10MB
			
			File repository = new File("C:/dev/workspace/jsp_prj/WebContent/upload/");
			
			// 외부 jar 파일에서 제공되는 클래스를 이용하여 파라메터 처리
			MultipartRequest mr = new MultipartRequest(request, repository.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			// 2. 파라메터의 처리
			String name = mr.getParameter("uploader");
			String age = mr.getParameter("age");
			
			// 3. 업로드된 파일명 받기
			// DefaultFileRenamePolicy에 의해 변경된 이름이 될 수도 있음.
			String fileName = mr.getFilesystemName("upfile");
			
			// 4. 원본 이름 받기
			String originalfileName = mr.getOriginalFileName("upfile");
			%>
			
			<div>
				<strong>파일 업로드 성공</strong>
				<ul>
					<li>업로더 : <%= name%></li>
					<li>연령대 : <%= age%></li>
					<li>업로드 된 파일명 : <%= fileName%></li>
					<li>원본 파일명 : <%= originalfileName%></li>
					<li><a href="upload_form.jsp" class="btn" style="display:block">업로드 폼</a></li>
					<li><a href="file_list.jsp" class="btn" style="display:block">파일리스트</a></li>
				</ul>
			</div>
			<%
			} else {
				response.sendRedirect("upload_form.jsp");
			} // end else
			%>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>