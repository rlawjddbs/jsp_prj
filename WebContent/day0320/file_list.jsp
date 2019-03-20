<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
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
	#container{ width:800px; min-height:600px;}
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	td{ text-align:center; font-weight:bold; color:#12CBC4 }
	a{ color:#3742fa; }
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<%
				File uploadFolder = new File("C:/dev/workspace/jsp_prj/WebContent/upload");
				File[] listFile = uploadFolder.listFiles();
			%>
		
			<table border="1" cellspacing="0" align="center">
				<tr>
					<th width="60">번호</th>
					<th width="350">파일명</th>
					<th width="150">업로드 일시</th>
					<th width="120">크기(byte)</th>
				</tr>
				<%
					if(listFile.length != 0){
						File temp=null;
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm");
						for(int i=0; i < listFile.length; i++){
							temp=listFile[i];
						%>
						<tr>
							<td><%= i+1 %></td>
							<!-- 한글파일명을 link(<a> 태그)로 전송할 때는 encoding을 해주어야 한다. 
							<form> 태그로 넘길 때는 browser에서 encoding을 알아서 해주기 때문에 개발자가 encoding할 필요가 없다.
							-->
							<td><a href="download.jsp?file_name=<%=URLEncoder.encode(temp.getName(),"UTF-8") %>"><%= temp.getName() %></a></td>
							<td><%= sdf.format(new Date(temp.lastModified())) %></td>
							<td><%= temp.length() %></td>
						</tr>
				<%	} // end for
					} else {
						out.println("<tr><td align=\"center\" colspan=\"4\">업로드된 파일이 존재하지 않습니다.</td></tr>");
					} // end else
				%>
			</table>
			<a href="upload_form.jsp" class="btn" style="display:block; width:60px; height:30px; line-height:30px; border-radius:15px; margin:0 auto; text-decoration:none; margin-top:20px; text-align:center; ">업로드</a>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>