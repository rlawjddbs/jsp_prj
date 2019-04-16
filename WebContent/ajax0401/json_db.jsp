<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="json0328.JsonService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	JSONObject empData = null;
	String deptno = request.getParameter("deptno");
	try{
		int intDeptno = Integer.parseInt(deptno);
		JsonService js = new JsonService();
		empData = js.searchEmpData( intDeptno );
	} catch (NumberFormatException nfe){
		empData = new JSONObject();
		empData.put("result",false);
		SimpleDateFormat sdf = new SimpleDateFormat();
		empData.put("pubData", sdf.format(new Date()));
		empData.put("resultData",null);
	} // end catch
		out.println( empData.toJSONString() );
%>