<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.co.sist.diary.vo.MonthVO"%>
<%@page import="kr.co.sist.diary.dao.DiaryDAO"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="http://localhost:8080/jsp_prj/common/css/main_v190130.css" />
<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Gugi', cursive;
}

th {
	font-family: 'Gugi', cursive;
}

#wrap {
	margin: 0px auto;
	width: 800px;
	/* overflow: hidden; */
	overflow:visible;
}

#header {
	mwidth: 800px;
	height: 140px;
	background: #FFF
		url('http://localhost:8080/jsp_prj/common/images/header_bg.png');
	position: relative;
}

#headerTitle {
	font-family: HY견고딕, 고딕;
	font-size: 35px;
	font-weight: bold;
	text-align: center;
	position: absolute;
	left: 300px;
	top: 30px;
}

#container {
	width: 800px;
	/* overflow: hidden; */
	/* padding: 20px 10px; */
	overflow:visible;
}

#footer {
	width: 800px;
	height: 120px;
	margin:0 auto;
}

#footerTitle {
	float: right;
	font-size: 15px;
	padding-top: 20px;
	padding-right: 20px;
}

/* 달력 설정 */
#diaryTab {
	margin: 0px auto;
	border-collapse: collapse;
	border-spacing: 0px;
}

#diaryContent {
	position: relative;
}

#diaryJob {
	position: absolute;
	top: 50px;
	left: 50%;
	transform: translateX(-50%);
	z-index:10000;
}

.sunTitle {
	width: 80px;
	height: 25px;
	background-color: #ED4C67;
	font-weight: bold;
	color: #FFFFFF;
	border: 1px solid #ED4C67;
	color: #fff;
	text-align: center;
}

.weekTitle {
	width: 80px;
	height: 25px;
	border: 1px solid #ccc;
	color: #787878
}

.satTitle {
	width: 80px;
	height: 25px;
	background-color: #12CBC4;
	font-weight: bold;
	color: #FFF;
	border: 1px solid #12CBC4;
	color: #fff;
}

#diaryTitle {
	text-align: center;
	margin-bottom: 10px;
	margin-top: 20px;
}

#diaryToday {
	width: 100px;
	font-size: 16px;
	font-size: 27px;
}

#diaryTitle>img:nth-of-type(3) {
	display: inline-block;
	margin-top: 10px;
}

.diaryTd {
	width: 100px;
	height: 60px;
	border: 1px solid #ccc;
	text-align: right;
	font-weight: bold;
	vertical-align: top;
	padding: 5px 10px;
}

.blankTd {
	width: 100px;
	height: 60px;
	border: 1px solid #ccc;
	text-align: right;
	font-weight: bold;
	vertical-align: top;
	padding: 5px 10px;
	color: #ccc;
}

.sunColor {
	font-size: 16px;
	color: #ED4C67;
}

.weekColor {
	color: #222;
}

.satColor {
	color: #12CBC4;
	font-size: 16px;
}

.todayColor {
	color: blue;
	font-size: 18px;
}

.todayTd {
	width: 100px;
	height: 60px;
	border: 1px solid #ccc;
	text-align: right;
	font-weight: bold;
	vertical-align: top;
	padding: 5px 10px;
	color: blue;
	background-color: #C4E538;
	box-shadow: 0 0px 15px #C4E538;
}

.todayTd span {
	color: white;
	text-shadow: 0 0 5px rgba(0, 0, 0, 0.78)
}
/* 달력 설정 끝 */
#writeFrm {
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.78);
	padding: 10px
}
#readFrm{
	background-color: rgba(255, 255, 255, 0.78);
	border: 1px solid #ccc;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.78);
	padding: 10px;
}
#btnCloseFrm{
    display: block;
    position: absolute;
    top: 14px;
    right: 8px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	function moveMonth(month, year){
		// location.href="diary.jsp?param_year="+year+"&param_month="+month;
		//var obj=document.diaryFrm;
		//obj.param_month.value=month;
		//obj.param_year.value=year;
		//obj.submit();
		$("[name='param_year']").val(year);
		$("[name='param_month']").val(month);
		$("[name='diaryFrm']").submit();
	} // moveMonth
</script>

