<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	/** 
	라디오 버튼을 생성하는 method
	createRadio(라디오 버튼의 개수, 라디오 버튼의 이름, 기본 체크 값)
	*/
	public String createRadio(int rCnt, String rName, int rDefault){
		StringBuilder radio = new StringBuilder();
		if(rCnt < rDefault){
			rDefault = 0;
		} // end if
		
		for(int i=0; i <= rCnt; i++){
		radio.append("<input type='radio' name='").append(rName)
		.append("' value='").append(i).append("'");
		if(i == rDefault){
			radio.append(" checked='checked'");	
		} // end if
		radio.append(">").append(i).append("점&nbsp;");
		} // end for
		
		return radio.toString();
	} // createRadio
%>
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
	
	#nameTitle{ width:100px; }
	#scoreTitle{ width:600px; }
	table{ border-top:2px solid #333; border-collapse:collapse; margin:0 auto;}
	th, td{ /* border-bottom: 1px dotted #444; */ }
	tr{ border-bottom:1px dotted #444; }
	th{ height : 30px; }
	
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<%
				String[] names = {"공선의","김건하","이재찬","정택성","김희철"};
			%>
			<table>
				<tr>
					<th id="nameTitle">이름</th>
					<th id="scoreTitle">점수</th>
				</tr>
				<%for(int i=0; i < names.length; i++){%>
					<tr>
						<td align="center"><%= names[i] %></td>
						<td>
							<%= createRadio(10, "name_"+i, 5) %>
						</td>
					</tr>
				<%} %>
			</table>
			전체 점수 : <%= createRadio(10, "total", 0) %>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>
