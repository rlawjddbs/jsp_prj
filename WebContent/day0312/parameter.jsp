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
	textarea{display:block; width:400px; height:300px}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<%
				// POST 방식의 요청일 때 한글처리
				request.setCharacterEncoding("UTF-8");
				String method = request.getMethod();
			%>
			<strong><%= method %></strong>
			<%
				// Web Parameter 받기 (사용자가 HTML Form Control에 입력한 값 받기)
				// Tomcat 8.X 이상은 GET 방식일 때 한글처리가 된다.
				/////////////////////////////////////// Parameter name이 유일한 경우 => String으로 처리 /////////////////////////////////////////////
				String name = request.getParameter("name"); // text
				String age = request.getParameter("age"); // password
				String mailing = request.getParameter("mailing"); // checkbox가 하나인 경우
				String gender = request.getParameter("gender"); // radio
				String addr = request.getParameter("addr"); // hidden
				String email = request.getParameter("email"); // select
				String greeting = request.getParameter("greeting"); // textarea
				
				/////////////////////////////////////// Parameter name이 중복된 경우 => String[] 처리 ///////////////////////////////////////////////
				String[] hobby = request.getParameterValues("hobby");
			%>
			<div id="paramOutput">
				<ul>
					<li>---- HTML Form Control에 name속성이 가지는 이름이 유일할 때 ----</li>
					<li>이름 : <%= name %></li>
					<li>나이 : <%= age %></li>
					<li>메일 수신 여부 : <%= mailing %></li>
					<li>성별 : <%= gender %></li>
					<li>주소 : <%= addr %></li>
					<li>이메일 : <%= email %></li>
					<li>가입인사 : <textarea><%= greeting %></textarea></li>
					<li>가입인사 : <%= greeting.replaceAll("\n","<br />") %></li>
					<li>---- HTML Form Control에 name 속성이 가지는 이름 중복 ----</li>
					<li>
					<% if( hobby != null ){ // hobby가 null이 아닐 경우 
						for(int i=0; i < hobby.length; i++){
						// 출력 내장 객체 : 
							out.print(hobby[i]);
							out.println(" ");
						} // end for
					} else { 
						out.print("선택하신 취미가 없습니다.");
					} // end else %>
					</li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>