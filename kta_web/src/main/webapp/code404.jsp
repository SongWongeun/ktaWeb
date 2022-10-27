<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script language="javascript">
/* 이전페이지 function */
function fncGoAfterErrorPage(){
    history.back(-2);
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
</script>
</head>
<body>
<div class="errorWrap">
	<h1><img src="/images/truck/etc/error_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" ></h1>
	<div class="roundBox">
		<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
		<!-- error message s -->
		<div class="errorArea clfix">
			<p class="errTxt01">요청하신 페이지를 찾을 수 없습니다&#46;</p>
			<ul>
				<li>방문하시려는 페이지의 주소가 잘못 입력되었거나&#44; 페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다&#46;</li>
				<li>입력하신 주소가 정확한지 <span class="errTxt02">다시 한번 확인</span>해 주시기 바랍니다&#46;</li>
			</ul>
			<!-- 버튼 -->
			<div class="btnGroup">
				<a href="#;" onclick="goIndex();" ><img src="/images/truck/btn/btn_home.gif" alt="홈으로 이동" /></a>
				<a href="#;" onclick="fncGoAfterErrorPage();"><img src="/images/truck/btn/btn_pre.gif" alt="이전페이지로 가기" /></a>
			</div>
		</div>
		<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
	</div>
</div>
</body>
</html>