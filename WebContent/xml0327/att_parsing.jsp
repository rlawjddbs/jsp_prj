<%@page import="xml0327.AttVO"%>
<%@page import="xml0327.AttParsing"%>
<%@page import="day0326.RssVO"%>
<%@page import="java.util.List"%>
<%@page import="day0326.JtbcRssParsing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	#container{ width:800px; }
	#footer{ width:800px; height:120px; }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	/* td{ padding:10px; } */
	#subject { padding-top:10px; }
	#subject > a { padding-left:10px; padding-right:10px; color:blue; font-weight:bold; transition-duration:0.3s; }
	#subject > a:hover { text-decoration:none; color:#A3CB38; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			$("[name='frm']").submit();
		});
	}); // ready
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
			<div style="padding-top:100px;">
				<c:import url="../common/jsp/main_menu.jsp" />
			</div>
		</div>
		<div id="container">
			<div>
				<form name="frm" action="att_parsing.jsp" method="get">
					<select id="lastName" name="lastName">
						<option value="김">김씨</option>					
						<option value="이">이씨</option>					
						<option value="박">박씨</option>					
						<option value="노">노씨</option>					
						<option value="정">정씨</option>					
						<option value="최">최씨</option>					
					</select>
					<input type="button" value="조회" id="btn" class="btn" />
				</form>
			</div>
		</div>
		<c:if test="${ not empty param.lastName }">
			<div>
				<div>선택하신 ${ param.lastName }씨로 조회한 결과입니다.</div>
				<div>
				<%
					String lastName = request.getParameter("lastName");
					AttParsing ap = new AttParsing();
					List<AttVO> list = ap.personData(lastName);
					pageContext.setAttribute("personList", list);
				%>
				<table border="1" cellspacing="0">
					<tr>
						<th width="100">성명</th>
						<th width="400">주소</th>
					</tr>
					<c:if test="${ empty personList }">
						<tr>
							<td colspan="2" align="center">검색결과가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="data" items="${ personList }">
						<tr>
							<td align="center">
								<c:out value="${ data.lastName }"></c:out>
								<c:out value="${ data.firstName }"></c:out>
							</td>
							<td>
								${ data.address } (${ data.city}, ${ data.zipcode })
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</c:if>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>