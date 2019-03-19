<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v190130.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/Diary/css/tooltip.css"/>
<title>Insert title here</title>
<style type="text/css">
	#wrap{margin: 0px auto; width:800px; height: 860px;}
	/* header, container, footer는 상위 wrap이 같은 width를 가지므로 별로도 선언안해도 사이즈가 정해진다. */
	#header{width:800px; height: 140px; background: #FFFFFF url("http://localhost:8080/jsp_prj/common/images/header_bg.png") repeat-x;
		position: relative;}
	#headerTitle{font-family: HY견고딕, 고딕; font-size: 35px; font-weight: bold; text-align: center; 
		position: absolute; top:30px; left:290px;}
	#container{width:800px; height: 600px;}
	#footer{width:800px; height: 120px;}
	#footerTitle{float: right; font-size: 15px; padding-top: 20px; padding-right: 20px;}
	
	/* 달력 설정 */	
	#diaryTab{margin: 0px auto; border-spacing: 0px; border: 1px solid #cecece;}
	.sunTitle{font-weight: bold; color:red; background-color: #FED8D8; font-weight: bold;}
	.weekTitle{}
	.satTitle{background-color: #dff9fb; color: blue; } 
	#tr_day>th{font-family: 나눔스퀘어라운드, 맑은고딕; width: 100px; height:23px; border:1px solid #CECECE;}
	#diaryTitle{text-align: center; margin-bottom: 10px; margin-top: 20px;}
	#diaryToday{width: 100px; font-family: 고딕체; font-size: 28px; font-weight: bold; padding-left: 6px; font-family: 돋움체;}
	.diaryTd{width: 100px; height: 60px; border: 1px solid #CECECE; text-align: right; vertical-align: top;
			font-weight: bold; font-size: 14px; }
	.blankTd{width: 100px; height: 60px; border: 1px solid #CECECE; text-align: right; vertical-align: top;
			font-weight: bold; font-size: 14px; color: #CCCCCC;}
		
	.todayTd{ width:100px; height:60px; border:1px solid #D7E2E9; background-color:#E9F4FB; text-align:right; vertical-align:top; font-size:16px; font-weight:bold; }
		
	/* 요일별 글자색 */	
	.sunColor{color: #e74c3c; font-size: 15px;}
	.weekColor{color: #222222; }
	.satColor{color: blue; font-size: 15px;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

	function moveMonth(month, year){
		//loactio href로  파라매터 사용
		//location.href = "diary.jsp?param_year="+year+"&param_month="+month;
		
		//자바스크립트로 직접 파라매터 값 변경
		//var obj=document.diaryFrm;
		//obj.param_month.value = month;
		//obj.param_year.value = year;
		//obj.submit();
		
		//제이쿼리 사용
		$("[name='param_year']").val(year);
		$("[name='param_month']").val(month);
		$("[name='diaryFrm']").submit();
	}//moveMonth
	
	
	
</script>
</head>
<body>

	<div id="wrap">
		<div id="header">
			<div id="headerTitle">SIST Class4</div>
		</div>
		<div id="container">container : 800(w) x 600(h)<br/>
			
			<div id="diaryWrap">
			<%!
				public static final int START_DAY = 1;
			%>
			<%
				Calendar cal = Calendar.getInstance();
				// 오늘을 저장
				StringBuilder todate = new StringBuilder();
				todate.append(cal.get(Calendar.YEAR)).append(cal.get(Calendar.MONTH)+1)
				.append(cal.get(Calendar.DAY_OF_MONTH));
				
				String param_month = request.getParameter("param_month");
				if(param_month!=null && !"".equals(param_month)){//파라메터 월이 존재하면 현재 캘린더 객체의 월을 변경
					cal.set(Calendar.MONTH, Integer.parseInt(param_month)-1);
				}
				String param_year = request.getParameter("param_year");
				if(param_year!=null && !"".equals(param_year)){//1월에서 밑으로 가면 연도를 변경
					cal.set(Calendar.YEAR, Integer.parseInt(param_year));
				}
				
				int nowYear = cal.get(Calendar.YEAR);
				int nowDay = cal.get(Calendar.DAY_OF_MONTH);
				int nowMonth = cal.get(Calendar.MONTH)+1;
				
				
				pageContext.setAttribute("nowYear", nowYear);
				pageContext.setAttribute("nowMonth", nowMonth);
				pageContext.setAttribute("nowDay", nowDay);
				
				
				boolean toDayFlag = false;
				StringBuilder nowDate = new StringBuilder();
				nowDate.append(nowYear).append(nowMonth).append(nowDay);
				
				log(todate+" / "+nowDate+" / "+ toDayFlag);
				if(todate.toString().equals(nowDate.toString())){
					toDayFlag = true;
				} // end if
			%>
			
			<form action="diary_origin.jsp" name="diaryFrm" method="post">
				<input type="hidden" name="param_month"/>
				<input type="hidden" name="param_year"/>
			</form>
			
				<div id="diaryTitle">
					<%-- <a href="diary.jsp?param_month=${nowMonth-1 == 0 ? 12:nowMonth-1}&
						param_year=${nowMonth-1==0 ? nowYear-1:nowYear}"> --%>
					<a href="#void" onclick="moveMonth(${nowMonth-1 == 0 ? 12:nowMonth-1}, ${nowMonth-1==0 ? nowYear-1:nowYear})"><img src="images/btn_prev.png" title="이전 월"/></a>
					<span id="diaryToday" title= "${nowYear }년 ${nowMonth}월">
						<c:out value="${nowYear}"/>.<c:out value="${nowMonth }"/>
					</span>
					<a href="#void" onclick="moveMonth(${nowMonth+1==13? 1 : nowMonth+1},${nowMonth+1==13? nowYear+1:nowYear})"><img src="images/btn_next.png" title="다음 월"/></a>
					<a href="#void" onclick="moveMonth('','')"><img src="images/btn_today.png" title="오늘"/></a>
				</div>
				
				<div id="diaryContent">
					<table id="diaryTab">
						<tr id="tr_day">
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
								String dayClass = ""; // 요일별 색상
								String todayCss = ""; // 오늘이거나 평일의 TD색
								int day = 0;//달력에 일을 채울 변수
								
								
								// 매월마다 끝나는 날짜가 다르기 때문에 무한 루프를 사용한다.
								for(int tempDay = 1; ; tempDay++){
									cal.set(Calendar.DAY_OF_MONTH, tempDay);//임시 일자를 설정한다. 
									// out.println(cal.get(Calendar.DAY_OF_MONTH)+"/"+tempDay);
									if(cal.get(Calendar.DAY_OF_MONTH)!= tempDay){
										
										int week=cal.get(Calendar.DAY_OF_WEEK);
										int nextMonth = cal.get(Calendar.MONTH)+1;
										if(week != Calendar.SUNDAY){
											// 마지막날 뒤에 공백만드는 반복문
											int nextDay = 1;
											for(int blankTd = week; blankTd < 8; blankTd++){
												%>
												<td class="blankTd"><div><%= nextMonth %>/<%= nextDay %></div></td>
												<%
												nextDay++;
											} // end for
											// 설정된 날까자 지금 달의 일자가 아니라면 마지막 일자 다음날 1일이므로
											// 반복문을 빠져나간다.
										} // end if
										break;
									} // end if
									
									
									
									//1일을 출력하기 전 공백을 출력한다.
									switch(tempDay){
									case START_DAY:
										// 전달의 마지막날
										cal.set(Calendar.MONTH, nowMonth-2);
										int prevMonth = cal.get(Calendar.MONTH)+1; // 이전 월
										int prevLastDay = cal.getActualMaximum(Calendar.DATE); // 이전월의 마지막일
										
										cal.set(Calendar.MONTH, nowMonth-1); 
										// 다시 현재월로 변경하여 공백을 출력 1일에 맞는 공백을 출력
										int week = cal.get(Calendar.DAY_OF_WEEK);
										System.out.println( week );
										for(int blankTd = 1; blankTd<cal.get(Calendar.DAY_OF_WEEK); blankTd++){
											%>
												<td class="blankTd"><%= prevMonth %>/<%= prevLastDay - week + blankTd + 1 %></td>
											<%
										} // end for
									} // end switch
									
									//요일별 색깔 설정하기
									switch(cal.get(Calendar.DAY_OF_WEEK)){
										case Calendar.SATURDAY : dayClass = "satColor";		break;
										case Calendar.SUNDAY : dayClass = "sunColor";		break;
										default :	dayClass = "weekColor";							break;
									} // end switch
									
									todayCss="diaryTd"; // 평일의 CSS 설정
									if(toDayFlag){ // 요청한 년월일과 오늘의 년월일이 같다면
										if(nowDay == tempDay){ // 오늘일자에만 다른 CSS를 적용한다.
											todayCss="todayTd";
										} // end if
									} // end if
									
							%>
							<form enctype="application/x-www-form-urlencoded"></form>
									<td class="<%= todayCss%>">
										<div>
											<span class="<%=dayClass%> ">
												<%= tempDay %>
											</span>
										</div>
									</td>
							<%
							
									//토요일이면 줄변경
									switch( cal.get(Calendar.DAY_OF_WEEK)){
									case Calendar.SATURDAY :
										out.println("</tr><tr>");
									}//end switch
								}//end for
							%>
						</tr>
					</table>
				</div>
				
			</div>
			
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserved. class 4</div>
		</div>
	</div>

</body>

</html>