<!-- summernote 관련 library 시작 -->
<script src="../common/summernote/bootstrap.js"></script>
<link href="../common/summernote/summernote-lite.css" rel="stylesheet">
<script src="../common/summernote/summernote-lite.min.js"></script>
<script src="../common/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	$(function() {
	  $('#summernote').summernote({
		lang: 'ko-KR', // default: 'en-US'
		placeholder:'이벤트를 작성해 주세요.',
		tabsize:2,
		minHeight:390,
		maxHeight:1080,
		focus:true
	  });
	  
	  $("#btn").click(function(){
		  $("form").submit();
	  });
	  
	  $("#btnCloseFrm").click(function(){
			// location.href="diary.jsp?param_year=${ param.param_year }&param_month=${ param.param_month }";
			moveMonth("${ param.param_month}","${ param.param_year}")
		});
	  $("#btnWriteClose").click(function(){
			// location.href="diary.jsp?param_year=${ param.param_year }&param_month=${ param.param_month }";
			moveMonth("${ param.param_month}","${ param.param_year}")
		});
	  
	  // 글작성 처리
	  $("#btnWrite").click(function(){
		  if($("#subject").val() == ""){
			  alert("이벤트 제목은 필수 입력~!");
			  $("#subject").focus();
			  return;
		  } // end if
		  if($("#summernote").val() == ""){
			  alert("이벤트 내용은 필수입력~!!");
			  $("#summernote").focus();
			  return;
		  } // end if
		  if($("#writer").val() == ""){
			  alert("작성자명은 필수입력~!!");
			  $("#writer").focus();
			  return;
		  } // end if
		  if($("#pass").val() == ""){
			  alert("비밀번호는 필수입력~!!");
			  $("#pass").focus();
			  return;
		  } // end if
		  
		 $("[name='writeFrm']").submit(); 
	  }); // click
	  
	  $("#btnUpdate").click(function(){
		  if($("#summernote").val() == ""){
			  alert("이벤트 내용은 필수입력~!!");
			  $("#summernote").focus();
			  return;
		  } // end if
		  if($("#pass").val() == ""){
			  alert("비밀번호는 필수입력~!!");
			  $("#pass").focus();
			  return;
		  } // end if
		  
		  $("[name='pageFlag']").val("update_process");
		  $("[name='readFrm']").submit();
		  
	  }); // click
	  
	  $("#btnRemove").click(function(){
		  if($("#pass").val() == ""){
			  alert("비밀번호는 필수입력~!!");
			  $("#pass").focus();
			  return;
		  } // end if
		  
		  $("[name='pageFlag']").val("delete_process");
		  $("[name='readFrm']").submit();
	  }); // click
	  
	}); // ready
	
	 function writeEvt(year, month, day, pageFlag, evtCnt){
		  if( evtCnt > 4 ){
			  alert("하루에 작성 가능한 이벤트의 수는 5건까지 입니다.");
			  return;
		  } // end if
		  
		  $("[name='param_year']").val(year);
		  $("[name='param_month']").val(month);
		  $("[name='param_day']").val(day);
		  $("[name='pageFlag']").val(pageFlag);
		  $("[name='diaryFrm']").submit();
	  } // writeEvt
	  
		  function readEvt(num, year, month, day){
			  $("[name='param_year']").val(year);
			  $("[name='param_month']").val(month);
			  $("[name='param_day']").val(day);
			  $("[name='pageFlag']").val("read_form");
			  $("[name='num']").val(num);
			  $("[name='diaryFrm']").submit();
		  } // readEvt
	  
</script>
<script type="text/javascript">


</script>
<!-- summernote 관련 library 끝 -->

