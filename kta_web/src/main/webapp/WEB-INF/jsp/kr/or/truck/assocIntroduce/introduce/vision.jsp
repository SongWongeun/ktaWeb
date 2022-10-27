<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/asso/vision_tit.gif" alt="설립목적및비전" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>설립목적 및 비전</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/vision_con_tit.gif" alt="운수사업자의 공동목적을 달성하기 위해 설립된 화물공제조합의 설립목적입니다" /></p>
					<div class="conSection">
						<div class="vision_img"><p class="hide">화물공제조합이란 법률상 손해배상 책임을 상호분담처리 화물운송사업자의경영합리화 피해국민의 보호를 위한 사회보장기능 운송사업자의 자동차 사고로 인란 손해배상 책임의 보상사업을 수행</p></div>
						<h3><img src="/images/truck/asso/vision_txt.gif" alt="화물운송사업자의 경영합리화와 피해국민의 보호를 위한 사회보장 기능을 수행하는 화물공제조합" /></h3>
						<p class="txt01">화물자동차운수사업법 제50조에 의거 운수사업자의 공동목적을 달성하기 위하여 설립된 &#34;전국화물자동차운송사업연합회&#34;가 운송사업자의 자동차 사고로 인한 손해배상책임의 보장사업을 수행하기 위하여 동법 제51조에 따라 1981&#46; 7&#46; 1 설립한 공제조합은 화물운송사업을 영위하는 동업자의 상부상조를
						바탕으로 조합원이 소유한 자동차의 사고로 인하여 타인에게 지는 법률상 손해배상 책임을 상호분담 처리함으로서 화물운송사업자의 경영합리화와 피해국민의 보호를 위한 사회보장 기능을 수행하고자 설립되었습니다&#46;</p>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>