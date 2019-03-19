<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
<style type="text/css">
	body{font-family: 'Gugi', cursive;}
	th{font-family: 'Gugi', cursive;}
	#wrap{ margin: 0px auto; width:800px; height:860px; }
	#header{ mwidth:800px; height:140px; background:#FFF url('http://localhost:8080/jsp_prj/common/images/header_bg.png'); position:relative; }
	#headerTitle{ font-family: HY견고딕, 고딕; font-size: 35px; font-weight:bold; text-align:center; position:absolute; left:300px; top:30px; }
	#container{ width:800px; overflow:hidden; padding:20px 10px}
	#footer{ width:800px; height:120px;  }
	#footerTitle{ float:right; font-size:15px; padding-top:20px; padding-right: 20px;}
	/* 달력 설정 */
	#diaryTab{ margin:0px auto; border-collapse:collapse; border-spacing:0px; }
	.sunTitle{ width:80px; height:25px; background-color:#ED4C67; font-weight:bold; color:#FFFFFF; border:1px solid #ED4C67; color:#fff; }
	.weekTitle{ width:80px; height:25px; border:1px solid #ccc; color:#787878 }
	.satTitle{ width:80px; height:25px; background-color:#12CBC4; font-weight:bold; color:#FFF; border:1px solid #12CBC4; color:#fff; }
	#diaryTitle{ text-align:center; margin-bottom: 10px; margin-top:20px;}
	#diaryToday{ width:100px; font-size:16px; font-size:27px; }
	#diaryTitle > img:nth-of-type(3){display:inline-block; margin-top:10px;}
	.diaryTd{ width:100px; height:60px; border:1px solid #ccc; text-align:right; font-weight:bold; vertical-align:top; padding:5px 10px; box-sizing:border-box; }
	.blankTd{ width:100px; height:60px; border:1px solid #ccc; text-align:right; font-weight:bold; vertical-align:top; padding:5px 10px; box-sizing:border-box; color:#ccc; }
	
	.sunColor{ font-size:16px; color:#ED4C67; }
	.weekColor{ color:#222; }
	.satColor{ color: #12CBC4; font-size:16px; }
	/* 달력 설정 끝 */
		
	
		
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( document ).tooltip({
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        } // function
      } // position
    }); // tooltip
 } ); // ready
  </script>
  <style>
  .ui-tooltip, .arrow:after {
    border: 2px solid white;
  }
  .ui-tooltip {
    padding: 10px 20px;
    color: #000;
    border-radius: 20px;
    font: bold 14px "Helvetica Neue", Sans-Serif;
    text-transform: uppercase;
    box-shadow: 0 0 7px rgba(0, 0, 0, 0.78);
    z-index:100;
  }
  .arrow {
    width: 70px;
    height: 16px;
    overflow: hidden;
    position: absolute;
    left: 50%;
    margin-left: -35px;
    bottom: -16px;
    z-index:1;
  }
  .arrow.top {
    top: -16px;
    bottom: auto;
  }
  .arrow.left {
    left: 20%;
  }
  .arrow:before{
  	content: "";
  	position: absolute;
    left: 20px;
    top: -20px;
    width: 25px;
    height: 25px;
    box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.52);
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    background-color:#fff;
  }
  /* .arrow:after {
    content: "";
    position: absolute;
    left: 20px;
    top: -20px;
    width: 25px;
    height: 25px;
    box-shadow: 6px 5px 9px -9px black;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  } */
  .arrow.top:after {
    bottom: -20px;
    top: auto;
  }
  </style>
<script type="text/javascript">
	function moveMonth(month, year){
		location.href="diary.jsp?param_year="+year+"&param_month="+month;
	} // moveMonth
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">
			
			<div id="diaryWrap">
			<%! //declaration(Java Class의 Field 영역)
				public static final int START_DAY = 1;
			%>
			<%
				Calendar cal = Calendar.getInstance();
				int nowYear = 0;
				int nowMonth = 0;
				int nowDay = cal.get(Calendar.DAY_OF_MONTH);
				
				String param_month = request.getParameter("param_month");
				
				if(param_month != null){ // 파라메터 월이 존재하면 
					cal.set(Calendar.MONTH, Integer.parseInt(param_month)-1);
				} // end if
				
				nowMonth = cal.get(Calendar.MONTH)+1;
				
				String param_year = request.getParameter("param_year");
				
				if(param_year != null){ // 파라메터 월이 존재하면 
					cal.set(Calendar.YEAR, Integer.parseInt(param_year));
				} // end if
				
				nowYear = cal.get(Calendar.YEAR);
				
				
				pageContext.setAttribute("nowYear", nowYear);
				pageContext.setAttribute("nowMonth", nowMonth);
				pageContext.setAttribute("nowDay", nowDay);
				
				
			%>
			<div id="diaryTitle">
				<a href="#void" onclick="moveMonth(${ nowMonth==1?12:nowMonth-1 }, ${ nowMonth==1?nowYear-1:nowYear})"><img src="images/btn_prev.png" title="이전 월" /></a>
				<span id="diaryToday" title="${ nowYear }년${ nowMonth }월">
					<c:out value="${ nowYear }" />.<c:out value="${ nowMonth }" />
				</span>
				<a href="#void"><img src="images/btn_next.png" title="다음 월" /></a>
				<a href="#void"><img src="images/btn_today.png" title="오늘" /></a>
			</div>
			<div id="diaryContent">
				<table id="diaryTab" >
					<tr>
						<th class="sunTitle">일</th>
						<th class="weekTitle">월</th>
						<th class="weekTitle">화</th>
						<th class="weekTitle">수</th>
						<th class="weekTitle">목</th>
						<th class="weekTitle">금</th>
						<th class="satTitle">토</th>
					</tr>
					<tr>
						<%
							String dayClass="";
							// 매월 마다 끝나는 날짜가 다르기 때문에(length값이 달라지기 때문에) 무한루프를 사용한다.
							for(int tempDay=1; ; tempDay++){
								cal.set(Calendar.DAY_OF_MONTH, tempDay); // Calendar 클래스의 인스턴스의 임시 일자를 설정한다.
								if(cal.get(Calendar.DAY_OF_MONTH) != tempDay){ 
									// 설정된 날짜가 현재 일자가 아니라면(set()으로 설정된 날짜값이 i값과 다르다면) 마지막 일자 다음 일이므로 반복문을 빠져나간다.
									for( int blankTd = cal.get(Calendar.DAY_OF_WEEK); blankTd < 8; blankTd++ ){
										%>
										<td class="blankTd"></td>
										<%
									} // end for
									break;
								} // end if
								
								// 1일을 출력하기전 공백 출력 (이전 달은 빈칸으로 채워주기)
								/* if( tempDay == 1){
									for(int i=1; i < cal.get(Calendar.DAY_OF_WEEK); i++){
										out.println("<td class=\"diaryTd\"></td>");
									} // end for
								} // end if */
								switch( tempDay ){
								case START_DAY:
									for(int blankTd=1; blankTd < cal.get(Calendar.DAY_OF_WEEK); blankTd++){
										%>
										<td class="blankTd"></td>
										<%
									} // end for
								} // end switch
								
								// 요일별 색 설정
								switch(cal.get(Calendar.DAY_OF_WEEK)){
								case Calendar.SUNDAY:
									dayClass="sunColor";
									break;
								case Calendar.SATURDAY:
									dayClass="satColor";
									break;
								default:
									dayClass="weekColor";
								} //end switch
								
						%>
								<td class="diaryTd">
									<div><span class="<%= dayClass %>"><%= tempDay %></span></div>
								</td>
						<%
								// 토요일이면 줄 변경
								switch(cal.get(Calendar.DAY_OF_WEEK)){
								case Calendar.SATURDAY:
									out.println("</tr><tr>");
								} // end switch
							} // end for
							
						%>
					
				</table>
			</div>
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>