<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="kr.or.truck.util.captcha.AudioCaptCha, nl.captcha.Captcha"%>
<%
	out.clear();
	pageContext.pushBody();
   //Captcha.NAME = 'simpleCaptcha'
   Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
   String getAnswer = captcha.getAnswer(); //CaptsCha Image에 사용된 문자열을 반환한다.
   new AudioCaptCha().getAudioCaptCha(request, response, getAnswer);
%>