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
						<h2><img src="/images/truck/asso/ceo_tit.gif" alt="인사말" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do" >조합소개</a>
						<span>인사말</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="conVisual"><img src="/images/truck/asso/asso_president_tit01.jpg" alt="사랑과 정성을 다하는 화물공제조합 신뢰받는 공제조합이 되겠습니다." /></p>
					<div class="conSection">
						<ul class="boxCeo">
							<li>
								<h3><img src="/images/truck/asso/asso_president_txt01.gif" alt="고객에게 항상 감사하는 마음으로" /></h3>
								<p class="pB30">항상 저희 전국화물자동차 공제조합을 믿고 사랑해 주신 화물운송사업자 및 종사자 여러분께 진심으로 감사 드립니다&#46;</p>
								<p>1981년 화물운송사업자의 보호와 사회복지구현이라는 설립이념 아래 현재까지 화물업계를 굳건히 지켜온 화물공제조합은 화물운송사업자 및 종사자 여러분이 마음 놓고 화물운송사업에 전념 할 수 있도록 하여 왔습니다&#46;</p>
							</li>
							<li>
								<h3><img src="/images/truck/asso/asso_president_txt02.gif" alt="합리적인 분담금을 설계하여" /></h3>
								<p class="pB30">특히 화물공제조합은 정부의 각종 규제완화 정책과 자동차 &middot; 보험 가격자유화를 계기로 조합원 위주의 차별화&#44; 특화된 마케팅 전략으로 조합원께 합리적인 분담금을 제공하여 많은 사랑을 받았습니다&#46;</p>
								<p>앞으로도 조합원의 사랑을 바탕으로 안정적인 재무구조와 투명한 윤리경영에 힘쓰며&#44; 지속적인 사고·예방을 통하여 조합원의 수익성 증대 및 수익 &middot; 구조창출을 이룩할 수 있도록 한층 더 노력하겠습니다&#46;</p>
							</li>
							<li>
								<h3><img src="/images/truck/asso/asso_president_txt03.gif" alt="고객의 사랑에 보답하고자" /></h3>
								<!-- <p class="pB30">앞으로도 조합원의 사랑을 바탕으로 안정적인 재무구조와 투명한 윤리경영에 힘쓰며&#44; 지속적인 사고예방을 통하여 조합원의 수익성 증대 및 수익 &middot; 구조창출을 이룩할 수 있도록 한층 더 노력하겠습니다&#46;</p> -->
								<p>조합원을 먼저 생각하고 언제나 사랑과 정성을 다하는 신뢰받는 화물공제조합이 되도록 노력할 것을 약속드리며 앞으로도 변함없는 성원과 사랑을 부탁드립니다&#46;</p>
							</li> 
						</ul>
						<p class="sign"><img src="/images/truck/asso/asso_president_logo.gif" alt="전국화물자동차운송사업연합회공제조합" /></p>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
		
	</div><!--// wrap div -->
</body>
</html>