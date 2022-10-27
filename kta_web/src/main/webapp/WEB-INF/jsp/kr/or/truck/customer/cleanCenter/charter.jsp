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
 						<h2><img src="/images/truck/asso/clean_tit.gif" alt="윤리경영" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<span>윤리경영</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/clean_con_tit.gif" alt="투철한 윤리의식을 지니며, 윤리경영을 실천하겠습니다" /></p>
					<div class="cleanC">
						<p>화물공제조합 감사실과 제보자와의 직접 접속이 가능합니다&#46;</p>
						<a class="btn" href="/customer/cleanCenter/cleanCenterIndex.do"><img alt="클린센터" src="/images/truck/asso/btn_clean.gif"></a>
					</div>
					<div class="conSection">
						<div class="cleanArea01">
							<h4 class="h4Tit"><img src="/images/truck/asso/clean_tab1_tit.gif" alt="우리 전국화물자동차공제조합 임직원은" /></h4>
							<p class="txt01">각자 맡은 바 직무에 열성을 가지고 최선을 다하여 조합원 및 업계 관계자는 물론 교통사고 피해 국민으로부터 신뢰 받을 수 있도록 우리 공제 조합의
							위상을 재정비하고 우리 모두가 올바른 사고방식을 갖고 밝고 명랑한 직장문화 속에서 화합과 단결을 도모하며 선공후사의 정신으로 정도 경영을 
							실천하고자 윤리헌장을 제정하여 우리 모두가 이를 가치판단의 기준으로 삼아 성실히 실천한다&#46;</p>
						</div>
						<div class="cleanArea02">
							<ul>
								<li class="charterLi01">
									<h5 class="h5Tit">조합원의 권익</h5>
									<p>우리는 조합원의 권익을 최우선 가치로 삼고 효율적 경영과 공정한 업무처리를 통하여 조합원의 요구와 기대에 부응한다&#46;</p>
								</li>
								<li class="charterLi02">
									<h5 class="h5Tit">부정 비리 척결</h5>
									<p>우리는 부정과 비리를 척결하여 투명한 업무 풍토를 조성하고 모든 피해국민의 권리를 존중하고 보호하여 신뢰받는 조합이 되도록 노력한다&#46;</p>
								</li>
								<li class="charterLi03">
									<h5 class="h5Tit">임직원의 존엄성</h5>
									<p>우리는 임직원 개개인의 인간적 존엄성을 존중하며 각자의 자질과 능력에 따라 공평한 기회를 제공하고 정당한 평가를 받을  수 있도록 노력한다&#46;</p>
								</li>
								<li class="charterLi04">
									<h5 class="h5Tit">국가 사회 존중</h5>
									<p>우리는 국가와 사회의 가치관을 존중하고 제반 법규를 준수하며 임직원 모두 건전한 사고와 성실한 자세로 직무에 최선을 다하여 국가발전에 기여할 수 있도록 노력한다&#46;</p>
								</li>
								<li class="charterLi05">
									<h5 class="h5Tit">녹색 성장</h5>
									<p>우리는 생명을 존중하고 환경보호 활동에 앞장서며 녹색성장을 이루어 나가는데 노력한다&#46;</p>
								</li>
							</ul>
						</div>
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