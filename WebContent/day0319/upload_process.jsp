<%@page import="javax.naming.SizeLimitExceededException"%>
<%@page import="kr.co.sist.util.HangulConv"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<!-- enctype="multipart/form-data"인 경우 parameter를 받을 수 없다. -->
			<%-- 이름 : <%= request.getParameter("uploader") %>
			나이 : <%= request.getParameter("age") %> --%>
			<%
			request.setCharacterEncoding("UTF-8"); // POST 방식의 한글처리 (parameter 명은 이걸로 처리안 됨)
			// 파일 업로드에 적합한 요청인지를 얻는다.
			// Check that we have a file upload request
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if( isMultipart ){ // 파일업로드에 적합한 요청 
				File repository = new File("C:/dev/workspace/jsp_prj/WebContent/upload");
				
				
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();

				// 업로드 파일이 메모리에 저장되는 최대 크기
				factory.setSizeThreshold(1024*1024*1); // 1MB
				factory.setRepository(repository);

				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// 업로드 파일의 최대 크기 설정
				upload.setSizeMax(1024*1024*5);

				try{
				// Parse the request
				List<FileItem> items = upload.parseRequest(request);
				
				// Iterator가 for문 보다 list를 처리하는 속도가 빠르기 때문에 Iterator 사용
				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();
				String uploader="", age="";
				String fieldName="", fileName="", contentType=""; // 지역변수 이므로 초기화 할 것
				long sizeInBytes=0;
				
				while (iter.hasNext()) {
				    FileItem item = iter.next();

				 // Process a regular form field
				    if (item.isFormField()) {
				        String controlName = item.getFieldName();
				        String controlValue = item.getString();
				        if( "uploader".equals(controlName) ){ // 비교할 문자열에 equals() method를 사용하라. 변수에 equals() method를 사용하면 NullPointerException이 발생할 가능성이 생긴다.
				        	uploader = HangulConv.toUTF(controlValue);
				        } // end if
				        if( "age".equals(controlName)){
				        	age = HangulConv.toUTF(controlValue);
				        } // end if
				    } // end if
				    
				    if (item.isFormField()) { // 일반 HTML Form Control 인지?
				        // processFormField(item);
				    	out.println("일반 폼 컨트롤<br />");
				    } else { // File Upload Control 인지?
				        // processUploadedFile(item);
				    	// out.println("파일 폼 컨트롤<br />");
				    	// Process a file upload
				    	if (!item.isFormField()) {
				    	    fieldName = item.getFieldName(); // File Control의 name 속성값
				    	    fileName = item.getName(); // File Control의 value 속성값
				    	    contentType = item.getContentType(); // 업로드한 파일의 종류 (zip, jpg, pdf 등) 
				    	    boolean isInMemory = item.isInMemory(); // 
				    	    sizeInBytes = item.getSize();
				    	    
				    	    File selectFile = new File(fileName);
				    	    File uploadedFile = new File(repository.getAbsolutePath()+"/"+selectFile.getName()); // 업로드 파일의 저장경로와 파일명을 설정
				    	    item.write(uploadedFile); // 설정된 파일을 업로드
				    	    
				    	} // end if
				    } // end else
				} // end while
				%>
					<h3>파일 업로드 성공</h3><br />
 					업로더명 : <strong><%= uploader %></strong><br />
					연령대 : <strong><%= age %></strong><br />
					업로드 파일명 : <strong><%= fileName %></strong>
					<%-- file control명 : <strong><%= fieldName%></strong><br /> --%>
					<%-- file control값 : <strong><%= fileName %></strong><br /> --%>
					<%-- 업로드 파일 형식 : <strong><%= contentType %></strong><br /> --%>
					크기 : <strong><%= sizeInBytes %></strong>byte<br />
					<a href="upload_form.jsp">업로드</a>
					<a href="file_list.jsp">파일리스트</a>
				<%				
				} catch(SizeLimitExceededException slee){
					// 브라우저로 출력이 되지 않는다.
					out.println("예외!!!");
				} // end catch
			} else { // 파일업로드에 부적합 요청
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