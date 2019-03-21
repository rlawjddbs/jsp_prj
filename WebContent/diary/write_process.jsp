<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.diary.dao.DiaryDAO"%>
<%@page import="kr.co.sist.util.ShaUtil"%>
<%@page import="kr.co.sist.util.HangulConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="d_vo" class="kr.co.sist.diary.vo.DiaryVO" scope="page" />
<jsp:setProperty name="d_vo" property="*" />
<jsp:setProperty name="d_vo" property="ip" value="<%= request.getRemoteAddr() %>" />
<script type="text/javascript">
<%
	d_vo.setPass(ShaUtil.shaEncoding(d_vo.getPass()));
	DiaryDAO d_dao = DiaryDAO.getInstance();
	try{
		d_dao.insertEvent(d_vo);
		%>
		alert("이벤트가 정상적으로 등록 되었습니다. 작성 성공");
		<%
	} catch(SQLException sqle){
		%>
		alert("이벤트가 정상적으로 등록 되지 않았습니다. 죄송합니다.");
		<%
		sqle.printStackTrace();
	} // end catch
%>
</script>