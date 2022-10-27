<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
</head>
<body>
	<!---- 팝업크기 width700px height480px ----->
	<div id="guidePop">
		<div class="pinfoTit">
			<h2>카드수납시스템 접속 안내</h2>
		</div>
		<div class="pinfoBox">
			<div class="roundBox">
				<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
				<!-- 내용 -->
				<div class="pinfoArea">
					<p>카드수납 시스템 접속 시 빈 화면만 출력되는 경우 아래와 같이 조치하시기 바랍니다&#46;</p>
				</div>
				<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
			</div><!--// roundBox e -->
			
			
			<ul class="pinfoLi clfix">
				<li>"인터넷 실행 > 도구 > 인터넷 옵션 > 고급" 으로 이동</li>
				<li>아래와 같이 보안관련 옵션 선택 후 확인</li>
			</ul>
			<h3><img src="/images/truck/dedu/cardGuide.gif" alt="신용카드 수납시스템 오류화면" /></h3>
		</div>
	</div>
</body>
</html>