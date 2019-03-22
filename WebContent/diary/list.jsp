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
	
	#diary{ margin-top:20px; }
	#diaryHeader{ font-size:19px; font-weight:bold; text-align:center; }
	#diaryContents{ min-height:400px; }
	#diaryIndexList{ height:30px; }
	#diarySearch{ height:30px; text-align:center; }
	
	#listTab{ border-top:2px solid #3c4790; border-spacing:0px; }
	#numTitle{ width:50px; height:25px; background-color:#F3F3F3; }
	#subjectTitle{ width:350px;; height:25px; background-color:#F3F3F3 }
	#writerTitle{ width:120px; height:25px; background-color:#F3F3F3 }
	#evtDayTitle{ width:150px; height:25px; background-color:#F3F3F3 }
	#wriDayTitle{ width:150px; height:25px; background-color:#F3F3F3 }
	th, td{ border-bottom: 1px solid #EEE }
	tr:HOVER{ background-color:#F3F3F3; }
	
	.center{ text-align:center; }
	
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
			<div id="diary">
				<div id="diaryHeader">이벤트 리스트</div>
				<div id="diaryContent">
					<table id="listTab">
						<tr>
							<th id="numTitle" >번호</th>
							<th id="subjectTitle">이벤트 제목</th>
							<th id="writerTitle">작성자</th>
							<th id="evtDayTitle">이벤트 일자</th>
							<th id="wriDayTitle">작성 일자</th>
						</tr>
					</table>
				</div>
				
				<div id="diaryIndexList">
						
				</div>
				
				<div id="diarySearch">
					<form action="list.jsp" method="post" id="searchFrm" name="searchFrm">
						<select name="fieldName" class="inputBox">
							<option value="subject">제목</option>
							<option value="contents">내용</option>
							<option value="writer">작성자</option>
						</select>					
						<input type="text" name="keyword" class="inputBox" style="width:250px;" id="keyword"/>
						<input type="button" id="btn" value="검색" class="btn"/>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>