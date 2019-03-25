<%@page import="java.io.IOException"%>
<%@page import="kr.co.sist.diary.vo.DiaryDetailVO"%>
<%@page import="kr.co.sist.diary.dao.DiaryDAO"%>
<%@page import="java.sql.SQLException"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
			
			<div id="readFrm">
<%
	DiaryDAO d_dao = DiaryDAO.getInstance();
	try{ // proxy : 쁘락찌(?), 프록시
		int num = Integer.parseInt(request.getParameter("num"));
		DiaryDetailVO dd_vo = d_dao.selectDetailEvent(num);
		if(dd_vo == null){
			throw new NullPointerException();
		} // end if
%>
	<form action="diary.jsp" method="post" name="readFrm">
		<input type="hidden" name="pageFlag" />
		<input type="hidden" name="num" value="${ param.num }"/>
		<input type="hidden" name="param_year" value="${ param.param_year }" />
		<input type="hidden" name="param_month" value="${ param.param_month}" />
		<table id="readTab">
			<tr>
				<th colspan="2">
					<span style="font-size:20px ">이벤트 읽기</span>
				</th>
			</tr>
			<tr>
				<td style="width:80px;">제목</td>
				<td style="width:400px;">
					<div id="subject">
						<strong><%= dd_vo.getSubject() %></strong>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:80px;">내용</td>
				<td style="width:400px;">
					<%= dd_vo.getContents() %>
				</td>
			</tr>
			<tr>
				<td style="width:80px;">이벤트 일</td>
				<td style="width:400px;">
					<div id="evtDate">${ param.param_year } - ${ param.param_month } - ${ param.param_day } </div>
				</td>
			</tr>
			<tr>
				<td style="width:80px;">작성자</td>
				<td style="width:400px;">
					<div id="writer"><strong><%= dd_vo.getWriter() %></strong></div>
				</td>
			</tr>
			<tr>
				<td style="width:80px;">비밀번호</td>
				<td style="width:400px;">
					<input type="password" id="pass" name="pass" class="inputBox" style="width:200px" />
				</td>
			</tr>
			<tr>
				<td style="width:80px;">작성일</td>
				<div id="wDate"><strong><%= dd_vo.getW_date() %></strong></div>
				</td>
			</tr>
			<tr>
				<td style="width:80px;">작성IP</td>
				<td style="width:400px;">
					<div id="ip"><strong><%= dd_vo.getIp() %></strong></div> (작성 당시 ip : <%= request.getRemoteAddr() %> )
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="#void" onclick="history.back()">글 목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	<%
	} catch(IOException ioe){
	%>
	<h1 style="text-align:center; margin:50px auto">글의 내용을 읽어들이지 못했습니다. 죄송합니다.</h1>
	<%
	} catch(NumberFormatException nfe){
	%>
	<h1 style="text-align:center; margin:50px auto">유효하지 않은 파라메터가 입력되었습니다.</h1>
	<%
	} catch(NullPointerException npe){
	%>
	<h1 style="text-align:center; margin:50px auto">해당 글을 찾을 수 없습니다.</h1>
	<%
	} catch( SQLException sqle ){
		sqle.printStackTrace();
	%>
	<img src="images/construction.jpg" title="죄송합니다. T^T 빠른 복구를 위해 노력 중입니다." />
	<% 
	} // end catch
	%>
</div>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>