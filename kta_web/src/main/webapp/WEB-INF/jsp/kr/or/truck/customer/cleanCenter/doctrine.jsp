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
						<a href="/customer/cleanCenter/charter.do">윤리경영</a>
						<span>윤리강령</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/clean_con_tit.gif" alt="투철한 윤리의식을 지니며, 윤리경영을 실천하겠습니다" /></p>
					<div class="conSection">
						<!-- clean center Tab s -->
						<div class="cleanTabs">
							<p class="tabsMenu">
								<a href="/customer/cleanCenter/charter.do" class="tabs01"><span class="hide">윤리헌장</span></a>
								<a href="/customer/cleanCenter/doctrine.do" class="tabs02 on"><span class="hide">윤리강령</span></a>
								<a href="/customer/cleanCenter/guidelines.do" class="tabs03"><span class="hide">윤리지침</span></a>
								<a href="/customer/cleanCenter/cleanCenterIndex.do" class="tabs04"><span class="hide">클린센터</span></a>
							</p><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 윤리강령 -->
								<div class="tabCont">
									<h3 class="hide">윤리강령</h3>
									<div class="list">
										<h4 class="cleanH4 ">제 1 장 총칙</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제1조&#40;목적&#41;</p>
											<ul class="txtListst01">
												<li>윤리강령&#40;이하 &#34;강령&#34;이라 한다&#41;은 자율적이고 진취적인 자세로 책임&#44; 공정&#44; 봉사의 자세로 부여된 직무를 성실히 수행하기 위한 올바른 의사결정과 윤리적 판단 기준을<br />임직원에게 제공함을 목적으로 한다&#46; </li>
											</ul>
											<p class="txtPoint">제2조&#40;적용대상&#41;</p>
											<ul class="txtListst01">
												<li>이 강령은 전국화물자동차운송사업자공제조합&#40;이하 &#34;조합&#34;이라 한다&#41;의 모든 임직원에 대하여 적용한다&#46; </li>
											</ul>
										</div><!--// 윤리강령 제 1 장 -->
										<h4 class="cleanH4">제 2 장 임직원의 기본윤리</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제3조&#40;임직원의 기본윤리&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 조합 직원으로서의 긍지와 자부심을 가지며 항상 정직하고 성실한 자세를 견지한다&#46; </li>
												<li>&#9313; 임직원은 높은 윤리적 가치관을 가지고 개인의 품위와 조합의 명예를 유지&#183;발전시킬 수 있도록 노력한다&#46; </li>
												<li>&#9314; 임직원은 직무를 수행함에 있어서 제반 법령과 규정을 준수함과 동시에 양심에 어긋나지 않도록 행동한다&#46; </li>
											</ol>
											<p class="txtPoint">제4조&#40;자기계발&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 국제화&#183;개방화 시대에 바람직한 인재상을 스스로 정립하고 끊임없는 자기계발을 통해 이에 부합되도록 꾸준히 노력한다&#46; </li>
											</ul>
											<p class="txtPoint">제5조&#40;공정한 직무수행&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 직무를 수행함에 있어 관련된 제반 법령과 규정을 준수하여 공정하게 수행하여야 한다&#46; </li>
												<li>&#9313; 임직원은 자기 또는 타인의 공정한 직무수행을 저해할 수 있는 부당한 지시&#44; 알선&#183;청탁&#44; 특혜부여 등 사회의 지탄을 받을 만한 비윤리적&#183;불법적 행위를 하여서는<br />아니 된다&#46;</li>
											</ol>
											<p class="txtPoint">제6조&#40;부당이득 수수금지&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 직무와 관련하여 사회통념상 용인되는 범위를 넘어 공정성을 저해할 수 있는 금품&#183;향응 등을 직무관련자에게 제공하거나 직무 관련자로부터 제공 받아서는<br />아니 된다&#46; </li>
											</ul>
											<p class="txtPoint">제7조&#40;공사구분&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 직무를 수행함에 있어서 공사를 명확히 구분하여야 한다&#46; </li>
												<li>&#9313; 임직원은 조합의 재산을 사적으로 사용하거나 조합의 예산을 목적 외의 용도로 사용하여 조합에 재산상 손해를 가해서는 아니 된다&#46; </li>
												<li>&#9314; 임직원은 근무 시간 내 사적인 일에 시간을 할애하여 업무수행에 지장을 주거나&#44; 사내 정보 통신시스템을 온라인 게임&#44; 도박&#44;음란사이트 방문 등 업무상 용도 이외의<br />부적절한 용도로 사용하여서는 아니 된다&#46; </li>
												<li>&#9315; 임직원은 허가 없이 직무 이외의 영리를 목적으로 하는 일에 종사하거나 다른 직무를 겸할 수 없다&#46; </li>
											</ol>
											<p class="txtPoint">제8조&#40;임직원상호 관계&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 상호간에 직장생활에 필요한 기본예의를 지켜야 하며 불손한 언행이나 다른 임직원을 비방하는 등의 괴로움을 주는 행위를 하여서는 아니 된다&#46; </li>
												<li>&#9313; 상급자는 하급자에게 부당한 지시를 하여서는 아니 되며 하급자는 상급자의 정당한 지시에 순응하되 부당한 지시는 거절하여야 한다&#46; </li>
												<li>&#9314; 임직원은 상호간에 성적 유혹 수치심을 유발시키는 행위를 하여서는 아니 된다&#46; </li>
											</ol>
											<p class="txtPoint">제9조&#40;투명한 정보 관리&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 모든 정보를 정당하고 투명하게 취득&#183;관리하여야 하며 정보는 정확하고 정직하게 기록&#183;관리하여야 한다&#46; </li>
												<li>&#9313; 임직원은 직무관련 취득정보를 사전허가나 승인 없이 외부로 유출하거나 부당하게 이용하여서는 아니 된다&#46; </li>
												<li>&#9314; 임직원은 특정개인이나 부서의 이익을 위해 허위 또는 과장보고를 하지 않으며 중요한 정보를 은폐하거나 독점하지 않는다&#46; </li>
											</ol>
										</div><!--// 윤리강령 제 2 장 -->
										<h4 class="cleanH4">제 3 장 고객에 대한 윤리</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제10조&#40;조합원 존중&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 조합원이 우리의 존립이유이자 목표라는 인식하에 조합원의 권익향상을 모든 행동의 최우선 기준으로 삼는다&#46; </li>
											</ul>
											<p class="txtPoint">제11조&#40;조합원 만족&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 조합원의 요구와 기대를 정확하게 파악하여 이에 부응하는 최상의 서비스를 제공하기 위해 항상 노력한다&#46; </li>
												<li>&#9313; 임직원은 조합원의 의견과 제안사항을 항상 경청하고 겸허하게 수용하며 불만사항에 대해서는 최대한 신속하고 공정하게 처리한다&#46; </li>
												<li>&#9314; 임직원은 조합원의 자산&#44; 영업비밀&#44; 개인정보 등을 소중하게 보호하며 비도덕적 행위로 인하여 조합원의 이익을 침해하지 아니한다&#46; </li>
											</ol>
											<p class="txtPoint">제12조&#40;피해자 보호&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 피해자를 비롯한 피해국민의 정당한 권리를 보호하며 공정하고 친절하게 대우한다&#46; </li>
												<li>&#9313; 임직원은 피해자의 사생활을 존중하고 보호하며 직무 수행과정에서 얻은 정보에 대하여 철저한 비밀을 준수한다&#46; </li>
											</ol>
										</div><!--// 윤리강령 제 3 장 -->
										<h4 class="cleanH4">제 4 장 거래업체에 대한 윤리</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제13조&#40;거래법규 준수&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 모든 사업 및 영업 활동을 함에 있어서 해당 제반 법규를 준수하고 상거래관습을 존중한다&#46; </li>
											</ul>
											<p class="txtPoint">제14조&#40;공정한 관리&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 조합이 시행하는 공사&#183;용역&#183;물품구매 등의 입찰 및 계약체결 등에 있어서 자격을 구비한 모든 개인 또는 단체에게 평등한 기회를 부여한다&#46; </li>
												<li>&#9313; 임직원은 모든 거래는 상호 대등한 위치에서 공정하게 수행하되 공개적이고 일상적인 업무 장소에서 투명하게 이루어지도록 한다&#46; </li>
												<li>&#9314; 임직원은 거래상 우월적인 지위를 이용하여 금품 등을 요구하거나 불공정한 거래조건 강요 등 부당한 요구를 하지 않는다&#46; </li>
											</ol>
										</div><!--// 윤리강령 제 4 장 -->
										<h4 class="cleanH4">제 5 장 임직원에 대한 윤리</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제15조&#40;임직원 존중&#41;</p>
											<ul class="txtListst01">
												<li>조합은 임직원 개개인을 존엄한 인격체로 대하고 정당한 방법으로 직무를 수행할 수 있도록 하며&#44; 직원이 직무를 통하여 긍지와 보람을 성취할 수 있도록 최선을 다한다&#46; </li>
											</ul>
											<p class="txtPoint">제16조&#40;공정한 대우&#41;</p>
											<ul class="txtListst01">
												<li>조합은 개인의 능력과 성과에 따른 공정한 평가를 통하여 직원의 업무성취동기를 유발하고 승진 등 인사관리에 있어 성별&#183;학력&#183;나이&#183;종교&#183;출신지역&#183;신체장애 등을<br />이유로 차별하지 않는다&#46; </li>
											</ul>
											<p class="txtPoint">제17조&#40;인재의 육성&#41;</p>
											<ul class="txtListst01">
												<li>조합은 임직원의 능력 개발을 적극 지원하여 전문적이고 창의적인 인재로 육성 하고&#44; 임직원의 독창적이고 자율적인 사고와 행동을 촉진하기 위하여 모든 임직원이<br />자유롭게 제안하고 의사표현을 할 수 있는 여건을 조성한다&#46; </li>
											</ul>
											<p class="txtPoint">제18조&#40;삶의 질 향상&#41;</p>
											<ul class="txtListst01">
												<li>조합은 임직원이 쾌적하고 안전하게 일할 수 있는 근무환경을 조성하고&#44; 임직원의 건강&#44; 교육&#44; 복지후생 등 삶의 질을 향상시킬 수 있도록 노력한다&#46; </li>
											</ul>
										</div><!--// 윤리강령 제 5 장 -->
										<h4 class="cleanH4">제 6 장 국가와 사회에 대한 윤리</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제19조&#40;국가와 사회발전에 기여&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임직원은 합리적이고 책임 있는 경영을 통해 건실한 조합으로 성장 발전시킴으로써 국가와 사회의 발전에 이바지 하여야 한다&#46; </li>
												<li>&#9313; 임직원은 사회 각계각층의 정당한 요구를 겸허히 수용하여 이를 해결하는데 최선을 다해야 한다&#46; </li>
											</ol>
											<p class="txtPoint">제20조&#40;부당한 정치활동 금지&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 조합은 부당하게 정치에 관여하지 않으며 정당 정치인&#183;선거후보자 등에게 불법적인 기부금 또는 경비 등을 제공하지 않는다&#46; </li>
												<li>&#9313; 조합은 임직원 개인의 정치적 견해를 존중한다&#46; 다만&#44; 임직원은 개인의 정치적 견해가 소속 단체의 정치적 입장으로 오해 받지 않도록 주의하여야 한다&#46; </li>
											</ol>
											<p class="txtPoint">제21조&#40;안전 및 위험예방&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 안전에 관한 제반법규와 기준을 준수하여 재해 및 위험예방관리에 최선을 다해야 한다&#46; </li>
											</ul>
											<p class="txtPoint">제22조&#40;삶의 질 향상&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 환경 문제의 중요성을 깊이 인식하여 국내외 환경 관련 법규를 준수하고 환경 보호 및 오염방지를 위하여 노력하여야 한다&#46; </li>
											</ul>
											<p class="txtPoint">제23조&#40;삶의 질 향상&#41;</p>
											<ul class="txtListst01">
												<li>임직원은 노사 모두가 주인임을 명심하고 신뢰와 화합을 바탕으로 노사의 공존과 번영을 위해 노력하여야 한다&#46; </li>
											</ul>
										</div><!--// 윤리강령 제 6 장 -->
										<h4 class="cleanH4">제 7 장 보칙</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제24조&#40;준수의무와 책임&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 모든 임직원은 강령을 숙지 하고 준수하여야 하며 위반 사항에 대해서는 그에 따른 책임을 진다&#46; </li>
												<li>&#9313; 이사장&#44; 임원&#44; 부서장은 소속직원의 강령 준수 여부를 관리&#183;감독할 책임이 있다&#46; </li>
											</ol>
											<p class="txtPoint">제25조&#40;포상 및 징계&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 이사장은 강령을 준수하고 윤리경영 정립에 기여한 임직원에 대하여는 인사평가에 반영하는 등 그에 상응한 포상을 실시할 수 있다&#46; </li>
												<li>&#9313; 이사장은 강령에 저촉된 행위를 한 임직원에 대하여는 징계 등 필요한 조치를 취할 수 있다&#46; </li>
											</ol>
											<p class="txtPoint">제26조&#40;강령의 운영&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 이사장은 조직의 발전상황과 환경변화에 맞추어 강령의 내용을 지속적으로 보완&#183;발전&#183;운영 하여야 한다&#46; </li>
												<li>&#9313; 이사장은 강령을 준수하고 임직원의 청렴성 유지 등을 위하여 필요한 구체적인 판단기준 및 처리절차와 그 운영에 관하여 필요한 세부사항은 별도로 정할 수 있다&#46; </li>
											</ol>
										</div><!--// 윤리강령 제 7 장 -->
									</div>
									<p class="txtPoint03"><span class="bluBar">부칙</span>&#40;시행일&#41; 이 강령은 2009년 7월 1일부터 시행한다&#46; </p>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// clean center Tab e -->
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