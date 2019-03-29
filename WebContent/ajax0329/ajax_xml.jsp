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
		$(".btn").click(function(){
			var name = $("[name='name']:checked").val();
			var queryString="name="+ encodeURI(name);

			$.ajax({
				url : "xml_result.jsp",
				type : "get",
				data : queryString,
				dataType : "text",
				error: function( xhr ){
					alert( xhr.status );
				}, // error
				success : function( xml_data ){
					// alert( xml_data );
					// alert( $(xml_data).find("name").text() ); // 값은 나오나 잘못된 Parsing 의 예 값이 한번에 나옴
					var nameNodes = $( xml_data ).find("name");
					var output = "";
					$.each( nameNodes, function(idx, nameNode){
						// alert( $(nameNode).text() );
						output += "<input type='checkbox' name='name' value='"
						+$(this).text()+"' />"+$(this).text()+"<br />";
					}); // end each
					$("#memberView").html( output );
				} // success 
			}); // ajax
		}); // click
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
				<input type="radio" name="name" value="이봉현" />1조
				<input type="radio" name="name" value="박영민" />2조
				<input type="radio" name="name" value="오영근" />3조
				<input type="radio" name="name" value="김건하" />조기취업
				<input type="button" value="조회" class="btn" />
			</div>
		</div>
		<div id="memberView">
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>