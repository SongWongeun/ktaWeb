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
						<h2><img src="/images/truck/dedu/medicalinfo_tit.gif" alt="진료비 지급보증 안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>진료비 지급보증 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/medicalinfo_con_tit.gif" alt="진료비 지급보증 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">진료비 지급보증 안내</h3>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">자동차보험 진료수가의 지급의사 유무와 지급한도 등을 통지</h4>
							<p class="txtPoint">공제조합은 조합원 또는 손해배상청구권자의 청구가 있거나 그 밖의 원인으로 교통사고 피해자가 발생한 것을 안 경우에는 의료기관에 자동차보험 진료수가의 지급의사 유무와 지급한도등을 통지합니다.</p>
							<p class="txtPoint">* 자동차손해배상보장법 제12조</p>
							</br>
							<h4 class="decuh4Tit">의료기관의 진료비 청구</h4>
							<p class="txtPoint">교통사고로 발생한는 진료비는 자동차공제로 처리됩니다. 이 경우 의료기관은 이에 해당하는 진료비를 교통사고 환자에게 직접 청구할 수 없습니다.</p>
							<p class="txtPoint">기존 질병 및 당해 교통사고와 관련 없는 상병에 대한 진료비는 원칙적으로 건강보험으로 처리되며, 이 경우 환자측의 본인부담금이 발생할 수 있습니다. 다만, 기존 질병이라 하여도 당해 교통사고로 인하여  악화된 경우 그 추가된 진료비는 자동차공제로 처리됩니다.</p>
							<p class="txtPoint">* 자동차손해배상보장법 제12조, 건설교통부 고시 「자동차보험 진료수가에 관한 기준」제5조 제1항 및 2항 </p>
							</br>
							<h4 class="decuh4Tit">장애가 발생하는 경우</h4>
							<p class="txtPoint">장애가 발생할 경우 「맥브라이드식 장애평가방법」에 따라 일반의 옥내 또는 옥외 근로자를 기준으로 실직적으로 부상 치료 진단을 실시한 의사 또는 해당과목 전문의가 진단·판정한 타당한 노동능력상실률을 적용하며, 그 판정과 관련하여 다툼이 있는 경우 공제금 청구권자와  조합이 협의하여 정한 제3의 전문의료기관의 전문의에게 판정을 의뢰할 수 있습니다.</p>
							</br>
							<h4 class="decuh4Tit">기왕증으로 인한 손해</h4>
							<p class="txtPoint">기왕증으로 인한 손해는 보상하지 아니합니다. 다만, 당해 자동차사고로 인하여 기왕증이 악화된 경우에는 기왕증이 손해에 관여한 정도(기왕증 관여도)를 반영하여 보상합니다.</p>
							<p class="txtPoint">기왕증은 해당과목 전문의가 판정한 비율에 따라 공제합니다. 다만, 그 판정에 다툼이 있을 경우 공제금 청구권자와 공제조합이 협의하여 정한 제3의 전문의료기관의 전문의에게 판정을 의뢰할 수 있습니다.</p>
							<p class="txtPoint">* ‘기왕증’ 이란 함은 당해 자동차사고가 있기 전에 이미 가지고 있던 증상으로 특이체질 및 병적 소인등을 포함하는 것을 말합니다.</p>
						</div><!--// 대인배상 I e -->						
								
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