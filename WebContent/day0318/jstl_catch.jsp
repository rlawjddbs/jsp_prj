<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="예외처리"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<c:catch var="e">
				
			<%
				// try{
				// 코드생성
				Class.forName("Test"); // 예외를 throws하는 method를 사용하더라도 _jspService()가
				// 코드를 try ~ catch로 감싸고 있기 때문에 코드 에러가 발생하지 않는다.
			// } catch(ClassNotFoundException cnfe){
			//	out.println("죄송합니다.");
			// } // end catch
			%>
			</c:catch>
			<%-- <c:if test="${ e ne null }"> --%>
			<c:if test="${ not empty e }">
				서비스 도중 문제가 발생하였습니다.<br />
				${ e }
			</c:if>
			
			<%-- <%!
				public void test(){
					Class.forName(""); // try ~ catch 필수
				} // test 
			%> --%>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>