<!-- Tooltip 시작 -->
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../common/js/jquery-ui.js"></script>
<script>
  $( function() {
    $( document ).tooltip1({
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
	z-index: 100;
}

.arrow {
	width: 70px;
	height: 16px;
	overflow: hidden;
	position: absolute;
	left: 50%;
	margin-left: -35px;
	bottom: -16px;
	z-index: 1;
}

.arrow.top {
	top: -16px;
	bottom: auto;
}

.arrow.left {
	left: 20%;
}

.arrow:before {
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
	background-color: #fff;
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

			<div id="diaryWrap">
				<%!public static final int START_DAY = 1;%>
				<%
					Calendar cal = Calendar.getInstance();
					// 오늘을 저장
					StringBuilder todate = new StringBuilder();
					todate.append(cal.get(Calendar.YEAR)).append(cal.get(Calendar.MONTH) + 1)
							.append(cal.get(Calendar.DAY_OF_MONTH));

					int nowYear = 0;
					int nowMonth = 0;
					int nowDay = cal.get(Calendar.DAY_OF_MONTH);

					// 요청했을 때 해당 월에 없는 달이 존재한다면 
					// 다음 달 1일로 설정되기 때문에 모든 달에 존재하는 날짜로 일자를 변경한다.
					cal.set(Calendar.DAY_OF_MONTH, 1);

					String param_month = request.getParameter("param_month");
					if (param_month != null && !"".equals(param_month)) {//파라메터 월이 존재하면 현재 캘린더 객체의 월을 변경
						cal.set(Calendar.MONTH, Integer.parseInt(param_month) - 1);
					}
					String param_year = request.getParameter("param_year");
					if (param_year != null && !"".equals(param_year)) {//1월에서 밑으로 가면 연도를 변경
						cal.set(Calendar.YEAR, Integer.parseInt(param_year));
					}

					nowYear = cal.get(Calendar.YEAR);
					nowMonth = cal.get(Calendar.MONTH) + 1;

					boolean toDayFlag = false;
					StringBuilder nowDate = new StringBuilder();

					nowDate.append(nowYear).append(nowMonth).append(nowDay);

					log(todate + " / " + nowDate + " / " + toDayFlag);
					if (todate.toString().equals(nowDate.toString())) {
						toDayFlag = true;
					} // end if

					pageContext.setAttribute("nowYear", nowYear);
					pageContext.setAttribute("nowMonth", nowMonth);
					pageContext.setAttribute("nowDay", nowDay);
				%>

				<form action="diary.jsp" method="post" name="diaryFrm">
					<input type="hidden" name="num" />
					<input type="hidden" name="param_month" /> 
					<input type="hidden" name="param_year" />
					<input type="hidden" name="param_day" /> 
					<input type="hidden" name="pageFlag" /> 
				</form>

				<div id="diaryTitle">
					<a href="#void" onclick="moveMonth(${ nowMonth-1==0?12:nowMonth-1 }, ${ nowMonth-1==0 ? nowYear-1:nowYear})">
						<img src="images/btn_prev.png" title="이전 월" />
					</a> 
					<span id="diaryToday" title="${ nowYear }년${ nowMonth }월">
					<c:out value="${ nowYear }" />.<c:out value="${ nowMonth }" />
					</span> <a href="#void"
						onclick="moveMonth( ${ nowMonth+1==13?1:nowMonth+1 }, ${ nowMonth+1==13?nowYear+1:nowYear })">
						<img	src="images/btn_next.png" title="다음 월" /></a>
						<a href="diary.jsp"><img src="images/btn_today.png" title="오늘" /></a>
				</div>
				<div id="diaryContent">
					<table id="diaryTab">
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
								String dayClass = ""; // 요일별 색상
								String todayCss = ""; // 오늘이거나 평일의 TD색
								int day = 0;//달력에 일을 채울 변수
								
								// 요청되는 년, 월의 모든 이벤트를 조회
								DiaryDAO d_dao = DiaryDAO.getInstance();
								try{
									MonthVO[][] monthEvtData=d_dao.selectMonthEvent(String.valueOf(nowYear), String.valueOf(nowMonth));
									
									MonthVO[] dayEvt = null; // 해당 일에 글이 존재한다면 저장할 배열
									
									String tempSubject = ""; // 20자 이상인 글을 자르기 잘라 ...을 붙이기 위해 만든 문자열형 변수
									int evtCnt = 0; // 일자별로 표시되는 이벤트 건수를 제한하기 위해 만든 정수형 변수
									
									// 매월마다 끝나는 날짜가 다르기 때문에 무한 루프를 사용한다.
									for (int tempDay = 1;; tempDay++) {
										cal.set(Calendar.DAY_OF_MONTH, tempDay);//임시 일자를 설정한다. 
										// out.println(cal.get(Calendar.DAY_OF_MONTH)+"/"+tempDay);
										if (cal.get(Calendar.DAY_OF_MONTH) != tempDay) {
	
											int week = cal.get(Calendar.DAY_OF_WEEK);
											int nextMonth = cal.get(Calendar.MONTH) + 1;
											if (week != Calendar.SUNDAY) {
												// 마지막날 뒤에 공백만드는 반복문
												int nextDay = 1;
												for (int blankTd = week; blankTd < 8; blankTd++) {
								%>
								<td class="blankTd"><div><%=nextMonth%>/<%=nextDay%></div></td>
								<%
									nextDay++;
												} // end for
													// 설정된 날까자 지금 달의 일자가 아니라면 마지막 일자 다음날 1일이므로
													// 반복문을 빠져나간다.
											} // end if
											break;
										} // end if
	
										//1일을 출력하기 전 공백을 출력한다.
										switch (tempDay) {
										case START_DAY:
											// 전달의 마지막날
											cal.set(Calendar.MONTH, nowMonth - 2);
											int prevMonth = cal.get(Calendar.MONTH) + 1; // 이전 월
											int prevLastDay = cal.getActualMaximum(Calendar.DATE); // 이전월의 마지막일
	
											cal.set(Calendar.MONTH, nowMonth - 1);
											// 다시 현재월로 변경하여 공백을 출력 1일에 맞는 공백을 출력
											int week = cal.get(Calendar.DAY_OF_WEEK);
											System.out.println(week);
											for (int blankTd = 1; blankTd < cal.get(Calendar.DAY_OF_WEEK); blankTd++) {
								%>
								<td class="blankTd"><%=prevMonth%>/<%=prevLastDay - week + blankTd + 1%></td>
								<%
									} // end for
										} // end switch
	
										//요일별 색깔 설정하기
										switch (cal.get(Calendar.DAY_OF_WEEK)) {
										case Calendar.SATURDAY:
											dayClass = "satColor";
											break;
										case Calendar.SUNDAY:
											dayClass = "sunColor";
											break;
										default:
											dayClass = "weekColor";
											break;
										} // end switch
	
										todayCss = "diaryTd"; // 평일의 CSS 설정
										if (toDayFlag) { // 요청한 년월일과 오늘의 년월일이 같다면
											if (nowDay == tempDay) { // 오늘일자에만 다른 CSS를 적용한다.
												todayCss = "todayTd";
											} // end if
										} // end if
								%>
								<form enctype="application/x-www-form-urlencoded"></form>
								<td class="<%=todayCss%>">
								<%
									dayEvt = monthEvtData[tempDay-1];
									evtCnt = 0;
									if(dayEvt != null){ 
										// 해당 일자의 이벤트 건수를 저장
										evtCnt = dayEvt.length;
									} // end if
								%>
									<div>
										<a href="#void" onclick="writeEvt(${ nowYear }, ${ nowMonth }, <%= tempDay %>,'write_form',<%= evtCnt %>)">
											<span class="<%=dayClass%>">
												<%=tempDay%>
											</span>
										</a>
									</div>
									<div>
									<% if(dayEvt != null){ 
											for(int i=0; i < dayEvt.length; i++){
											tempSubject = dayEvt[i].getSubject();
											if( tempSubject.length() > 21){
												tempSubject=tempSubject.substring(0, 20)+"...";
											} // end if
									%>
										<%-- <img src="images/evtflag.png" title="<%= dayEvt[i].getSubject() %>"/> --%>
										<a href="#void" onclick="readEvt(<%= dayEvt[i].getNum()
										%>, ${ nowYear }, ${ nowMonth }, <%= tempDay %>)"><img src="images/evtflag.png" title="<%= tempSubject %>"/></a>
									<%} // end for
										} // end if %>
									</div>
								</td>
								<%
									//토요일이면 줄변경
										switch (cal.get(Calendar.DAY_OF_WEEK)) {
										case Calendar.SATURDAY:
											out.println("</tr><tr>");
										}//end switch
									} //end for
								} catch ( SQLException sqle ){
									sqle.printStackTrace();
							%>
									<tr>
										<td colspan="7" style="text-align:center; height:400px">
											<img src="images/construction.jpg" title="죄송합니다. 빠른 시일내에 처리하도록 하겠습니다." />
										</td>
									</tr>
							<%
								} // end catch
							%>
						</tr>
					</table>
				</div>
				
				<div id="diaryJob">
					<c:if test="${ not empty param.pageFlag }">
						<c:import url="${ param.pageFlag}.jsp" />
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="footerTitle">copyright&copy; all right reserve class 4</div>
	</div>
	</div>
</body>
</html>