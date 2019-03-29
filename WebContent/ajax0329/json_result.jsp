<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = "김정윤";
	int age = 30;
	
	JSONObject json = new JSONObject();
	json.put("name", name);
	json.put("age", age);
	
	out.println( json.toJSONString() );
	
%>