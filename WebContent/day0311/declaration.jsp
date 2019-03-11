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
			<%!
				int i; // instance 변수
				
				public String name(){
					return "공선의";
				} // name
				
				/* public String ip(){
					// declaration 에서는 내장객체 사용할 수 없다.
					String ip = request.getRemoteAddr();
					return ip;
				} */
			%>
			
			<%!
				public void test(){
				int j = 0;
			%>
				<%-- <%= j %> : declaration사이에서 정의된 코드지만 생성되는 위치가 달라 출력할 수 없다. --%>
			<%!
				} // test
			%>
			
			i = <%= i %><br />
			이름 : <%= name() %>
			<%-- <%
				/* public void test(){
				
				} */
			%> --%>
			<%
				// request : 내장(내재)객체 - _jspService method안에서 자동선언되어있는 객체
				String ip = request.getRemoteAddr();
			%>
			접속자 IP Address : <%= ip %>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>