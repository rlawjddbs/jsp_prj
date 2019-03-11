<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.tdtd{cursor:pointer}
	.tdtd:hover{ background-color:limegreen; color:#fff; transition-duration:0.3s }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".t").click(function(){
			alert($(this).children().val());
		});
		
		// $("#timezone").click(function(){
		//	$(this).fadeOut();
		// });
		
		var d = new Date();
		var time = "";
		time += d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "
		+d.getHours() + " : " + d.getMinutes() + " : " + d.getSeconds();
		$("#c_time").text(time);
		
	});	
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			<%
			// scriptlet은 _jspServie method 내에 코드가 생성된다.
				int i=3; // 지역 변수 : 자동 초기화가 되지 않는다.
			%>
			<%= i%>
			<%for(int j=1; j < 7; j++){%>
				<h<%=j %>>오늘은 불금입니다.</h<%=j %>>
			<%} // end for	%>
			<%
				String[] names = {"노진경","김정윤","박영민","김희철","박소영","이지수"};
			%>
			<table border="1" cellspacing="0">
				<tr>
					<th width="100">이름</th>
				</tr>
				<%for(int j=0; j < names.length; j++){ %>
				<tr>
					<td><%= names[j] %></td>
				</tr>
				<%} %>
			</table>
			<!-- 1 ~ 100 까지 합만 출력 -->
			<% int temp = 0; %>
			<%for(int k=0; k < 101; k++){
				temp += k;
			} %>
			<h1>1에서 부터 100까지의 합은 <%= temp %> 입니다.</h1>
			<!-- 구구단 3단 출력 -->
			<table border="1" cellspacing="0">
			<%for(int l=3; l<4; l++){ %>
				<%for(int m=1; m<10; m++){ %>
				<tr>
					<td><%=l %> X <%= m %> = <%=l*m %></td>
				</tr>
				<%} %>
			<%} %>
			</table>
			
			<br /><br /><br />
			
			<table border="1" cellspacing="0">
				<tr>
			<%for(int l=3; l<4; l++){ %>
				<%for(int m=1; m<10; m++){ %>
					<td><%=l %> X <%= m %> = <%=l*m %></td>
				<%} %>
			<%} %>
				</tr>
			</table>
			
			<br /><br /><br />
			
			<table border="1" cellspacing="0" cellpadding="5">
			<%for(int n=1; n < 10; n++){ %>
				<tr>
				<%for(int o=2; o < 10; o++){ %>
					<td class="tdtd" onclick="alert(<%= o*n %>)">
					<%= o %> X <%= n %>
					</td>
				<%} %>
				</tr>
			<%} %>
			</table>
			
			<br /><br /><br />
			
			<table border="1" cellspacing="0">
			<%for(int p=1; p < 10; p++){ %>
				<tr>
				<%for(int q=2; q < 10; q++){ %>
					<%-- <td width="40" align="center" onclick="alert(<%= q*p %>)"> --%>
					<td width="40" align="center" class="t">
					<%= q %> x <%=p %>
					<input type="hidden" name="sum" value="<%= q*p %>" />
					</td>
				<%} %>
				</tr>
			<%} %>
			</table>
			
			<!-- 년-월-일 요일 시:분 을 서버의 시간으로 얻어와서 흘러가는 문자열로 보여주세요. 
			버튼을 클릭하면 해당 일자가 3초동안 서서히 사라지도록 만들어주세요.-->
			
			<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEE HH:mm:ss"); %>
			<%String date = sdf.format(new Date()); %>
			<div>
			<h1 id="timezone">서버 시간 : <span id="s_time"><%= date %></span></h1>
			<h1>접속자 시간 : <span id="c_time"></span></h1>
			</div>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>