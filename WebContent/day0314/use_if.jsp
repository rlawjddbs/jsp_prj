<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL의 if문"
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
			<%-- 조건은 true | false가 들어간다.
				<c:if test="false">
					오늘은 목요일 입니다.
				</c:if> --%>
			<a href="">공지사항 읽기</a>
			<c:if test="${ param.user_role eq 'admin' }">
				<a href="#void">공지사항쓰기</a>
				<a href="#void">공지사항수정</a>
				<a href="#void">공지사항삭제</a>
			</c:if>
			<div>
				<a href="use_if.jsp?user_role=user">일반사용자</a>
				<a href="use_if.jsp?user_role=admin">관리자</a>
			</div>
			
			<c:if test="${ param.name eq '이재찬' }">
				<marquee scrollamount="20">
			</c:if>
			<form action="use_if.jsp">
				<label>이름</label> : <input type="text" name="name" class="inputBox" />
				<input type="submit" value="입력" class="btn" />
			</form>
			<div>
				위의 Form Control에서 입력된 이름을 출력하는데 이름이 '이재찬'이라면
				흘러가도록 설정
			</div>
			<c:if test="${ param.name eq '이재찬' }">
				</marquee>
			</c:if>
		</div>
		
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>