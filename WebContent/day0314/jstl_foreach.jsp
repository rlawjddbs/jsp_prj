<%@page import="day0313.TestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<select>
				<!-- 증가하는 값을 반복시킬 때 -->
				<c:forEach var="i" begin="1" end="100" step="1">
					<option value="${ i }"><c:out value="${ i }" /></option>
				</c:forEach>
			</select>
			<div>
				<%
					String[] movie={"시네마 천국","주토피아","코어","7인의 사무라이","트루먼쇼","인셉션"};
					pageContext.setAttribute("movie",movie);
				%>
				<%
					//List의 값 출력
					List<String> list = new ArrayList<String>();
					list.add("Java SE");
					list.add("Java EE");
					list.add("DBMS");
					list.add("HTML");
					pageContext.setAttribute("list", list);
				%>
				<ul>
					<c:forEach var="movie" items="${ movie }">
						<c:set var="i" value="${i+1}" />
						<li>${ i }.${ movie }</li>
					</c:forEach>
				</ul>
				<ul>
					<c:forEach var="subject" items="${ list }"> <!-- ${ list } 의 list는 pageContext.setAttribute("여기를 참조한", list) 값을 받아온다. -->
						<li><c:out value="${ subject }" /></li>
					</c:forEach>
				</ul>
				<%
					// List가 Generic으로 VO를 가진 경우 사용
					// forEach 안에서 "변수명.getter명"
					List<TestVO> voList = new ArrayList<TestVO>();
					voList.add(new TestVO("정윤",31));
					voList.add(new TestVO("희철",27));
					voList.add(new TestVO("재찬",26));
					voList.add(new TestVO("택성",28));
					
					pageContext.setAttribute("vl", voList);
				%>
				<table border="1"	cellspacing="0">
					<thead>
						<tr>
							<th width="50">번호</th>
							<th width="100">이름</th>
							<th width="50">나이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="data" items="${ vl }">
							<c:set var="cnt" value="${ cnt+1}"></c:set> <!-- 인스턴스 변수이므로 자동 초기화가 된다. -->
							<tr>
								<td><c:out value="${ cnt }" /></td>
								<td><c:out value="${ data.firstName }" /></td>
								<td><c:out value="${ data.age}"  /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>