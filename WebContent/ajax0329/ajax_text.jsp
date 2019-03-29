<%@page import="day0326.RssVO"%>
<%@page import="java.util.List"%>
<%@page import="day0326.JtbcRssParsing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			var name=$("#name").val();
			// chrome은 URL을 자동처리(가 -> %AA%BB%CC ) 하지만
			// IE는 처리하지 않는다. 따라서 javascript의 encoding 함수인 encodeURI를 사용해야 한다.
			var queryString="name="+ encodeURI(name);
			$.ajax({
				url:"text_result.jsp",
				teyp:"GET",
				data: queryString,
				dataType : "TEXT",
				error:function( xhr ){
					// xhr : XML HTTP Request 를 줄여 xhr 라 함, xhr을 사용하면 error의 이유를 확인 가능.
					// 200 - 서버가 정상 실행되어 응답 성공 하였으나 응답의 형태가 처리가능한 데이터가 아닐 때 { "이름":값, }
					alert("에러코드 : " + xhr.status + "에러 메세지 : " + xhr.statusText);
				},
				success:function( text_data ){
					// 서버에서 응답된 데이터를 받아 처리한다.
					var output = "<strong>"+name+"</strong> 조장의 조원<ul>";
					var data = text_data.split(",");
					for(var i =0; i < data.length; i++){
						output += "<li>"+data[i]+(data[i]=="김건하"?"(CEO)":"")+"</li>";
					} // end for
					output + "</ul>";
					
					$("#memberDiv").html( output );
				} // function
			}); // ajax
		}); // ready
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
			<!-- AJAX 는 Form 으로 전송하지 않기 때문에 Form으로 묶어놓지 않아도 됨. -->
			<!-- AJAX 는 name 속성도 마음대로 작성가능하며(쿼리스트링을 직접 만듦) 아이디만 기억해도 됨 -->
			조장 : <input type="text" name="name" class="inputBox" id="name" /><br />
			<input type="button" value="입력" class="btn" id="btn" />
		</div>
		<div id="memberDiv"></div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>