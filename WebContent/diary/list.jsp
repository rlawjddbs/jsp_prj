<%@page import="kr.co.sist.diary.vo.SearchDataVO"%>
<%@page import="kr.co.sist.diary.service.ListService"%>
<%@page import="kr.co.sist.diary.vo.DiaryListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.diary.vo.ListRangeVO"%>
<%@page import="kr.co.sist.diary.dao.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	#diary{ margin-top:20px; }
	#diaryHeader{ font-size:19px; font-weight:bold; text-align:center; padding:5px 0 20px 0; }
	#diaryContents{ min-height:400px; }
	#diaryIndexList{ height:30px; text-align:center; }
	
	
	#diarySearch{ height:30px; text-align:center; }
	
	#listTab{ border-top:2px solid #1289A7; border-spacing:0px; }
	#numTitle{ width:50px; height:25px; background-color:#12CBC4; color:#fff; }
	#subjectTitle{ width:350px;; height:25px; background-color:#12CBC4; color:#fff; }
	#writerTitle{ width:120px; height:25px; background-color:#12CBC4; color:#fff; }
	#evtDayTitle{ width:150px; height:25px; background-color:#12CBC4; color:#fff; }
	#wriDayTitle{ width:150px; height:25px; background-color:#12CBC4; color:#fff; }
	th, td{ border-bottom: 1px solid #ccc; }
	tr:HOVER{ background-color:#f8f8f8; }
	
	.center{ text-align:center; }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#keyword").keydown(function(evt){
			if(evt.which == 13){
				if($("#keyword").val() == ""){
					alert("검색할 키워드를 입력해 주세요.");
					return;
				} // end if
			} // end if
			
		}); // keydown
		
		$("#btn").click(function(){
			if($("#keyword").val() == ""){
				alert("검색할 키워드를 입력해 주세요.");
				return;
			} // end if
			$("#searchFrm").submit();
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
			<c:catch var="e">
				<%
				ListService ls = ListService.getInstance();
				
				String keyword = request.getParameter("keyword");
				String fieldName= request.getParameter("fieldName");
				
				SearchDataVO sd_vo = null;
				if(keyword != null && !"".equals(keyword)){ // 사용자가 검색값을 넣었을 때
					sd_vo = new SearchDataVO(fieldName, keyword);
				} // end if
				
				// 1. 전체 게시물 수 얻기 / 검색에 맞는 게시물 수 얻기
				int totalCount = ls.totalCount(sd_vo);
				// 2. 한 화면에 보여질 게시물의 수
				int pageScale = ls.pageScale();
				// 3. 총 페이지 수 구하기
				// int totalPage = (int)Math.ceil(totalCount / (double)pageScale); // 전체 페이지 구하는 방법 중 첫 번째
				int totalPage =ls.totalPage(totalCount);
				// 4. 시작 페이지 번호 구하기
				// current_page에 따라 시작번호는 달라진다. 1->1, 2->11, 3->21, 4->31
				
				// String currentPage = request.getParameter("current_page");
				String currentPage = request.getParameter("current_page");
				int startNum = ls.startNum(currentPage);
				if( currentPage != null){
					int tempPage = Integer.parseInt(currentPage);
					startNum = tempPage * pageScale - pageScale +1;
				} // end if
				
				
				
				// 5. 끝 번호 구하기
				int endNum = ls.endNum(startNum);
				
				ListRangeVO lr_vo = new ListRangeVO(startNum, endNum);
				
				List<DiaryListVO> list = ls.searchList(lr_vo, sd_vo);
				String indexList = ls.indexList("list.jsp", sd_vo, totalPage);
				pageContext.setAttribute("list", list);
				pageContext.setAttribute("totalPage", totalPage);
				pageContext.setAttribute("indexList", indexList);
				pageContext.setAttribute("totalCount", totalCount);
				pageContext.setAttribute("pageScale", pageScale);
				int cp=1;
				if( currentPage != null){
					cp = Integer.parseInt(currentPage);
				} // end if
				pageContext.setAttribute("currentPage", cp);
				%>
				<%-- 전체 페이지 수 : <%= totalCount %><br />
				한 화면에 보여질 게시물의 수 : <%= pageScale %><br />
				총 페이지 수 : <%= totalPage %><br />
				현재 페이지 번호 : <%= currentPage %><br />
				시작 번호 : <%= startNum %><br />
				끝 번호 : <%= endNum %><br /> --%>
			</c:catch>
			
			<div id="diary">
				<div id="diaryHeader">
					<span style="float:left"><a href="list.jsp"><img src="images/btn_all.png" /></a></span>
					이벤트 리스트
				</div>
				<div id="diaryContent">
					<table id="listTab">
						<tr>
							<th id="numTitle" >번호</th>
							<th id="subjectTitle">이벤트 제목</th>
							<th id="writerTitle">작성자</th>
							<th id="evtDayTitle">이벤트 일자</th>
							<th id="wriDayTitle">작성 일자</th>
						</tr>
						<c:if test="${ not empty e }">
							<tr>
								<td colspan="5">서비스가 원활하지 못한 점 죄송합니다.</td>
							</tr>
						</c:if>
						<c:if test="${ empty list }">
							<tr>
								<td colspan="5">이벤트가 존재하지 않습니다.<a href="diary.jsp">이벤트 작성</a></td>
							</tr>
						</c:if>
						<c:forEach var="data" items="${ list }">
							<c:set var="i" value="${ i + 1 }" />
							<tr>
								<%-- <td class="center"><c:out value="${ i }" /></td> --%>
								<td class="center"><c:out value="${ (totalCount - (currentPage-1)*pageScale-i)+1 }" /></td>
								<td><a href="read.jsp?num=${ data.num }"><c:out value="${ data.subject }" /></a></td>
								<td class="center"><c:out value="${ data.writer }" /></td>
								<td class="center"><c:out value="${ data.e_year }-${ data.e_month }-${ data.e_day }" /></td>
								<td class="center"><c:out value="${ data.w_date }" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div id="diaryIndexList">
					<%-- <c:forEach var="i" begin="1" end="${ totalPage }" step="1">
						[ <a href="list.jsp?current_page=${ i }">${ i }</a> ]
					</c:forEach> --%>
					<!-- escapeXml="false" 은 c:out으로 태그를 출력할 때 -->
					<c:out value="${ indexList }" escapeXml="false" />
				</div>
				
				
				<div id="diarySearch">
					<form action="list.jsp" method="get" id="searchFrm" name="searchFrm">
						<select name="fieldName" class="inputBox">
							<option value="subject"${ param.fieldName eq'subject'?" selected='selected'":"" }>제목</option>
							<option value="contents"${ param.fieldName eq'subject'?" selected='selected'":"" }>내용</option>
							<option value="writer"${ param.fieldName eq'subject'?" selected='selected'":"" }>작성자</option>
						</select>					
						<input type="text" name="keyword" class="inputBox" style="width:250px;" id="keyword" value="${ param.keyword }"/>
						<input type="button" id="btn" value="검색" class="btn"/>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<div id="footerTitle">copyright&copy; all right reserve class 4</div>
		</div>
	</div>
</body>
</html>