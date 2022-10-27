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
						<h2><img src="/images/truck/dedu/prodinfo_tit.gif" alt="상품안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >상품안내</a>
						<span>법률비용 지원특약</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/lawinfo_con_tit.gif" alt="공제계약 법률비용 지원특약 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 법률비용 지원특약 -->
						<h3 class="deduh3Tit prodBg">법률비용 지원특약</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea lawBg mB0">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">공제조합&#40;이하 &#39;조합&#39;이라 함&#41;은 조합원이 공제계약자동차를 <span class="txtBlue">&#39;소유&#8901;사용&#8901;관리&#39;</span>하는 동안에 생긴 공제계약자동차의 사고로 인하여 남을 죽게 하거나 다치게 하여 형사적 책임을 지거나, 형법 제258조 제1항 또는 제2항, 교통사고처리특례법 제4조 제1항 제2호의 중상해를 입혀 발생된 손해에 대해 이 특별약관에서 정하는 바에 따라 보상해 드립니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						
						<!--  보장 금액 -->
						<div class="txtContent2" style="margin-top:20px;">
							<h4 class="decuh4Tit">보장 금액 &#40;실손보상&#41;</h4>
							<p class="txtPoint">형사합의지원금 : </p> 
							<p class="txtPoint"> · 사망 &#58; 2천만원 한도내 지급</p>
							<p class="txtPoint"> · 부상 &#58; 1 &#45; 3급 &#40;500만원 한도&#41;&#44; 4 &#45; 7급 &#40;300만원 한도&#41;내 지급</p>
							<p class="txtPoint">벌금지원금 &#58; 2천만원 한도 내 지급</p>
							<p class="txtPoint">방어비용 &#58; 300만원 한도 실손보상</p>
						</div><!--// 법률비용 지원특약 e -->
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>