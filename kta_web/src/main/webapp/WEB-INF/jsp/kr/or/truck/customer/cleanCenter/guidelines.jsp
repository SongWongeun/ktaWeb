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
						<span>윤리지침</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/clean_con_tit.gif" alt="투철한 윤리의식을 지니며, 윤리경영을 실천하겠습니다" /></p>
					<div class="conSection">
						<!-- clean center Tab s -->
						<div class="cleanTabs">
							<p class="tabsMenu">
								<a href="/customer/cleanCenter/charter.do" class="tabs01"><span class="hide">윤리헌장</span></a>
								<a href="/customer/cleanCenter/doctrine.do" class="tabs02"><span class="hide">윤리강령</span></a>
								<a href="/customer/cleanCenter/guidelines.do" class="tabs03 on"><span class="hide">윤리지침</span></a>
								<a href="/customer/cleanCenter/cleanCenterIndex.do" class="tabs04"><span class="hide">클린센터</span></a>
							</p><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 윤리지침 -->
								<div class="tabCont">
									<h3 class="hide">윤리지침</h3>
									<div class="list">
										<h4 class="cleanH4">제 1 장 총칙</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제1조&#40;목적&#41;</p>
											<ul class="txtListst01">
												<li>이 지침은 전국화물자동차공제조합&#40;이하 &#34;공제조합&#34;이라 한다&#41;의 윤리 헌장과 윤리 강령에서 정하고 있는 사항에 대하여 임&#183;직원이 준수하여야 할<br />행동기준과 운영기준을 정함을 목적으로 한다&#46; </li>
											</ul>
											<p class="txtPoint">제2조&#40;정의&#41;</p>
											<p class="txtPoint">이 윤리헌장 및 윤리강령 운영 지침&#40;이하 &#34;윤리지침&#34;이라 한다&#41;에서 사용하는 용어의 정의는 다음과 같다&#46; </p>
											<ol class="txtListst02">
												<li>&#9312; &#34;직무&#34;라 함은 자신의 담당 업무는 물론 다른 임&#183;직원의 소관 업무라도 자신이 영향력을 행사할 수 있는 업무를 포함 한다&#46; </li>
												<li>&#9313; &#34;직무관련자&#34;라 함은 임&#183;임ㆍ직원의 소관업무와 관련되는 자로서 개인 또는 단체를 말한다&#46; </li>
												<li>&#9314; &#34;금품&#34;이라 함은 금전&#44; 선물&#44; 향응 등 경제적 이익을 말한다&#46; </li>
												<li>&#9315; &#34;선물&#34;이라 함은 대가없이 제공되는 물품&#44; 유가증권&#44; 숙박권&#44; 회원권&#44; 입장권 등을 말한다&#46; </li>
												<li>&#9316; &#34;향응&#34;이라 함은 식사&#44; 음주&#44; 스포츠&#44; 오락&#44; 교통&#44; 숙박 등의 접대 및 편의제공으로 사회 통념상의 판단기준에 의한 수혜를 말한다&#46; </li>
											</ol>
											<p class="txtPoint">제3조&#40;적용대상&#41;</p>
											<ul class="txtListst01">
												<li>이 윤리지침은 공제조합의 임&#183;직원&#40;계약직 포함&#41;에게 적용한다&#46; </li>
											</ul>
										</div><!--// 윤리지침 제 1 장 -->
										<h4 class="cleanH4">제 2 장 공정한 직무수행</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제4조&#40;특혜의 배제&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 직무를 수행함에 있어 지연&#44; 혈연&#44; 학연 등을 이유로 특정개인이나 단체를 우대하거나 차별하여서는 아니 된다&#46; </li>
											</ul>
											<p class="txtPoint">제5조&#40;알선&#44; 청탁 등 금지&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 자기 또는 타인의 부당한이익을 위하여 다른 임&#183;직원의 공정한 직무수행을 저해하는 알선&#44; 청탁 등을 하여서는 아니 된다&#46; </li>
											</ul>
											<p class="txtPoint">제6조&#40;인사 청탁 등 금지&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원 자신 또는 다른 임&#183;직원의 임용&#44; 승진&#44; 전보 등 인사에 부당하게 개입하여서는 아니 된다&#46; </li>
												<li>&#9313; 임&#183;직원 자신 또는 다른 임&#183;직원의 임용&#44; 승진&#44; 전보 등 인사에 관하여 부당한 영향을 미치기 위하여 타인으로 하여금 인사업무를 담당하는 자에게 청탁을 하게<br />하여서는 아니 된다&#46; </li>
											</ol>
											<p class="txtPoint">제7조&#40;이해관계 직무의 회피&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원은 자신이 수행하는 직무가 자신 또는 임&#183;직원의 4촌 이내 친족이 관련되어 공정한 직무수행이 어렵다고 판단되는 경우에는 당해 직무의 회피 여부 등과<br />관련하여 상급자와 상담 후 처리하여야 한다&#46; </li>
												<li>&#9313; 제1항의 규정에 의한 상담 요청을 받은 상급자는 당해 임&#183;직원이 그 직무를 계속 수행 하는 것이 적절하지 아니하다고 판단되는 경우에는 이사장에게 보고하여야 한다&#46;<br />다만&#44; 상급자가 그 권한의 범위 안에서 당해 임&#183;직원의 직무를 일시적으로 재배정할 수 있는 경우에는 당해 직무를 재배정하고 이사장에게 보고하여야 한다&#46; </li>
												<li>&#9314; 제2항의 규정에 의한 보고를 받은 이사장은 직무가 공정하게 처리될 수 있도록 인력 또는 직무를 재배치하는 등 필요한 조치를 하여야 한다&#46; </li>
											</ol>
											<p class="txtPoint">제8조&#40;예산의 목적 외 사용금지&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 업무수행을 위한 예산을 목적 외의 용도로 사용함으로써 공제조합에 대하여 재산상 손해를 가하여서는 아니 된다&#46; </li>
											</ul>
											<p class="txtPoint">제9조&#40;정보의 유출 및 활용 금지&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 회계기록 기타 재무관리는 회계규정 등 관련규정과 지침 및 일반 회계원칙 등에 따라 사실에 근거하여 정확하고 투명하게 기록&#183;관리하여야 한다&#46; </li>
											</ul>
											<p class="txtPoint">제10조&#40;투명한 회계관리&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원은 직무수행과 관련하여 취득한 중요한 정보를 이사장의 사전허가나 승인 없이 제3자에게 누설하여서는 아니 된다&#46; </li>
												<li>&#9313; 임&#183;직원은 직무수행과 관련하여 취득한 중요한 정보를 이용하여 자기 또는 타인이 재산상 이득을 취하게 하는 행위를 하여서는 아니 된다&#46; </li>
											</ol>
										</div><!--// 윤리지침 제 2 장 -->
										<h4 class="cleanH4">제 3 장 부당이득의 수수 금지 등</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제11조&#40;이권개입 등 금지&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원 직위를 이용하여 부당한 이익을 얻거나 타인이 부당한 이익을 얻도록 하여서는 아니 된다&#46; </li>
												<li>&#9313; 임&#183;직원 자기 또는 타인의 부당한 이익을 위하여 공제조합의 명칭 또는 자신의 직위를 이용하거나 타인으로 하여금 이용하게 하여서는 아니 된다&#46; </li>
											</ol>
											<p class="txtPoint">제12조&#40;재산의 사적사용 및 수익금지&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 업무용 차량&#44; 각종 사업용 또는 사무용으로 제공되는 물품 등 공제조합 소유재산을 정당한 사유 없이 사적인 용도로 사용 및 수익하여서는 아니 된다&#46; </li>
											</ul>
											<p class="txtPoint">제13조&#40;금품 등의 수수제한&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원 직무관련자로부터 금전&#44; 선물&#44; 향응 등&#40;이하 &#34;금품 등&#34;이라 한다&#41;을 받아서는 아니 된다&#46; 다만&#44; 다음 각 호에 해당하는 경우에는 그러하지 아니하다&#46;
													<ol class="pL10">
														<li>1&#46; 직무 수행상 부득이한 경우에 통상적인 관례의 범위&#40;1인당 5만원 한도&#41;안에서 제공되는 음식물 또는 편의</li>
														<li>2&#46; 직무와 관련된 공식적인 행사에서 주최자가 참석자에게 일률적으로 제공하는 교통&#44; 숙박 또는 음식물</li>
														<li>3&#46; 불특정 다수인에게 배포하기 위한 기념품 또는 홍보용 물품</li>
														<li>4&#46; 공개행사에서 제공되는 꽃&#44; 기념품 등 간소한 선물</li>
														<li>5&#46; 통상적인 관례의 범위 안에서 제공되는 소액&#40;1인당 5만원 한도&#41;의 선물</li>
														<li>6&#46; 그밖에 원활한 직무수행 등을 위하여 이사장이 허용하는 범위 안에서 제공되는 금품 등</li>
													</ol>
												</li>
												<li>&#9313; 임&#183;직원 배우자 또는 직계 존&#183;비속이 임&#183;직원의 직무와 관련하여 제1항에서 정하고 있는 금품 등을 받은 경우에 임&#183;직원이 받은 것으로 판단한다&#46; </li>
											</ol>
											<p class="txtPoint">제14조&#40;금품 등 제공 금지&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 임&#183;직원은 공제조합의 이익을 목적으로 직무관련이 있는 공무원&#44; 직무관련자등에게 금품 등을 제공하여서는 아니 된다&#46;<br />다만&#44; 제13조 제1항 단서에서 정한 금품 등의 경우에는 그러하지 아니하다&#46; </li>
												<li>&#9313; 임&#183;직원의 배우자 또는 직계 존&#183;비속이 공제조합의 이익을 목적으로 제1항에서 정하고 있는 금품 등을 제공 한 경우에 임&#183;직원이 제공 한 것으로 판단한다&#46; </li>
											</ol>
											<p class="txtPoint">제15조&#40;청렴한 계약의 체결 및 이행&#41;</p>
											<ul class="txtListst01">
												<li>임&#183;직원은 공제조합에서 시행하는 모든 공사&#44; 용역&#44; 물품구매 등의 입찰&#183;계약 및 이행에 있어서 건물관리규정&#44; 주택대여규정&#44; 계약규정 등<br />관련규정에서 정하고 있는 절차에 따라 공정하고 투명하게 업무를 수행하여야 한다&#46; </li>
											</ul>
										</div><!--// 윤리지침 제 3 장 -->
										<h4 class="cleanH4">제 4 장 지침의 준수</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제16조&#40;금품 등 제공 금지&#41;</p>
											<ul class="txtListst01">
												<li>이사장은 윤리헌장&#44; 윤리강령&#44; 윤리지침을 누구든지 쉽게 열람할 수 있도록 공제조합 홈페이지에 게재하여야 한다&#46; </li>
											</ul>
											<p class="txtPoint">제17조&#40;위반행위의 제보&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 이사장은 임&#183;직원이 윤리 지침을 위반한 사실에 대하여 공제 조합에 제보할 수 있도록 조치 하고&#44; 제보 방법&#44; 절차&#44; 제보자의 신분 보장 등에 대하여 알려주어야 한다&#46; </li>
												<li>&#9313; 누구든지 임&#183;직원이 지침을 위반한 사실을 알게 된 때에는 제1항에서 정하는 방법에 따라 제보할 수 있다&#46; </li>
											</ol>
											<p class="txtPoint">제18조&#40;제보인의 신분보장&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 제17조의 규정에 의한 제보인과 제보내용에 대하여 비밀을 보장 하여야하며&#44; 제보인이  제보에 따른 어떠한 차별이나 불이익을 받지 아니하도록 하여야 한다&#46;</li>
												<li>&#9313; 제1항의 규정에도 불구하고 차별이나 불이익을 받은 제보인은 이사장에게 보호조치 및 불이익의 구제 등을 요청 할 수 있으며&#44;<br />이 경우 이사장은 그에 필요한 적절한 조치를 취하여야 한다&#46; </li>
												<li>&#9313; 제17조 규정에 의한 제보를 함으로써 자신의 부정행위가 발견된 경우 그 제보인에 대한 징계 처분 등을 함에 있어서는 이를 감경 또는 면제할 수 있다&#46; </li>
											</ol>
											<p class="txtPoint">제19조&#40;윤리담당관 지정 및 업무&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 이사장은 감사실 직원을 윤리담당관으로 지정하여야 한다&#46; </li>
												<li>&#9313; 윤리담당관의 업무는 다음 각 호와 같다&#46; 
													<ol class="pL10">
														<li>1&#46; 제보된 내용에 대하여 보고&#40;연합회장&#44; 이사장&#41;</li>
														<li>2&#46; 제보된 내용에 대한 특별 감사실시 계획서 보고&#40;연합회장&#44; 이사장&#41;</li>
														<li>3&#46; 조사기간 중 기타 진행 사항에 대한 보고&#40;상임감사&#41;</li>
														<li>4&#46; 특별 감사 실시 결과보고&#40;연합회장&#44; 이사장&#41;</li>
														<li>5&#46; 제보된 건에 대한 관리</li>
													</ol>
												</li>
											</ol>
											<p class="txtPoint">제20조&#40;징계&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 윤리지침에 저촉된 행위를 한 임&#183;직원에 대하여는 징계 등의 필요한 조치를 취할 수 있다&#46;</li>
												<li>&#9313; 제1항의 규정에 의한 징계의 종류&#44; 절차&#44; 효력 등은 인사규정이 정하는 바에 따른다&#46; </li>
												<li>&#9313; 임원의 윤리강령&#44; 윤리지침에 대한 중대한 위배사항이 발견된 때에는 연합회장에게 보고하고&#44; 그 지시에 따른다&#46; </li>
											</ol>
											<p class="txtPoint">제21조&#40;포상&#41;</p>
											<ul class="txtListst01">
												<li>이사장은 윤리지침을 준수하고 윤리경영 정립에 기여한 임직원에 대하여는 인사평가에 반영하는 등 그에 상응한 포상을 실시할 수 있다&#46; </li>
											</ul>
										</div><!--// 윤리지침 제 4 장 -->
										<h4 class="cleanH4">제 5 장 보칙</h4>
										<div class="cleanDiv">
											<p class="txtPoint">제22조&#40;교육&#41;</p>
											<ol class="txtListst02">
												<li>&#9312; 이사장은 임&#183;직원에 대하여 윤리 헌장&#44; 윤리 강령&#44; 윤리 지침의 준수를 위한 교육 계획을 수립하고 실시하여야 한다&#46; </li>
												<li>&#9313; 제1항에 의한 교육은 매년 1회 이상 각 본&#183;지부별로 실시하되 신입사원에 대해서는 신규직원 교육 시 감사실장이 교육을 실시하여야 한다&#46; </li>
											</ol>
											<p class="txtPoint">제23조&#40;준수여부 점검&#41;</p>
											<ul class="txtListst01">
												<li>상임감사는 윤리헌장&#44; 윤리강령&#44; 윤리지침의 이행실태 및 준수여부 등을 정기감사 시에 점검하여야 한다&#46; </li>
											</ul>
											<p class="txtPoint">제24조&#40;지침의 운영&#41;</p>
											<ul class="txtListst01">
												<li>이사장은 조직의 발전상황과 환경변화에 맞추어 윤리지침의 내용을 지속적으로 보완&#44; 발전&#44; 운영하여야 한다&#46; </li>
											</ul>
										</div><!--// 윤리지침 제 5 장 -->
									</div>
									<p class="txtPoint03"><span class="bluBar">부칙</span>&#40;시행일&#41; 이 강령은 2009년 8월 1일부터 시행한다&#46; </p>
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