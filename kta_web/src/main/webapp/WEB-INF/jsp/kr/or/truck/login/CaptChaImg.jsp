<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="kr.or.truck.util.captcha.CaptCha"%>
<%
	out.clear();
	pageContext.pushBody();
    new CaptCha().getCaptCha(request, response); 
%>