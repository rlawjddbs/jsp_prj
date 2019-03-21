<%@page import="javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main_v20190130.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #wrap { margin: 0px auto; width: 800px; height: 860px; }
   #header { 
      position: relative; width: 800px; height: 140px; 
      background: #FFFFFF url("http://localhost:8080/jsp_prj/common/images/header_bg.png") repeat-x; }
   #headerTitle { 
      position: absolute; top: 30px; left: 300px; 
      font-family: 'HY견고딕', '고딕'; font-size: 30px; font-weight: bold; text-align: center; }
   #container { width: 800px; height: 600px; }
   #footer { width: 800px; height: 120px; font-family: '나눔고딕', '돋움'; font-weight: bold; }
   #footerTitle { float: right; font-size: 15px; padding-top: 20px; padding-right: 20px; }
   
   /* 달력 설정 시작 */
    #diaryTab { margin: 0px auto; border-spacing: 0px; border-collapse: collapse; }
    #diaryContent { position: relative; }
    #diaryJob { position: absolute; top: 100px; left: 200px; }
   .sunTitle { 
      border: 1px solid #CECECE; width: 80px; height: 25px; 
      font-weight: bold; color: #FFFFFF; background-color: #fc5c65; }
   .weekTitle { border: 1px solid #CECECE; width: 80px; height: 25px; }
   .satTitle { 
      border: 1px solid #CECECE; width: 80px; height: 25px; 
      font-weight: bold; color: #FFFFFF; background-color: #70a1ff; }
   #diaryTitle { margin-top: 20px; margin-bottom: 10px; text-align: center; }
   #diaryToday { width: 100px; font-family: 고딕체; font-size: 27px; font-weight: bold; }
   .diaryTd { 
      border: 1px solid #CECECE; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; }
   .blankTd { 
      border: 1px solid #CCCCCC; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; }
   .prevTd { 
      border: 1px solid #CCCCCC; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; color: gray; }
   .nextTd { 
      border: 1px solid #CCCCCC; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; color: gray; }
   .satTd { border: 1px solid #CECECE; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #70a1ff; }
   .sunTd { border: 1px solid #CECECE; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #fc5c65; }
   .todayTd { border: 1px solid #CECECE; width: 100px; height: 80px; 
      text-align: left; vertical-align: top; 
      font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #7bed9f; }
   .basicColorTd { color: #000000; }
   .specialColorTd { color: #FFFFFF; }
   /* 달력 설정 종료 */
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
      }
    }
  });
} );
</script>
<style>
.ui-tooltip, .arrow:after {
  background: black;
  border: 2px solid white;
}
.ui-tooltip {
  padding: 10px 20px;
  color: white;
  border-radius: 20px;
  font: bold 14px "Helvetica Neue", Sans-Serif;
  text-transform: uppercase;
  box-shadow: 0 0 7px black;
}
.arrow {
  width: 70px;
  height: 16px;
  overflow: hidden;
  position: absolute;
  left: 50%;
  margin-left: -35px;
  bottom: -16px;
}
.arrow.top {
  top: -16px;
  bottom: auto;
}
.arrow.left {
  left: 20%;
}
.arrow:after {
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
}
.arrow.top:after {
  bottom: -20px;
  top: auto;
}
</style>
<script type="text/javascript">
   function moveMonth(year, month) {
      //location.href = "diary.jsp?param_year=" + year + "&param_month=" + month;
      /* 
      var obj = document.diaryFrm;
      
      obj.param_year.value = year;
      obj.param_month.value = month;
      
      obj.submit();
      */
      
      $("[name='param_year']").val(year);
      $("[name='param_month']").val(month);
      
      $("[name='diaryFrm']").submit();
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
            <%!
               public static final int START_DAY = 1;
            %>
            <%
               Calendar cal = Calendar.getInstance();
               
               // 오늘 저장
               StringBuilder todate = new StringBuilder();
               
               todate.append(cal.get(Calendar.YEAR)).append(cal.get(Calendar.MONTH) + 1).append(cal.get(Calendar.DAY_OF_MONTH));
            
               int nowYear = 0;
               int nowMonth = 0;
               int nowDay = cal.get(Calendar.DAY_OF_MONTH);
               
               // 요청했을 때 해당 월에 없는 달이 존재한다면 
               // 다음 달 1일로 설정되기 때문에 모든 달에 존재하는 날짜로 일자를 변경한다.
               cal.set(Calendar.DAY_OF_MONTH, 1);
               
               String param_year = request.getParameter("param_year");
               
               if (param_year != null && !"".equals(param_year)) {
                  // 파라미터 년이 존재하면 현재 캘린더 객체의 년을 변경
                  cal.set(Calendar.YEAR, Integer.parseInt(param_year));
               } // end if
               
               String param_month = request.getParameter("param_month");
               
               if (param_month != null && !"".equals(param_month)) {
                  // 파라미터 월이 존재하면 현재 캘린더 객체의 월을 변경
                  cal.set(Calendar.MONTH, Integer.parseInt(param_month) - 1);
               } // end if
               
               nowYear = cal.get(Calendar.YEAR);
               nowMonth = cal.get(Calendar.MONTH) + 1;
               
               boolean toDayFlag = false;
               StringBuilder nowDate = new StringBuilder();
               
               nowDate.append(nowYear).append(nowMonth).append(nowDay);
               
               if (todate.toString().equals(nowDate.toString())) {
                  // equals : todate의 주소와 nowDate의 주소가 같은지 물어본다.
                  // 오늘인 경우
                  toDayFlag = true;
               } // end if
               
               pageContext.setAttribute("nowYear", nowYear);
               pageContext.setAttribute("nowMonth", nowMonth);
               pageContext.setAttribute("nowDay", nowDay);
            %>
            <form action="diary.jsp" method="post" name="diaryFrm">
               <input type="hidden" name="param_year"/>
               <input type="hidden" name="param_month"/>
            </form>
            <div id="diaryTitle">
               <!-- #void는 항상 그대로이다. -->
               <%-- <a href="diary.jsp?param_year=${ ((nowMonth - 1) == 0) ? (nowYear - 1) : nowYear }&param_month=${ (nowMonth - 1) == 0? 12 : (nowMonth - 1) }"><img src="images/btn_prev.png" title="이전 월"/></a> --%>
               <a href="#void" onclick="moveMonth(${ ((nowMonth - 1) == 0) ? (nowYear - 1) : nowYear }, ${ (nowMonth - 1) == 0? 12 : (nowMonth - 1) })"><img src="images/btn_prev.png" title="이전 월"/></a>
               <span id="diaryToday" title="${ nowYear }년  ${ nowMonth }월">
                  <c:out value="${ nowYear }"/>.<c:out value="${ nowMonth }"/>
               </span>
               <a href="#void" onclick="moveMonth(${ (nowMonth + 1) == 13 ? (nowYear + 1) : nowYear }, ${ ((nowMonth + 1) == 13) ? 1 : (nowMonth + 1) })"><img src="images/btn_next.png" title="다음 월"/></a>
               <!-- <a href="diary.jsp"><img src="images/btn_today.png" title="오늘"/></a> -->
               <a href="#void" onclick="moveMonth('', '')"><img src="images/btn_today.png" title="오늘"/></a>
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
                     String dayClass = ""; // 요일별 색깔
                     String todayCss = ""; // 오늘의 td 색
                     String dayColor = "";
                     int nextDay = 1;
                     int prevDay = 0;
                  
                     // 매월 끝나는 날짜가 다르기 때문에 무한 루프를 사용한다.
                     for (int tempDay = 1; ; tempDay++) {
                        // 임시 일자를 설정한다.
                        cal.set(Calendar.DAY_OF_MONTH, tempDay);
                        
                        if (cal.get(Calendar.DAY_OF_MONTH) != tempDay) {
                           // 설정된 날짜가 현재 일자가 아니라면 마지막 일자 다음 일이므로 
                           // 반복문을 빠져나간다.
                           for (int blankTd = cal.get(Calendar.DAY_OF_WEEK); blankTd < 8; blankTd++) {
                              if (blankTd == 1) {
                                 break;
                              } // end if
                  %>
                              <td class="nextTd"><%= nextDay++ %></td>
                  <%
                           } // end for
                              
                           break;
                        } // end if
                        // 1일이면 
                        switch (tempDay) {
                        case START_DAY:
                           // 전 달의 마지막 날
                           cal.set(Calendar.MONTH, nowMonth - 2);
                           
                           int prevMonth = cal.get(Calendar.MONTH) + 1; // 이전 월
                           int prevLastDay = cal.getActualMaximum(Calendar.DATE); // 이전 월의 마지막 일
                           
                           cal.set(Calendar.MONTH, nowMonth - 1); // 다시 현재 월로 변경하여 공백을 출력
                           
                           int week = cal.get(Calendar.DAY_OF_WEEK);
                           
                           for (int blankTd = 1; blankTd < cal.get(Calendar.DAY_OF_WEEK); blankTd++) {
                  %>
                              <td class='prevTd'><%= prevLastDay - week + blankTd + 1 %></td>
                  <%
                           } // end for
                        } // end if
                  %>
                  <%
                        switch (cal.get(Calendar.DAY_OF_WEEK)) {
                        case Calendar.SATURDAY: dayClass = "satTd"; break;
                        case Calendar.SUNDAY: dayClass = "sunTd"; break;
                        default: dayClass = "diaryTd";
                        } // end switch
                        
                        todayCss = dayClass;
                        
                        if (toDayFlag) { // 요청한 년월일과 오늘의 년월일이 같다면
                           if (nowDay == tempDay) { // 오늘 일자에만 다른 CSS를 적용한다.
                              todayCss = "todayTd"; // 평일의 CSS 설정
                           } // end if   
                        } // end if
                        
                        dayColor = "basicColorTd";
                        
                        if ("satTd".equals(dayClass) || "sunTd".equals(dayClass) || "todayTd".equals(todayCss)) {
                           dayColor = "specialColorTd";
                        } // end if
                  %>
                     <td class="<%= todayCss %>">
                        <div><a href="#void"><span class="<%= dayColor %>"><%= tempDay %></span></a></div>
                     </td>
                  <%
                        switch (cal.get(Calendar.DAY_OF_WEEK)) {
                           case Calendar.SATURDAY:
                              out.println("</tr><tr>");
                        } // end switch
                     } // end for
                  %>
                  </tr>
               </table>
               <div id="diaryJob">
                  
               </div>
            </div>
         </div>
      </div>
      <div id="footer">
         <div id="footerTitle">Copyright &copy; Class4 All rights reserved</div>
      </div>
   </div>
</body>
</html>