<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="ip나 localhost를 구분하여 다른 언어를 보여주는 일" 
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
			// 접속자의 IP Address를 얻는다.
			String ipAddr = request.getRemoteAddr();
			String nameLabel = "name";
			String ageLabel = "age";
			String addrLabel = "address";
			String btnLabel = "submit";
			
			if("0:0:0:0:0:0:0:1".equals(ipAddr)){
				nameLabel = "이름";
				ageLabel="나이";
				addrLabel="주소";
				btnLabel="전송";
			} // end if
			%>
			
			<form action="forward_b.jsp" method="get" >
				<table>
					<tr>
						<td><label><%= nameLabel %></label></td>
						<td><input type="text" name="name" class="inputBox" /></td>
					</tr>	
					<tr>
						<td><label><%= ageLabel %></label></td>
						<td><input type="text" name="age" class="inputBox" /></td>
					</tr>	
					<tr>
						<td><label><%= addrLabel %></label></td>
						<td><input type="text" name="addr" class="inputBox" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"	><input type="submit" value="<%= btnLabel %>" class="btn" /></td>
					</tr>
				</table>
			</form>
			
			<a href="http://localhost:8080/jsp_prj/day0313/forward_a.jsp">한국어</a>
			<a href="http://211.63.89.133:8080/jsp_prj/day0313/forward_a.jsp">English</a>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>