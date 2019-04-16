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
			var deptno = $("#deptno").val();
			if ( deptno == "" ){
				alert("부서번호는 필수 입력!!");
				$("#deptno").focus();
				return;
			} // end if
			
			$.ajax({
				url:"json_db.jsp",
				type:"post",
				data: "deptno="+deptno,
				dataType:"json",
				error:function( xhr ){
					alert( xhr.status + " " + xhr.statusText );
				},
				success:function( json_obj ){
					var result = json_obj.result;
					
					if( result ){
						var output = "<strong>"+ deptno +"<strong>번 부서사원 조회 결과<br />"; 
						var json_arr = json_obj.resultData;
						
						$.each( json_arr, function(idx, jsonEmpData ){
							output+="<div style='margin-bottom:10px'>"
							+"<table border='1' cellspacing='0'><tr><td width='80'>사원번호</td><td>"
							+ jsonEmpData.empno + "</td><td width='80'>사원명</td><td width='120'>"
							+jsonEmpData.ename + "</td><td width='80'>입사일</td><td width='150'>"
							+jsonEmpData.hiredate + "</td></tr>"
							+"<tr><td width='80'>연봉</td><td width='150'>"
							+"<input type='text' readonly='readonly' name='sal' value='"
							+jsonEmpData.sal+"' /></td><td width='80'>직무</td><td colspan='3'>"
							+"<input type='text' readonly='readonly' name='job' value='"+
							jsonEmpData.job+"' /></td></tr></table></div>";
						});
						output+="데이터 생성일자 : "+ json_obj.pubData;
						$("#empView").html(output);
						
					} else {
						var img = "<img src='../common/images/sist_logo.jpg' /><br />부서에 사원정보가 없습니다.";
						$("#empView").html(img);
					} // end else
				} // success
			});
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
				<label>부서번호 : </label>
				<input type="text" name="deptno" id="deptno" class="inputBox" /> 			
				<input type="button" value="사원조회" id="btn" class="btn" /> 			
			</div>
			<div id="empView">
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>