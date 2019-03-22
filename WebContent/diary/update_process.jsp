<%@page import="kr.co.sist.util.ShaUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.diary.dao.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="du_vo" class="kr.co.sist.diary.vo.DiaryUpdateVO" scope="page" />
<jsp:setProperty name="du_vo" property="*" />
<%-- <% System.out.println( du_vo ); %> --%>
<%
	du_vo.setPass(ShaUtil.shaEncoding(du_vo.getPass()));
%>
<div id="readFrm">
	<%
	DiaryDAO d_dao = DiaryDAO.getInstance();
	String img="", msg="";
	try{
		int cnt = d_dao.updateEvent(du_vo);
		if( cnt == 0){ // 변경된 행이 없음 : 글 번호를 조작했거나, 비밀번호를 틀렸을 때
			img="pass_fail.png";
			msg="<br />비밀번호를 확인해 주세요.";
		} else {
			img="success.jpg";
			msg="<h1 style=\"text-align:center; margin:0;\">이벤트를 변경 하였습니다!!!</h1>";
		} // end else 
	} catch (SQLException sqle){
		sqle.printStackTrace();
		img="construction.jpg";
		msg="<br />죄송합니다. 장애처리에 최선을 다하고 있습니다.";
	} // end catch
	%>
	<img src="images/<%= img %>" /><br />
	<%= msg %>
	<input type="button" value="닫기"  class="btn" id="btnCloseFrm" style="position:relative; margin:0 auto; margin-top:10px; margin-bottom:15px; " />
</div>