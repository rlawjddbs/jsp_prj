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
		$("#id").keyup(function(){
			var id = $("#id").val();
			if( id.length > 2 ){
				
				if( id.trim() == ""){
					$("#idResult").text("아이디를 입력해주세요!").css({color:"#ff0000", fontWeight:"bold"});
					$("#id").val("");
					return;
				} // end if
				
				// ID 중복확인 비동기로 처리
				$.ajax({
					url:"json_dup_id.jsp",
					type:"get",
					async:false,
					data: "id="+id,
					dataType:"json",
					error:function( xhr ){
						alert("서비스가 원활하지 못합니다. 잠시후에 다시 시도해주세요.\n이용에 불편을 드려 죄송합니다. ");
						console.log(xhr.status + " / " + xhr.statusText);
					}, // error
					success:function( json_obj ){
						// json_obj 는 true, false 가 들어있음
						var output = "[ <strong>"+id+"</strong> ] 사용불가한 아이디 입니다.";
						var color = "#FF0000";
						if( json_obj.idResult ){
							output = "[ <strong> " + id + "</strong> ] 사용가능한 아이디 입니다.";
							var color = "#0000FF";
						} // end if
						
						$("#idResult").html(output).css({color:color, fontWeight:"bold"});
						if( id.length > 2 ){
							for(var i = 0; i < 4; i++ ){
								$("#idResult").fadeIn(1000).fadeOut(1000).fadeIn(1000);
							} // end for
						} // end if
						
					} // success
				}); // ajax
				
			} else {
				$("#idResult").html("");
			} // end else
		}); // keyup
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
			<strong>회원가입</strong><br />
			<table>
				<tr>
					<td>아이디</td>
					<td width="500">
						<input type="text" name="id" class="inputBox" id="id" />
						<span id="idResult"></span><br />
						<span style="color:#e74c3c; font-weight:bold">아이디는 3자 이상 입력하셔야 합니다.</span>
					</td>
				</tr>
			</table>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>