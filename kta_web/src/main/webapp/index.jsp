<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <jsp:forward page="/main/index.do"/> --%>
<script language='javascript'>
if ( (navigator.userAgent.match(/iPhone/i))||    //아이폰
   (navigator.userAgent.match(/iPod/i))||          //아이팟
   (navigator.userAgent.match(/iPad/i))||          //아이패드
   (navigator.userAgent.match(/android/i)))       //안드로이드 계열
 
{
	window.location.href='http://m.truck.or.kr/m/main.do';
} else {
	//window.location.href='https://www.truck.or.kr/main/index.do';
	window.location.href='http://localhost:8080/main/index.do';
}
</script>