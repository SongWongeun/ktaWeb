<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/truck/common.js"></script>
<title>휴면계정관리</title>
<style>
.A1 {
	margin:0 auto;
	width:300px;
	padding:30px;
}

.A1 td{
	text-align:center;
}
.A2{
	padding:15px 30px;
}
.A3{
	text-align:center;
}
.hu{
	text-align:center;
	background-color:skyblue;
	padding:5px 15px;
	border-radius:10px;
}
.tal{
	text-align:center;
	background-color:grey;
	padding:5px 15px;
	border-radius:10px;
}

.A4{
	background-color:pink;
	border-radius:10px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".hu").on("click",function(){
		$("#dormancyList").show();
		$("#outList").hide();
		$(this).css("background-color","skyblue");
		$(".tal").css("background-color","grey");
	});
	$(".tal").on("click",function(){
		$("#outList").show();
		$("#dormancyList").hide();
		$(this).css("background-color","skyblue");
		$(".hu").css("background-color","grey");
	});
});
</script>
</head>
<body>
<div class="A3"><span class="hu">휴면</span>&nbsp;&nbsp;&nbsp;<span class="tal">탈퇴</span></div>
<div id="dormancyList">
<div style="float:right" class="A2"><span class="A4">휴면전환</span></div>
<table class="A1">
	<tr>
		<th></th>
		<th>아이디</th>
		<th>최근접속일</th>
	</tr>
	<c:if test="${not empty dormancyList }">
	<c:forEach items="${dormancyList }" var="dormancy">
		<tr>
			<td></td>
			<td>${dormancy.ID }</td>
			<td>${dormancy.JOINDATE }</td>
		</tr>
	</c:forEach>
	</c:if>
</table>
</div>

<div id="outList" style="display:none;">
<div style="float:right" class="A2"><span class="A4">탈퇴</span></div>
<table class="A1">
	
	<tr>
		<th></th>
		<th>아이디</th>
		<th>휴면전환일</th>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td>
		<td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
	<tr>
		<td><input type="checkbox"  checked="checked"/></td>
		<td>탈퇴아이디</td><td>2016/07/21</td>
	</tr>
</table>
</div>
</body>
</html>